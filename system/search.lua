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
-- Les sous-cat internes (`crafting_components`, `handguns_quest_liberty`,
-- `AssaultRifles`, `main_liberty > kow`) sont techniques. Pour l'UI on
-- veut un nom lisible et un flag "DLC ?".
--   "crafting_components"     -> "Crafting Components", DLC=false
--   "handguns_quest_liberty"  -> "Handguns (Quest)",    DLC=true
--   "AssaultRifles"           -> "Assault Rifles",      DLC=false
--   "main_liberty > kow"      -> "Main > Kow",          DLC=true
-----------------------------------------------------------

local function prettifyCategoryName(sub)
    if not sub or sub == "" then return "", false end

    local lo      = sub:lower()
    local isDLC   = lo:find("liberty", 1, true) ~= nil
    local isQuest = lo:find("_quest", 1, true) ~= nil or lo:find("^quest$") ~= nil

    -- Strip les modificateurs pour obtenir la catégorie de base
    local base = sub
        :gsub("_quest_liberty", "")
        :gsub("_quest", "")
        :gsub("_liberty", "")

    -- snake_case -> espaces, camelCase -> espaces
    base = base:gsub("(%l)(%u)", "%1 %2")
    base = base:gsub("_", " ")
    -- Title-case mot par mot (préserve "> " comme séparateur de path)
    base = base:gsub("(%w)(%w*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
    -- Compactage des espaces en trop
    base = base:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")

    if isQuest and base ~= "" then
        base = base .. " (Quest)"
    end
    return base, isDLC
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
                local prettySub, isDLC = prettifyCategoryName(entry.subcategory)
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
