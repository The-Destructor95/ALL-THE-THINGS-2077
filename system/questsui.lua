local Questsui = {}

local _trad             = require("trad/translations")

ATT.translations        = _trad.interface
ATT.selectedLanguage    = ATT.selectedLanguage or "en"

local function T(key) return ATT.T(key) end

local quests = require("data/quests")

-- ----------------------------------------------------------------------------
-- LocKey resolution (cached)
--
-- The game stores quest titles as "LocKey#NNNNN" placeholders that get resolved
-- to whatever language the player has selected in their game settings, via:
--     Game.GetLocalizedTextByKey(CName.new("LocKey#NNNNN"))
-- This means we don't ship our own translation table for quest titles --
-- the game gives us the right text in 11 languages for free.
-- ----------------------------------------------------------------------------
local locKeyCache = {}

-- NOTE: tested all four CET LocKey APIs; only Game.GetLocalizedText(lockey)
-- returns a non-empty string. GetLocalizedTextByKey (with either a CName or a
-- raw string) returns "" silently. Don't bother with the others.
local function resolveLocKey(lockey, fallback)
    if not lockey or lockey == "" then return fallback or "" end
    local cached = locKeyCache[lockey]
    if cached then return cached end

    local resolved
    pcall(function()
        resolved = Game.GetLocalizedText(lockey)
    end)

    if resolved and resolved ~= "" and not string.find(resolved, "LocKey#") then
        locKeyCache[lockey] = resolved
        return resolved
    end

    -- Don't cache the failure — Game.* may not be ready yet on the very
    -- first frame; we'll retry next time displayQuestGroup runs.
    return fallback or lockey
end

-- Public so other modules can reuse the same resolver / cache when we extend
-- LocKey support to weapons / clothes / etc.
Questsui.ResolveLocKey = resolveLocKey

-- Console helper: ATT.Questsui.TestLocKey("LocKey#9461")
function Questsui.TestLocKey(lockey)
    locKeyCache[lockey] = nil
    local resolved
    local ok, err = pcall(function()
        resolved = Game.GetLocalizedText(lockey)
    end)
    print(string.format("[ATT/Quests] TestLocKey %s -> ok=%s value=%q err=%s",
        tostring(lockey), tostring(ok), tostring(resolved or ""), tostring(err)))
    return resolved
end

-- ----------------------------------------------------------------------------
-- Grouping
--
-- For quests we key by questID (not display name) since display names depend
-- on the resolved LocKey, which can change at runtime if the player switches
-- their game language. Each leaf bucket is an ordered list, not a dict.
--
-- main / main_liberty are nested by act/chapter; the other buckets stay flat.
-- ----------------------------------------------------------------------------
local function buildEntries(srcList)
    local out = {}
    for _, entry in ipairs(srcList or {}) do
        out[#out + 1] = {
            questID  = entry[1],
            lockey   = entry[2],
            fallback = entry[3],
        }
    end
    return out
end

local groupedQuests = {
    main = {
        prologue  = buildEntries(quests.main.prologue),
        act1      = buildEntries(quests.main.act1),
        interlude = buildEntries(quests.main.interlude),
        act2 = {
            root    = buildEntries(quests.main.act2.root),
            evelyn  = buildEntries(quests.main.act2.evelyn),
            alt     = buildEntries(quests.main.act2.alt),
            hellman = buildEntries(quests.main.act2.hellman),
            hanako  = buildEntries(quests.main.act2.hanako),
        },
        act3 = {
            nocturne = buildEntries(quests.main.act3.nocturne),
            devil    = buildEntries(quests.main.act3.devil),
            sun      = buildEntries(quests.main.act3.sun),
            star     = buildEntries(quests.main.act3.star),
            secret   = buildEntries(quests.main.act3.secret),
        },
        epilogue = buildEntries(quests.main.epilogue),
    },
    secondary = {
        johnny     = buildEntries(quests.secondary.johnny),
        judy       = buildEntries(quests.secondary.judy),
        panam      = buildEntries(quests.secondary.panam),
        river      = buildEntries(quests.secondary.river),
        kerry      = buildEntries(quests.secondary.kerry),
        lifepaths  = buildEntries(quests.secondary.lifepaths),
        aldecaldos = buildEntries(quests.secondary.aldecaldos),
        brendan    = buildEntries(quests.secondary.brendan),
        claire     = buildEntries(quests.secondary.claire),
        coach_fred = buildEntries(quests.secondary.coach_fred),
        delamain   = buildEntries(quests.secondary.delamain),
        peralez    = buildEntries(quests.secondary.peralez),
        joshua     = buildEntries(quests.secondary.joshua),
        nix        = buildEntries(quests.secondary.nix),
        regina     = buildEntries(quests.secondary.regina),
        wilson     = buildEntries(quests.secondary.wilson),
        viktor     = buildEntries(quests.secondary.viktor),
        zen        = buildEntries(quests.secondary.zen),
        vehicles   = buildEntries(quests.secondary.vehicles),
        apartments = buildEntries(quests.secondary.apartments),
        misc       = buildEntries(quests.secondary.misc),
    },
    side      = buildEntries(quests.side),
    gig       = buildEntries(quests.gig),
    main_liberty = {
        phantom_liberty = buildEntries(quests.main_liberty.phantom_liberty),
        king_wands      = buildEntries(quests.main_liberty.king_wands),
        king_swords     = buildEntries(quests.main_liberty.king_swords),
        king_cups       = buildEntries(quests.main_liberty.king_cups),
        king_pentacles  = buildEntries(quests.main_liberty.king_pentacles),
        epilogue        = buildEntries(quests.main_liberty.epilogue),
    },
    secondary_liberty = {
        reyes = buildEntries(quests.secondary_liberty.reyes),
        hands = buildEntries(quests.secondary_liberty.hands),
        misc  = buildEntries(quests.secondary_liberty.misc),
    },
    side_liberty      = buildEntries(quests.side_liberty),
    gig_liberty       = buildEntries(quests.gig_liberty),
}

-- ----------------------------------------------------------------------------
-- Lifepath filtering for the prologue
--
-- Only the lifepath quest matching the active profile should appear under
-- "Prologue". Profile values come from profil/profil.lua:
--     nomad → q000_nomad   (Nomad)
--     att1  → q000_streetkid (Streetkid)
--     att2  → q000_corpo   (Corpo)
-- "menu" / unknown shows all three (no profile picked yet).
-- ----------------------------------------------------------------------------
local lifepathByProfile = {
    nomad = "q000_nomad",
    att1  = "q000_streetkid",
    att2  = "q000_corpo",
}
local lifepathQuestIDs = { q000_nomad = true, q000_streetkid = true, q000_corpo = true }

local function getFilteredPrologue()
    local active = lifepathByProfile[ATT.currentProfile]
    if not active then
        return groupedQuests.main.prologue
    end
    local filtered = {}
    for _, quest in ipairs(groupedQuests.main.prologue) do
        if not lifepathQuestIDs[quest.questID] or quest.questID == active then
            filtered[#filtered + 1] = quest
        end
    end
    return filtered
end

-- Flat lists of every leaf in main / main_liberty so counters can iterate.
-- NOTE: prologue is replaced at count time with the filtered version, so the
-- total reflects only the lifepath of the active profile.
local mainLeaves = {
    groupedQuests.main.prologue,
    groupedQuests.main.act1,
    groupedQuests.main.interlude,
    groupedQuests.main.act2.root,
    groupedQuests.main.act2.evelyn,
    groupedQuests.main.act2.alt,
    groupedQuests.main.act2.hellman,
    groupedQuests.main.act2.hanako,
    groupedQuests.main.act3.nocturne,
    groupedQuests.main.act3.devil,
    groupedQuests.main.act3.sun,
    groupedQuests.main.act3.star,
    groupedQuests.main.act3.secret,
    groupedQuests.main.epilogue,
}

local mainLibertyLeaves = {
    groupedQuests.main_liberty.phantom_liberty,
    groupedQuests.main_liberty.king_wands,
    groupedQuests.main_liberty.king_swords,
    groupedQuests.main_liberty.king_cups,
    groupedQuests.main_liberty.king_pentacles,
    groupedQuests.main_liberty.epilogue,
}

-- Side jobs (Quêtes secondaires) sub-buckets keyed by quest giver / theme.
local secondaryLeaves = {
    groupedQuests.secondary.johnny,
    groupedQuests.secondary.judy,
    groupedQuests.secondary.panam,
    groupedQuests.secondary.river,
    groupedQuests.secondary.kerry,
    groupedQuests.secondary.lifepaths,
    groupedQuests.secondary.aldecaldos,
    groupedQuests.secondary.brendan,
    groupedQuests.secondary.claire,
    groupedQuests.secondary.coach_fred,
    groupedQuests.secondary.delamain,
    groupedQuests.secondary.peralez,
    groupedQuests.secondary.joshua,
    groupedQuests.secondary.nix,
    groupedQuests.secondary.regina,
    groupedQuests.secondary.wilson,
    groupedQuests.secondary.viktor,
    groupedQuests.secondary.zen,
    groupedQuests.secondary.vehicles,
    groupedQuests.secondary.apartments,
    groupedQuests.secondary.misc,
}

local secondaryLibertyLeaves = {
    groupedQuests.secondary_liberty.reyes,
    groupedQuests.secondary_liberty.hands,
    groupedQuests.secondary_liberty.misc,
}

-- ----------------------------------------------------------------------------
-- Completion cache: questID -> true if SUCCEEDED in the current save
-- ----------------------------------------------------------------------------
Questsui.inventoryCache = {}

function Questsui.UpdateInventoryCache()
    Questsui.inventoryCache = {}
    local journal = Game.GetJournalManager()
    if not journal then return end

    local filter = JournalRequestStateFilter.new()
    filter.active    = true
    filter.inactive  = true
    filter.succeeded = true
    filter.failed    = true

    local context = JournalRequestContext.new()
    context.stateFilter = filter

    local entries = journal:GetQuests(context)
    if not entries then return end

    for _, q in ipairs(entries) do
        local state = journal:GetEntryState(q)
        if state == gameJournalEntryState.Succeeded then
            local id = q:GetId()
            if id then
                Questsui.inventoryCache[id] = true
            end
        end
    end
end

function Questsui.IsCompleted(questID)
    return Questsui.inventoryCache[questID] or false
end

-- ----------------------------------------------------------------------------
-- Per-category list rendering
-- ----------------------------------------------------------------------------
function Questsui.displayQuestGroup(group)
    for _, quest in ipairs(group or {}) do
        local completed = Questsui.IsCompleted(quest.questID)

        if ATT.hideOwnedItems   and completed     then goto continue end
        if ATT.hideUnownedItems and not completed then goto continue end

        if completed then
            ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.0, 1.0)
        else
            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.0, 0.0, 1.0)
        end

        local label = resolveLocKey(quest.lockey, quest.fallback)

        if ImGui.Selectable(label, Questsui.selectedName == quest.questID) then
            Questsui.selectedName = quest.questID
        end

        ImGui.PopStyleColor()
        ::continue::
    end
end

-- Exposed so init.lua can render the prologue with the active profile's lifepath.
Questsui.GetFilteredPrologue = getFilteredPrologue

-- ----------------------------------------------------------------------------
-- Counters
-- ----------------------------------------------------------------------------
function Questsui.CountOwnedQuests(group)
    local owned, total = 0, 0
    for _, quest in ipairs(group or {}) do
        total = total + 1
        if Questsui.IsCompleted(quest.questID) then
            owned = owned + 1
        end
    end
    return owned, total
end

local function countNested(leaves)
    local owned, total = 0, 0
    for _, list in ipairs(leaves) do
        local o, t = Questsui.CountOwnedQuests(list)
        owned = owned + o
        total = total + t
    end
    return owned, total
end

function Questsui.count()
    -- Swap in the profile-filtered prologue so the main total matches the UI.
    mainLeaves[1] = getFilteredPrologue()
    Questsui.ownedmain,      Questsui.totalmain      = countNested(mainLeaves)
    Questsui.ownedsecondary, Questsui.totalsecondary = countNested(secondaryLeaves)
    Questsui.ownedside,      Questsui.totalside      = Questsui.CountOwnedQuests(groupedQuests.side)
    Questsui.ownedgig,       Questsui.totalgig       = Questsui.CountOwnedQuests(groupedQuests.gig)

    Questsui.ownedTotalQuestsui =
        (Questsui.ownedmain or 0)
        + (Questsui.ownedsecondary or 0)
        + (Questsui.ownedside or 0)
        + (Questsui.ownedgig or 0)

    Questsui.totalTotalQuestsui =
        (Questsui.totalmain or 0)
        + (Questsui.totalsecondary or 0)
        + (Questsui.totalside or 0)
        + (Questsui.totalgig or 0)

    return Questsui.ownedTotalQuestsui, Questsui.totalTotalQuestsui
end

function Questsui.countliberty()
    Questsui.ownedmain_liberty,      Questsui.totalmain_liberty      = countNested(mainLibertyLeaves)
    Questsui.ownedsecondary_liberty, Questsui.totalsecondary_liberty = countNested(secondaryLibertyLeaves)
    Questsui.ownedside_liberty,      Questsui.totalside_liberty      = Questsui.CountOwnedQuests(groupedQuests.side_liberty)
    Questsui.ownedgig_liberty,       Questsui.totalgig_liberty       = Questsui.CountOwnedQuests(groupedQuests.gig_liberty)

    Questsui.ownedTotalQuestsuiliberty =
        (Questsui.ownedmain_liberty or 0)
        + (Questsui.ownedsecondary_liberty or 0)
        + (Questsui.ownedside_liberty or 0)
        + (Questsui.ownedgig_liberty or 0)

    Questsui.totalTotalQuestsuiliberty =
        (Questsui.totalmain_liberty or 0)
        + (Questsui.totalsecondary_liberty or 0)
        + (Questsui.totalside_liberty or 0)
        + (Questsui.totalgig_liberty or 0)

    return Questsui.ownedTotalQuestsuiliberty, Questsui.totalTotalQuestsuiliberty
end

-- ----------------------------------------------------------------------------
-- Left-side category buttons
-- ----------------------------------------------------------------------------
-- Helper: render a leaf as a button with progress counter, switching the active
-- right-panel group when clicked. `suffix` makes the ImGui ID unique across
-- the base / Phantom Liberty pages (since labels can collide).
local function questLeafButton(labelKey, list, flag, suffix)
    local owned, total = Questsui.CountOwnedQuests(list)
    local label = string.format("%s(%d/%d)%s", T(labelKey), owned, total, suffix or "")
    if ImGui.Button(label, -1, 0) then
        setActive("Questsui", flag)
        setCategory(Questsui, T(labelKey))
    end
end

function Questsui.uiquests()
    if ImGui.CollapsingHeader(string.format(T("ATT_QUESTS") .. "(%d/%d)",
            Questsui.ownedTotalQuestsui or 0, Questsui.totalTotalQuestsui or 0)) then
        ImGui.Indent(20)

        local main = groupedQuests.main

        if ImGui.CollapsingHeader(string.format(T("ATT_QUEST_MAIN") .. "(%d/%d)",
                Questsui.ownedmain or 0, Questsui.totalmain or 0)) then
            ImGui.Indent(20)

            questLeafButton("ATT_QUEST_PROLOGUE",  getFilteredPrologue(), "showmain_prologue")
            questLeafButton("ATT_QUEST_ACT1",      main.act1,             "showmain_act1")
            questLeafButton("ATT_QUEST_INTERLUDE", main.interlude,        "showmain_interlude")

            do
                local owned, total = 0, 0
                for _, list in ipairs({main.act2.root, main.act2.evelyn, main.act2.alt, main.act2.hellman, main.act2.hanako}) do
                    local o, t = Questsui.CountOwnedQuests(list); owned = owned + o; total = total + t
                end
                if ImGui.CollapsingHeader(string.format(T("ATT_QUEST_ACT2") .. "(%d/%d)", owned, total)) then
                    ImGui.Indent(20)
                    -- "Acte 2" button shows the root-level Act 2 quests (Playing for Time, Tapeworm),
                    -- mirroring Nocturne Op55N1 sitting directly under Act 3.
                    questLeafButton("ATT_QUEST_ACT2",    main.act2.root,    "showmain_act2",    "##act2root")
                    questLeafButton("ATT_QUEST_EVELYN",  main.act2.evelyn,  "showmain_evelyn")
                    questLeafButton("ATT_QUEST_ALT",     main.act2.alt,     "showmain_alt")
                    questLeafButton("ATT_QUEST_HELLMAN", main.act2.hellman, "showmain_hellman")
                    questLeafButton("ATT_QUEST_HANAKO",  main.act2.hanako,  "showmain_hanako")
                    ImGui.Unindent(20)
                end
            end

            do
                local owned, total = 0, 0
                for _, list in ipairs({main.act3.nocturne, main.act3.devil, main.act3.sun, main.act3.star, main.act3.secret}) do
                    local o, t = Questsui.CountOwnedQuests(list); owned = owned + o; total = total + t
                end
                if ImGui.CollapsingHeader(string.format(T("ATT_QUEST_ACT3") .. "(%d/%d)", owned, total)) then
                    ImGui.Indent(20)
                    -- Nocturne Op55N1 sits directly under Act 3 (its own button, not a sub-folder).
                    local nocturneEntry = main.act3.nocturne[1]
                    local nocturneLabel = nocturneEntry and resolveLocKey(nocturneEntry.lockey, nocturneEntry.fallback) or "Nocturne Op55N1"
                    local owned_n, total_n = Questsui.CountOwnedQuests(main.act3.nocturne)
                    if ImGui.Button(string.format("%s(%d/%d)", nocturneLabel, owned_n, total_n), -1, 0) then
                        setActive("Questsui", "showmain_nocturne")
                        setCategory(Questsui, nocturneLabel)
                    end
                    questLeafButton("ATT_QUEST_THE_DEVIL", main.act3.devil,  "showmain_devil")
                    questLeafButton("ATT_QUEST_THE_SUN",   main.act3.sun,    "showmain_sun")
                    questLeafButton("ATT_QUEST_THE_STAR",  main.act3.star,   "showmain_star")
                    questLeafButton("ATT_QUEST_SECRET",    main.act3.secret, "showmain_secret")
                    ImGui.Unindent(20)
                end
            end

            questLeafButton("ATT_QUEST_EPILOGUE", main.epilogue, "showmain_epilogue")

            ImGui.Unindent(20)
        end

        if ImGui.CollapsingHeader(string.format(T("ATT_QUEST_SECONDARY") .. "(%d/%d)",
                Questsui.ownedsecondary or 0, Questsui.totalsecondary or 0)) then
            ImGui.Indent(20)
            local sec = groupedQuests.secondary
            questLeafButton("ATT_QUEST_NPC_JOHNNY",   sec.johnny,     "showsec_johnny")
            questLeafButton("ATT_QUEST_NPC_JUDY",     sec.judy,       "showsec_judy")
            questLeafButton("ATT_QUEST_NPC_PANAM",    sec.panam,      "showsec_panam")
            questLeafButton("ATT_QUEST_NPC_RIVER",    sec.river,      "showsec_river")
            questLeafButton("ATT_QUEST_NPC_KERRY",    sec.kerry,      "showsec_kerry")
            questLeafButton("ATT_QUEST_LIFEPATHS",    sec.lifepaths,  "showsec_lifepaths")
            questLeafButton("ATT_QUEST_ALDECALDOS",   sec.aldecaldos, "showsec_aldecaldos")
            questLeafButton("ATT_QUEST_NPC_BRENDAN",  sec.brendan,    "showsec_brendan")
            questLeafButton("ATT_QUEST_NPC_CLAIRE",   sec.claire,     "showsec_claire")
            questLeafButton("ATT_QUEST_NPC_COACH",    sec.coach_fred, "showsec_coach")
            questLeafButton("ATT_QUEST_NPC_DELAMAIN", sec.delamain,   "showsec_delamain")
            questLeafButton("ATT_QUEST_NPC_PERALEZ",  sec.peralez,    "showsec_peralez")
            questLeafButton("ATT_QUEST_NPC_JOSHUA",   sec.joshua,     "showsec_joshua")
            questLeafButton("ATT_QUEST_NPC_NIX",      sec.nix,        "showsec_nix")
            questLeafButton("ATT_QUEST_NPC_REGINA",   sec.regina,     "showsec_regina")
            questLeafButton("ATT_QUEST_NPC_WILSON",   sec.wilson,     "showsec_wilson")
            questLeafButton("ATT_QUEST_NPC_VIKTOR",   sec.viktor,     "showsec_viktor")
            questLeafButton("ATT_QUEST_NPC_ZEN",      sec.zen,        "showsec_zen")
            questLeafButton("ATT_QUEST_VEHICLES",     sec.vehicles,   "showsec_vehicles")
            questLeafButton("ATT_QUEST_APARTMENTS",   sec.apartments, "showsec_apartments")
            questLeafButton("ATT_QUEST_MISC",         sec.misc,       "showsec_misc")
            ImGui.Unindent(20)
        end

        if ImGui.Button(string.format(T("ATT_QUEST_SIDE") .. "(%d/%d)",
                Questsui.ownedside or 0, Questsui.totalside or 0), -1, 0) then
            setActive("Questsui", "showside")
            setCategory(Questsui, T("ATT_QUEST_SIDE"))
        end

        if ImGui.Button(string.format(T("ATT_QUEST_GIG") .. "(%d/%d)",
                Questsui.ownedgig or 0, Questsui.totalgig or 0), -1, 0) then
            setActive("Questsui", "showgig")
            setCategory(Questsui, T("ATT_QUEST_GIG"))
        end

        ImGui.Unindent(20)
    end
end

function Questsui.uiquestsliberty()
    if ImGui.CollapsingHeader(string.format(T("ATT_QUESTS") .. "(%d/%d)##liberty",
            Questsui.ownedTotalQuestsuiliberty or 0, Questsui.totalTotalQuestsuiliberty or 0)) then
        ImGui.Indent(20)

        local pl = groupedQuests.main_liberty

        if ImGui.CollapsingHeader(string.format(T("ATT_QUEST_MAIN") .. "(%d/%d)##libertyMain",
                Questsui.ownedmain_liberty or 0, Questsui.totalmain_liberty or 0)) then
            ImGui.Indent(20)
            questLeafButton("ATT_QUEST_PL_PROLOGUE",       pl.phantom_liberty, "showmain_pl_phantom",  "##pl")
            questLeafButton("ATT_QUEST_KING_OF_WANDS",     pl.king_wands,      "showmain_pl_kow",      "##pl")
            questLeafButton("ATT_QUEST_KING_OF_SWORDS",    pl.king_swords,     "showmain_pl_kos",      "##pl")
            questLeafButton("ATT_QUEST_KING_OF_CUPS",      pl.king_cups,       "showmain_pl_koc",      "##pl")
            questLeafButton("ATT_QUEST_KING_OF_PENTACLES", pl.king_pentacles,  "showmain_pl_kop",      "##pl")
            questLeafButton("ATT_QUEST_EPILOGUE",          pl.epilogue,        "showmain_pl_epilogue", "##pl")
            ImGui.Unindent(20)
        end

        if ImGui.CollapsingHeader(string.format(T("ATT_QUEST_SECONDARY") .. "(%d/%d)##libertySec",
                Questsui.ownedsecondary_liberty or 0, Questsui.totalsecondary_liberty or 0)) then
            ImGui.Indent(20)
            local secpl = groupedQuests.secondary_liberty
            questLeafButton("ATT_QUEST_NPC_REYES", secpl.reyes, "showsec_pl_reyes", "##pl")
            questLeafButton("ATT_QUEST_NPC_HANDS", secpl.hands, "showsec_pl_hands", "##pl")
            questLeafButton("ATT_QUEST_MISC",      secpl.misc,  "showsec_pl_misc",  "##pl")
            ImGui.Unindent(20)
        end

        if ImGui.Button(string.format(T("ATT_QUEST_SIDE") .. "(%d/%d)##liberty",
                Questsui.ownedside_liberty or 0, Questsui.totalside_liberty or 0), -1, 0) then
            setActive("Questsui", "showside_liberty")
            setCategory(Questsui, T("ATT_QUEST_SIDE"))
        end

        if ImGui.Button(string.format(T("ATT_QUEST_GIG") .. "(%d/%d)##liberty",
                Questsui.ownedgig_liberty or 0, Questsui.totalgig_liberty or 0), -1, 0) then
            setActive("Questsui", "showgig_liberty")
            setCategory(Questsui, T("ATT_QUEST_GIG"))
        end

        ImGui.Unindent(20)
    end
end

Questsui.groupedQuests = groupedQuests

return Questsui
