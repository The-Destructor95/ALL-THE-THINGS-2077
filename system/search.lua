-- ATT 2.5 — Global Search
--
-- Cross-category search across all data/*.lua sources.
-- Inspired by AllTheThings (WoW) "Find" window: one bar, results from
-- every collection (weapons, quests, cyberware, mods, vehicles, clothes,
-- quickhacks, misc) in a single ranked list.
--
-- Public API:
--   ATT.Search.query              -- current text (string)
--   ATT.Search.IsActive()         -- true if query non-empty
--   ATT.Search.DrawBar(width)     -- input field, fits header
--   ATT.Search.DrawResults()      -- result list, fits a child window
--   ATT.Search.RebuildIndex()     -- force-rebuild (after data hot-reload)
--   ATT.Search.GetResults(n)      -- raw access for custom UIs

local Search = {}

local function T(key) return ATT.T(key) end

-----------------------------------------------------------
-- Index
--
-- Each data file uses one of two entry shapes:
--   Array form (weapons/quests/quickhacks/cyberwares/mods/clothes/miscs):
--     { recordID, displayName_or_LocKey, [descKey], [vendorKey], ... }
--   Dict form (vehicles):
--     { id = "...", name = "..." }   or   { ids = {...}, name = "..." }
-- The walker handles both transparently.
-----------------------------------------------------------

local _index = nil

local function isArrayEntry(t)
    return type(t) == "table" and type(t[1]) == "string" and t[1] ~= ""
end

local function isDictEntry(t)
    return type(t) == "table" and type(t.name) == "string" and t.name ~= ""
end

local function isEntry(t)
    return isArrayEntry(t) or isDictEntry(t)
end

local function appendSubcat(parent, key)
    if not parent or parent == "" then return tostring(key) end
    return parent .. " > " .. tostring(key)
end

local function indexNode(out, node, category, subcategory)
    if type(node) ~= "table" then return end

    -- Detect "list of entries" by inspecting the first numerically-indexed child.
    local first = node[1]
    if isEntry(first) then
        for _, entry in ipairs(node) do
            if isEntry(entry) then
                local id, name, lockey, fallback
                if isArrayEntry(entry) then
                    id = entry[1]
                    if type(entry[2]) == "string" and entry[2]:match("^LocKey#") then
                        -- Quest-style: lockey + english fallback in entry[3]
                        lockey = entry[2]
                        fallback = entry[3]
                        name = fallback or entry[2]
                    else
                        name = entry[2] or entry[1]
                    end
                else
                    -- Dict form (vehicles)
                    id = entry.id or (type(entry.ids) == "table" and entry.ids[1]) or "?"
                    name = entry.name
                end
                out[#out + 1] = {
                    id          = id,
                    name        = name,
                    lockey      = lockey,
                    fallback    = fallback,
                    category    = category,
                    subcategory = subcategory or "",
                }
            end
        end
        return
    end

    -- Otherwise treat node as a dict and recurse, accumulating the path.
    for k, v in pairs(node) do
        if type(v) == "table" then
            indexNode(out, v, category, appendSubcat(subcategory, k))
        end
    end
end

-- Source registry: category label -> require path.
-- Add a new line here to surface a new data file in the search.
local _sources = {
    Weapons    = "data/weapons",
    Quests     = "data/quests",
    Vehicles   = "data/vehicles",
    Cyberwares = "data/cyberwares",
    Quickhacks = "data/quickhacks",
    Mods       = "data/mods",
    Clothes    = "data/clothes",
    Misc       = "data/miscs",
}

local function buildIndex()
    local out = {}
    for category, modPath in pairs(_sources) do
        local ok, mod = pcall(require, modPath)
        if ok and type(mod) == "table" then
            indexNode(out, mod, category, "")
        end
    end
    return out
end

local function ensureIndex()
    if not _index then _index = buildIndex() end
    return _index
end

-----------------------------------------------------------
-- Display name resolution
--
-- Quests are LocKey#NNNNN -> Game.GetLocalizedText (handled by Questsui).
-- Other categories use raw names that may also be translation keys
-- (e.g. "CONTAGION", "CATAHOULA"); ATT.T() handles them with a
-- safe fallback to the raw string.
-----------------------------------------------------------

local function resolveDisplay(entry)
    if entry.lockey and ATT.Questsui and ATT.Questsui.ResolveLocKey then
        return ATT.Questsui.ResolveLocKey(entry.lockey, entry.fallback or entry.name)
    end
    return T(entry.name)
end

-----------------------------------------------------------
-- Query / matching
-----------------------------------------------------------

Search.query = ""
local _bufferText = ""

function Search.IsActive()
    return Search.query ~= nil and Search.query ~= ""
end

local function lower(s) return type(s) == "string" and s:lower() or "" end

local function matchHaystack(entry, q)
    local display = resolveDisplay(entry)
    return lower(display) .. "|" ..
           lower(entry.name) .. "|" ..
           lower(entry.id) .. "|" ..
           lower(entry.category) .. "|" ..
           lower(entry.subcategory),
           display
end

-----------------------------------------------------------
-- Pretty-print des sous-catégories
--
-- Convertit les noms internes (snake_case, camelCase, ALLCAPS, paths
-- nestés) en libellés lisibles, avec mappings spécifiques par catégorie
-- ATT pour gérer les conventions de chaque module métier.
--   "crafting_components"     -> "Crafting Components", DLC=false
--   "handguns_quest_liberty"  -> "Handguns (Quest)",    DLC=true
--   "facesCY"                 -> "Faces",               DLC=false  (cyberware: strip CY)
--   "MUZZLEHANDGUNS"          -> "Muzzle / Handgun",    DLC=false  (mod: ALLCAPS lookup)
--   "heads_kabuki"            -> "Watson / Kabuki / Heads"          (clothes: region/district/slot)
--   "secondary > johnny"      -> "Side Jobs > Johnny"               (quest: rename "secondary")
-----------------------------------------------------------

-- Mods : noms ALLCAPS hardcodés dans data/mods.lua
local MOD_LABELS = {
    ARSMGLMGMODS           = "Assault / SMG / LMG",
    BLADEMODS              = "Blade",
    BLUNTWEAPONMODS        = "Blunt Weapon",
    MELEEWEAPONMODS        = "Melee Weapon",
    MUZZLEASSAULTRIFLESMGS = "Muzzle / Assault Rifle & SMG",
    MUZZLEHANDGUNS         = "Muzzle / Handgun",
    PISTOLREVOLVERMODS     = "Pistol / Revolver",
    POWERWEAPONMODS        = "Power Weapon",
    SCOPEGENERICLONGS      = "Scope / Long",
    SCOPEGENERICSHORTS     = "Scope / Short",
    SCOPETECHSNIPERS       = "Scope / Tech Sniper",
    SHOTGUNMODS            = "Shotgun",
    SILENCERS              = "Silencer",
    SMARTWEAPONMODS        = "Smart Weapon",
    SNIPERPRECRIFLEMODS    = "Sniper / Precision Rifle",
    TECHWEAPONMODS         = "Tech Weapon",
    THROWABLEWEAPONMODS    = "Throwable",
    WEAPONMODS             = "Weapon",
}

-- Cyberwares : suffixe "CY" de désambiguation à virer pour l'affichage
local CYBERWARE_LABELS = {
    facesCY = "Faces",
    handsCY = "Hands",
    legsCY  = "Legs",
}

-- Clothes : sub-district -> région CP2077 (fallback : juste le nom)
local CLOTHES_REGIONS = {
    northhside       = "Watson",
    kabuki           = "Watson",
    little_china     = "Watson",
    Japantown        = "Watson",
    Charter_Hill     = "Westbrook",
    corpo_plaza      = "City Center",
    Wellsprings      = "Heywood",
    west_wind_estate = "Pacifica",
    arroyo           = "Santo Domingo",
    rancho_coronado  = "Santo Domingo",
    red_peaks        = "Badlands",
    -- vendors (pas de région parent)
    david_walker = nil, satoshi_ueno = nil,
    Karim_Noel   = nil, Zane_Jagger  = nil,
}

local CLOTHES_DISTRICT_LABELS = {
    northhside       = "Northside",
    kabuki           = "Kabuki",
    little_china     = "Little China",
    Japantown        = "Japantown",
    Charter_Hill     = "Charter Hill",
    corpo_plaza      = "Corpo Plaza",
    Wellsprings      = "Wellsprings",
    west_wind_estate = "West Wind Estate",
    arroyo           = "Arroyo",
    rancho_coronado  = "Rancho Coronado",
    red_peaks        = "Red Peaks",
    david_walker     = "David Walker",
    satoshi_ueno     = "Satoshi Ueno",
    Karim_Noel       = "Karim Noel",
    Zane_Jagger      = "Zane Jagger",
}

local CLOTHES_SLOTS = {
    heads        = "Heads",
    faces        = "Faces",
    feets        = "Feet",
    innertorsos  = "Inner Torso",
    outertorsos  = "Outer Torso",
    legss        = "Legs",
    Haeds        = "Heads",  -- typo dans la data
}

-- Quests : noms top-level que CDPR utilise officiellement
local QUEST_LABELS = {
    main      = "Main Jobs",
    secondary = "Side Jobs",
    side      = "Side Quests",
    gig       = "Gigs",
    prologue  = "Prologue",
    act1      = "Act 1",
    act2      = "Act 2",
    act3      = "Act 3",
    interlude = "Interlude",
    epilogue  = "Epilogue",
    root      = "Root",
}

local function titleCase(s)
    return s:gsub("(%w)(%w*)", function(f, r) return f:upper() .. r:lower() end)
end

local function prettifyClothes(base)
    -- Sets : *_set
    if base:lower():find("_set$") then
        local setName = base:gsub("_set$", ""):gsub("_", " ")
        return "Sets / " .. titleCase(setName)
    end
    -- Pattern <slot>_<district> : on cherche le préfixe slot connu
    for slotKey, slotLabel in pairs(CLOTHES_SLOTS) do
        if base:find("^" .. slotKey .. "_") then
            local district      = base:sub(#slotKey + 2)
            local districtLabel = CLOTHES_DISTRICT_LABELS[district]
                                  or titleCase(district:gsub("_", " "))
            local region        = CLOTHES_REGIONS[district]
            if region then
                return region .. " / " .. districtLabel .. " / " .. slotLabel
            else
                return districtLabel .. " / " .. slotLabel
            end
        end
    end
    return nil  -- fallback générique
end

local function prettifyQuestPath(base)
    local segments = {}
    -- Découpe le path "main > prologue" / "main > act2 > evelyn" / "secondary > johnny"
    for seg in (base .. " > "):gmatch("(.-) > ") do
        if seg ~= "" then
            segments[#segments + 1] = QUEST_LABELS[seg] or titleCase(seg:gsub("_", " "))
        end
    end
    if #segments == 0 then return nil end
    return table.concat(segments, " > ")
end

local function prettifyCategoryName(category, sub)
    if not sub or sub == "" then return "", false end

    local lo      = sub:lower()
    local isDLC   = lo:find("liberty", 1, true) ~= nil
    local isQuest = lo:find("_quest", 1, true) ~= nil

    -- Strip les modificateurs pour obtenir la catégorie de base
    local base = sub
        :gsub("_quest_liberty", "")
        :gsub("_quest", "")
        :gsub("_liberty", "")

    -- Mappings spécifiques par catégorie (priorité sur le générique)
    local pretty
    if category == "Mods" and MOD_LABELS[base] then
        pretty = MOD_LABELS[base]
    elseif category == "Cyberwares" and CYBERWARE_LABELS[base] then
        pretty = CYBERWARE_LABELS[base]
    elseif category == "Clothes" then
        pretty = prettifyClothes(base)
    elseif category == "Quests" then
        pretty = prettifyQuestPath(base)
    end

    -- Fallback générique : snake_case + camelCase + title-case
    if not pretty then
        pretty = base:gsub("(%l)(%u)", "%1 %2"):gsub("_", " ")
        pretty = titleCase(pretty)
        pretty = pretty:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
    end

    if isQuest and pretty ~= "" then
        pretty = pretty .. " (Quest)"
    end
    return pretty, isDLC
end

Search.PrettifyCategoryName = prettifyCategoryName  -- exposé pour debug console

function Search.GetResults(maxResults)
    maxResults = maxResults or 100
    local q = lower(Search.query)
    if q == "" then return {} end
    local idx = ensureIndex()
    local results, seen = {}, {}
    for _, entry in ipairs(idx) do
        local hay, display = matchHaystack(entry, q)
        if hay:find(q, 1, true) then
            -- Dedup: identical name+category+subcategory often appears
            -- as multiple variants (rarities/levels). Collapse them.
            local key = entry.category .. "|" .. entry.subcategory .. "|" .. lower(display)
            if not seen[key] then
                seen[key] = true
                local prettySub, isDLC = prettifyCategoryName(entry.category, entry.subcategory)
                results[#results + 1] = {
                    display     = display,
                    category    = entry.category,
                    subcategory = entry.subcategory,
                    prettySub   = prettySub,
                    isDLC       = isDLC,
                    id          = entry.id,
                }
                if #results >= maxResults then break end
            end
        end
    end
    return results
end

function Search.RebuildIndex()
    _index = nil
end

-----------------------------------------------------------
-- UI helpers
-----------------------------------------------------------

function Search.DrawBar(width)
    width = width or 240
    ImGui.PushItemWidth(width)
    local hint = T("ATT_SEARCH_HINT")
    -- CET's ImGui binding returns (value, was_changed). Take both to be safe;
    -- write back unconditionally because reading a stale string is harmless and
    -- some CET versions don't emit was_changed reliably.
    local newText = ImGui.InputTextWithHint(
        "##ATT_SearchBar",
        (hint ~= "ATT_SEARCH_HINT") and hint or "Search...",
        _bufferText,
        256
    )
    ImGui.PopItemWidth()
    if newText ~= nil and newText ~= _bufferText then
        _bufferText = newText
        Search.query = newText
    end
    if Search.IsActive() then
        ImGui.SameLine()
        if ImGui.SmallButton("X##ATT_SearchClear") then
            _bufferText = ""
            Search.query = ""
        end
    end
end

-- Plafond de l'affichage. Au-delà, ImGui devient lent à dessiner et le
-- compteur de dédup tourne pour rien. Si tu cherches un terme générique
-- qui dépasse, affine ta query — un message s'affiche dans ce cas.
local DRAW_LIMIT = 1000

function Search.DrawResults()
    local results = Search.GetResults(DRAW_LIMIT)
    if #results == 0 then
        local msg = T("ATT_SEARCH_NO_RESULTS")
        ImGui.Text((msg ~= "ATT_SEARCH_NO_RESULTS") and msg or "No matching items")
        return
    end
    local label = T("ATT_SEARCH_RESULTS_LABEL")
    label = (label ~= "ATT_SEARCH_RESULTS_LABEL") and label or "results"
    if #results >= DRAW_LIMIT then
        ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.7, 0.3, 1.0)
        ImGui.Text(string.format("%d+ %s (limit reached — refine your query)", #results, label))
        ImGui.PopStyleColor()
    else
        ImGui.Text(string.format("%d %s", #results, label))
    end
    ImGui.Separator()
    for _, r in ipairs(results) do
        -- Préfixe orange "[DLC]" pour les items Phantom Liberty.
        if r.isDLC then
            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.75, 0.2, 1.0)
            ImGui.Text("[DLC]")
            ImGui.PopStyleColor()
            ImGui.SameLine()
        end
        -- Crumb [Catégorie / Sous-catégorie] en bleu clair, prettifié.
        ImGui.PushStyleColor(ImGuiCol.Text, 0.55, 0.78, 1.0, 1.0)
        local crumb = "[" .. r.category
        if r.prettySub and r.prettySub ~= "" then
            crumb = crumb .. " / " .. r.prettySub
        end
        crumb = crumb .. "]"
        ImGui.Text(crumb)
        ImGui.PopStyleColor()
        ImGui.SameLine()
        ImGui.TextWrapped(tostring(r.display))
    end
end

return Search
