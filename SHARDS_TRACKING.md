# Shards / Éclats — Tentative de tracking (abandonnée)

> Trace des recherches faites pour ajouter un tracker d'éclats à ATT 2.5.
> Conservée pour reprise éventuelle plus tard.

## Contexte

L'objectif était d'ajouter à ATT 2.5 un onglet **Shards / Éclats** affichant la liste complète des éclats (shards) de Cyberpunk 2077, avec détection vert/rouge selon "lu" / "pas encore lu" — calqué sur le pattern de `system/misc.lua` ou `system/questsui.lua`.

Le code et les données ont été supprimés du mod après confirmation que **CET sur ce build n'expose pas l'API nécessaire** pour énumérer les éclats lus côté script Lua.

---

## 1. Données extraites des tweaks (1448 shards)

Source : `tools/redmod/tweaks/{base,ep1}/gameplay/static_data/database/readables/`

Pattern de définition dans les `.tweak` :
```
shard_name : BaseShard
{
    displayName = "";
    itemSecondaryAction =
    {
        string journalEntry = "onscreens/emails/quests/.../shard_name";
    } : ItemAction.Read;
}
```

### Décompte par catégorie

#### Base game (1032 shards)

| Folder | Catégorie clé | Nombre |
|---|---|---|
| generic/ | `BASE_GENERIC_ARTICLES` | 51 |
| generic/ | `BASE_GENERIC_LEAFLETS` | 12 |
| generic/ | `BASE_GENERIC_LITERATURE_FICTION` | 19 |
| generic/ | `BASE_GENERIC_NIGHT_CITY_PEOPLE` | 11 |
| generic/ | `BASE_GENERIC_NOTES` | 58 |
| generic/ | `BASE_GENERIC_OTHERS` | 26 |
| generic/ | `BASE_GENERIC_PHILOSOPHY_RELIGION` | 7 |
| generic/ | `BASE_GENERIC_POETRY` | 7 |
| generic/ | `BASE_GENERIC_TECHNOLOGY` | 16 |
| generic/ | `BASE_GENERIC_WORLD` | 31 |
| generic/ | `BASE_GENERIC_BOOK2BED` | 3 |
| generic/ | `BASE_GENERIC_HEY_GLE_BOOK` | 1 |
| generic/ | `BASE_GENERIC_NETRUNNER_CHAT` | 1 |
| generic/ | `BASE_GENERIC_MISC` | 1 |
| main_quests/ | `BASE_MAIN_QUESTS` | 27 |
| side_quests/ | `BASE_SIDE_QUESTS` | 18 |
| minor_quests/ | `BASE_MINOR_QUESTS` | 33 |
| minor_activities/ | `BASE_MINOR_ACTIVITIES` | 565 |
| street_stories/ | `BASE_STREET_STORIES` | 135 |
| world_stories/ | `BASE_WORLD_STORIES` | 10 |

#### Phantom Liberty (416 shards)

| Folder | Catégorie clé | Nombre |
|---|---|---|
| generic/ | `PL_GENERIC` | 45 |
| main_quests/ | `PL_MAIN_QUESTS` | 118 |
| minor_quests/ | `PL_MINOR_QUESTS` | 49 |
| dynamic_events/ | `PL_DYNAMIC_EVENTS` | 1 |
| sandbox_activities/ | `PL_SANDBOX_ACTIVITIES` | 57 |
| street_strories/ *(sic)* | `PL_STREET_STORIES` | 85 |
| world_encounters/ | `PL_WORLD_ENCOUNTERS` | 19 |
| world_stories/ | `PL_WORLD_STORIES` | 42 |

### Format du fichier `data/shards.lua`

```lua
-- {tweakDBID, displayName, journalEntryPath}
shards = {
    BASE_GENERIC_ARTICLES = {
        {"Items.generic_6th_street_shard", "6TH STREET", "onscreens/emails/generic/shards/articles/generic_6th_street"},
        {"Items.generic_aledcaldos_rebuild_shard", "ALEDCALDOS REBUILD", "onscreens/emails/generic/shards/articles/generic_aledcaldos_rebuild"},
        ...
    },
    BASE_GENERIC_LEAFLETS = { ... },
    ...
    PL_GENERIC = { ... },
    PL_MAIN_QUESTS = { ... },
    ...
}
return shards
```

> Le fichier complet faisait **243 KB / 1549 lignes**. Régénérable depuis les `.tweak` via le script PowerShell en bas de ce doc.

---

## 2. Pourquoi ça n'a pas marché

### Hypothèse de départ (fausse)
> "Les éclats sont des items donc ils restent en inventaire — on peut les détecter via `transactionSystem:GetItemList(player)` comme les armes/cyberware."

### Réalité
Dans CP2077, les éclats sont **consommés à la lecture** : le bouton "Lire" déclenche `ItemAction.Read` qui :
1. Marque l'entrée onscreen comme vue dans le journal
2. **Supprime l'item de l'inventaire**

Donc l'inventaire ne reflète que les éclats **ramassés mais pas encore lus**. Sur la save de test : **6 détectés sur 1448** (les 6 éclats que V portait sans les avoir encore lus).

### Pivot vers le `JournalManager`

`questsui.lua` track les quêtes via :
```lua
local journal = Game.GetJournalManager()
local entries = journal:GetQuests(ctx)
for _, q in ipairs(entries) do
    local state = journal:GetEntryState(q)
    if state == gameJournalEntryState.Succeeded then ... end
end
```

Hypothèse : `journal:GetOnscreens(ctx)` ferait l'équivalent pour les éclats.

### Résultat des tests (logs CET)

```
[ATT/Shards] inventoryCache built: 913 items (player) + 1158 (stash)
[ATT/Shards] sample inv id #1: Items.PlayerWaTppHead (type=string)   ← format inventaire = string OK
[ATT/Shards] inventory matched 6 / 1448 known shards                 ← confirme la consommation
[ATT/Shards] Game.GetJournalManager(): ok=true, journal=true
[ATT/Shards] methods present: GetEntry, GetEntryByString, GetEntryState, GetOnscreens, GetQuests
[ATT/Shards] GetEntry("onscreens/...") -> ERROR                       ← signature ≠ string
[ATT/Shards] GetEntryByString("...") -> ERROR
[ATT/Shards] (toutes variantes de path -> ERROR)
[ATT/Shards] GetOnscreens(ctx): ok=true, entries=true, count=12       ← ⚠️ seulement 12
[ATT/Shards] entry #1: id=nil (type=nil) state=nil                    ← ⚠️ entries opaques
[ATT/Shards] journal scan done: 12 total onscreens, 0 matched
```

### Conclusions

1. **`GetEntry*(string)` lance une exception** sur ce build CET → les méthodes existent mais n'acceptent pas un path string. Probablement attendent un hash/CName/TweakDBID. Format exact inconnu.

2. **`GetOnscreens(ctx)` retourne seulement 12 entrées** alors qu'il y en a ~1448 dans la base de données → cette méthode n'expose **pas** la base complète des onscreens, juste les notifications/popups gérés en mémoire courante. Pas l'historique du codex.

3. **`e:GetId()` et `journal:GetEntryState(e)` retournent `nil`** sur ces 12 entrées (pcalls passent mais valeurs nulles) → les méthodes ne sont pas applicables à ce type d'entrée onscreen.

### Pourquoi les quêtes marchent et pas les shards
- Quête = entrée journal avec **machine à états persistante** (Active/Succeeded/Failed) → le `JournalManager` la track explicitement et expose son état
- Shard = *one-shot* → texte archivé dans le **codex** (blob de save data), **pas** comme entrée journal interrogeable runtime

---

## 3. Pistes pour reprendre plus tard

| Approche | Faisabilité | Limite |
|---|---|---|
| Hook sur `ItemAction.Read` via `Observe()` (CET → RED4ext) | Possible | Ne capte que les **futures** lectures, perd l'historique |
| Lire `Game.GetCodexSystem()` ou équivalent | À tester | Existence non vérifiée sur ce build |
| Parser le `.dat` de save hors-jeu | Faisable | Complexe, fragile aux màj CDPR, hors scope de CET |
| Attendre une nouvelle API CET/RED4ext | Inactif | Dépend de la communauté |
| Tracker uniquement les shards en inventaire | **Marche déjà** (6/1448) | Trompeur pour l'utilisateur — affiche surtout du rouge |

---

## 4. Code du module `system/shardsui.lua` (référence)

```lua
local Shardsui = {}
ATT.translations            = require("trad/translations").interface
ATT.selectedLanguage        = ATT.selectedLanguage or "en"

local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
end

local shards = require("data/shards")

-- Build groupedshards: { CATEGORY_KEY = { displayName = { recordIDs={}, journalPaths={} } } }
local groupedshards = {}
for catKey, items in pairs(shards) do
    groupedshards[catKey] = {}
    for _, item in ipairs(items) do
        local recordID    = item[1]
        local name        = item[2]
        local journalPath = item[3]
        if not groupedshards[catKey][name] then
            groupedshards[catKey][name] = { recordIDs = {}, journalPaths = {} }
        end
        table.insert(groupedshards[catKey][name].recordIDs, recordID)
        if journalPath and journalPath ~= "" then
            table.insert(groupedshards[catKey][name].journalPaths, journalPath)
        end
    end
end

Shardsui.inventoryCache = {}
Shardsui.journalCache   = {}

function Shardsui.UpdateInventoryCache()
    Shardsui.inventoryCache = {}
    Shardsui.journalCache   = {}

    -- Inventaire + coffre
    local transactionSystem = Game.GetTransactionSystem()
    local player = GetPlayer()
    if transactionSystem and player then
        local success, playerItems = transactionSystem:GetItemList(player)
        if success and playerItems then
            for _, item in ipairs(playerItems) do
                Shardsui.inventoryCache[item:GetID().id.value] = true
            end
        end
        local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
        if stash then
            local stashSuccess, stashItems = transactionSystem:GetItemList(stash)
            if stashSuccess and stashItems then
                for _, item in ipairs(stashItems) do
                    Shardsui.inventoryCache[item:GetID().id.value] = true
                end
            end
        end
    end

    -- TODO: journal-based detection (see SHARDS_TRACKING.md section 2)
end

function Shardsui.IsOwned(data)
    for _, recordID in ipairs(data.recordIDs) do
        if Shardsui.inventoryCache[recordID] then return true end
    end
    for _, path in ipairs(data.journalPaths) do
        if Shardsui.journalCache[path] then return true end
    end
    return false
end

function Shardsui.displayShardGroup(name, group)
    for shardName, data in pairs(group or {}) do
        local owned = Shardsui.IsOwned(data)
        if ATT.hideOwnedItems and owned then goto continue end
        if ATT.hideUnownedItems and not owned then goto continue end
        if owned then
            ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.0, 1.0)
        else
            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.0, 0.0, 1.0)
        end
        if ImGui.Selectable(shardName, Shardsui.selectedName == shardName) then
            Shardsui.selectedName = shardName
        end
        ImGui.PopStyleColor()
        ::continue::
    end
end

function Shardsui.CountOwnedShards(group)
    local owned, total = 0, 0
    for _, data in pairs(group or {}) do
        total = total + 1
        if Shardsui.IsOwned(data) then owned = owned + 1 end
    end
    return owned, total
end

Shardsui.baseCategories = {
    { key = "BASE_GENERIC_ARTICLES",            show = "showbase_articles",  label = "Generic - Articles" },
    { key = "BASE_GENERIC_LEAFLETS",            show = "showbase_leaflets",  label = "Generic - Leaflets" },
    { key = "BASE_GENERIC_LITERATURE_FICTION",  show = "showbase_lit",       label = "Generic - Literature/Fiction" },
    { key = "BASE_GENERIC_NIGHT_CITY_PEOPLE",   show = "showbase_ncpeople",  label = "Generic - NC People" },
    { key = "BASE_GENERIC_NOTES",               show = "showbase_notes",     label = "Generic - Notes" },
    { key = "BASE_GENERIC_OTHERS",              show = "showbase_others",    label = "Generic - Others" },
    { key = "BASE_GENERIC_PHILOSOPHY_RELIGION", show = "showbase_phil",      label = "Generic - Philosophy/Religion" },
    { key = "BASE_GENERIC_POETRY",              show = "showbase_poetry",    label = "Generic - Poetry" },
    { key = "BASE_GENERIC_TECHNOLOGY",          show = "showbase_tech",      label = "Generic - Technology" },
    { key = "BASE_GENERIC_WORLD",               show = "showbase_world",     label = "Generic - World" },
    { key = "BASE_GENERIC_BOOK2BED",            show = "showbase_book",      label = "Generic - Book2Bed" },
    { key = "BASE_GENERIC_HEY_GLE_BOOK",        show = "showbase_hey",       label = "Generic - Hey Gle Book" },
    { key = "BASE_GENERIC_NETRUNNER_CHAT",      show = "showbase_chat",      label = "Generic - Netrunner Chat" },
    { key = "BASE_GENERIC_MISC",                show = "showbase_misc",      label = "Generic - Misc" },
    { key = "BASE_MAIN_QUESTS",                 show = "showbase_main",      label = "Main Quests" },
    { key = "BASE_SIDE_QUESTS",                 show = "showbase_side",      label = "Side Quests" },
    { key = "BASE_MINOR_QUESTS",                show = "showbase_minor",     label = "Minor Quests" },
    { key = "BASE_MINOR_ACTIVITIES",            show = "showbase_minoract",  label = "Minor Activities" },
    { key = "BASE_STREET_STORIES",              show = "showbase_street",    label = "Street Stories" },
    { key = "BASE_WORLD_STORIES",               show = "showbase_wstories",  label = "World Stories" },
}

Shardsui.plCategories = {
    { key = "PL_GENERIC",            show = "showpl_generic",  label = "Generic" },
    { key = "PL_MAIN_QUESTS",        show = "showpl_main",     label = "Main Quests" },
    { key = "PL_MINOR_QUESTS",       show = "showpl_minor",    label = "Minor Quests" },
    { key = "PL_DYNAMIC_EVENTS",     show = "showpl_dynamic",  label = "Dynamic Events" },
    { key = "PL_SANDBOX_ACTIVITIES", show = "showpl_sandbox",  label = "Sandbox Activities" },
    { key = "PL_STREET_STORIES",     show = "showpl_street",   label = "Street Stories" },
    { key = "PL_WORLD_ENCOUNTERS",   show = "showpl_worldenc", label = "World Encounters" },
    { key = "PL_WORLD_STORIES",      show = "showpl_wstories", label = "World Stories" },
}

for _, cat in ipairs(Shardsui.baseCategories) do Shardsui[cat.show] = false end
for _, cat in ipairs(Shardsui.plCategories)   do Shardsui[cat.show] = false end

local function countList(catList)
    local totalOwned, totalTotal = 0, 0
    for _, cat in ipairs(catList) do
        local o, t = Shardsui.CountOwnedShards(groupedshards[cat.key])
        Shardsui["owned_" .. cat.show] = o
        Shardsui["total_" .. cat.show] = t
        totalOwned = totalOwned + o
        totalTotal = totalTotal + t
    end
    return totalOwned, totalTotal
end

function Shardsui.countBase()
    Shardsui.ownedTotalBase, Shardsui.totalTotalBase = countList(Shardsui.baseCategories)
    return Shardsui.ownedTotalBase, Shardsui.totalTotalBase
end

function Shardsui.countPL()
    Shardsui.ownedTotalPL, Shardsui.totalTotalPL = countList(Shardsui.plCategories)
    return Shardsui.ownedTotalPL, Shardsui.totalTotalPL
end

local function drawCategoryButtons(catList)
    for _, cat in ipairs(catList) do
        local o = Shardsui["owned_" .. cat.show] or 0
        local t = Shardsui["total_" .. cat.show] or 0
        if t > 0 then
            if ImGui.Button(string.format("%s (%d/%d)", cat.label, o, t), -1, 0) then
                setActive("Shardsui", cat.show)
                setCategory(Shardsui, cat.label)
            end
        end
    end
end

function Shardsui.uiBase()
    if ImGui.CollapsingHeader(string.format(T("ATT_SHARDS") .. " (%d/%d)",
            Shardsui.ownedTotalBase or 0, Shardsui.totalTotalBase or 0)) then
        ImGui.Indent(20)
        drawCategoryButtons(Shardsui.baseCategories)
        ImGui.Unindent(20)
    end
end

function Shardsui.uiPL()
    if ImGui.CollapsingHeader(string.format(T("ATT_SHARDS") .. " (%d/%d)",
            Shardsui.ownedTotalPL or 0, Shardsui.totalTotalPL or 0)) then
        ImGui.Indent(20)
        drawCategoryButtons(Shardsui.plCategories)
        ImGui.Unindent(20)
    end
end

function Shardsui.drawActiveListBase()
    for _, cat in ipairs(Shardsui.baseCategories) do
        if Shardsui[cat.show] then
            Shardsui.displayShardGroup(cat.key, groupedshards[cat.key])
            return
        end
    end
end

function Shardsui.drawActiveListPL()
    for _, cat in ipairs(Shardsui.plCategories) do
        if Shardsui[cat.show] then
            Shardsui.displayShardGroup(cat.key, groupedshards[cat.key])
            return
        end
    end
end

Shardsui.groupedshards = groupedshards
return Shardsui
```

---

## 5. Wiring qui était dans `init.lua`

```lua
-- Module load (après ATT.Misc)
ATT.Shardsui                        = require("system/shardsui")

-- Categories (pour setActive/setCategory) — après l'entrée Misc
Shardsui = {
    "showbase_articles","showbase_leaflets","showbase_lit","showbase_ncpeople","showbase_notes",
    "showbase_others","showbase_phil","showbase_poetry","showbase_tech","showbase_world",
    "showbase_book","showbase_hey","showbase_chat","showbase_misc",
    "showbase_main","showbase_side","showbase_minor","showbase_minoract","showbase_street","showbase_wstories",
    "showpl_generic","showpl_main","showpl_minor","showpl_dynamic","showpl_sandbox",
    "showpl_street","showpl_worldenc","showpl_wstories"
},

-- onOverlayOpen (après ATT.Misc.UpdateInventoryCache())
ATT.Shardsui.UpdateInventoryCache()

-- Dans les 3 branches de profil (nomad/att1/att2), Cyberpunk 2077 tab — après DrawUIMisc:
ImGui.Spacing()
  ATT.DrawUIShardsCyberpunk2077()

-- Idem dans la branche Phantom Liberty — après DrawUIModPhantomLiberty:
ImGui.Spacing()
  ATT.DrawUIShardsPhantomLiberty()

-- Right pane list (Cyberpunk 2077, après DrawUIMisclistCyberpunk2077):
ATT.DrawUIShardslistCyberpunk2077()

-- Right pane list (Phantom Liberty, après DrawUIModlistPhantomLiberty):
ATT.DrawUIShardslistPhantomLiberty()

-- Helper functions (à côté de DrawUIMiscCyberpunk2077):
function ATT.DrawUIShardsCyberpunk2077()
    ATT.Shardsui.countBase()
    ATT.Shardsui.uiBase()
end
function ATT.DrawUIShardsPhantomLiberty()
    ATT.Shardsui.countPL()
    ATT.Shardsui.uiPL()
end
function ATT.DrawUIShardslistCyberpunk2077()
    ATT.Shardsui.drawActiveListBase()
end
function ATT.DrawUIShardslistPhantomLiberty()
    ATT.Shardsui.drawActiveListPL()
end
```

## 6. Traductions ajoutées dans `trad/translations.lua`

```lua
-- M.interface.en
ATT_SHARDS = "Shards",
ATT_SHARDS_BASE = "Base game",
ATT_SHARDS_PL = "Phantom Liberty",

-- M.interface.trad
ATT_SHARDS = "Eclats",
ATT_SHARDS_BASE = "Jeu de base",
ATT_SHARDS_PL = "Phantom Liberty",
```

---

## 7. Script PowerShell pour régénérer `data/shards.lua`

À lancer depuis n'importe quel dossier (les chemins sont absolus). Suppose que les `.tweak` sont dans `tools/redmod/tweaks/`.

```powershell
$basePath = "c:\Program Files (x86)\GOG Galaxy\Games\Cyberpunk 2077\tools\redmod\tweaks\base\gameplay\static_data\database\readables"
$ep1Path  = "c:\Program Files (x86)\GOG Galaxy\Games\Cyberpunk 2077\tools\redmod\tweaks\ep1\gameplay\static_data\database\readables"
$outFile  = "c:\Program Files (x86)\GOG Galaxy\Games\Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\ATT 2.5\data\shards.lua"

# Étape 1 : grep les `BaseShard` + `journalEntry` via ripgrep ou Get-ChildItem + Select-String
# (cf. logs ATT/Shards historiques)
# ... voir système/shardsui.lua original pour la logique complète
```

> **Astuce** : ripgrep est plus rapide :
> ```
> rg -n "^(\w+)\s*:\s*BaseShard|journalEntry\s*=" <readables_path>
> ```

---

## 8. Instructions de remise en place

Si tu reprends ce travail :

1. **Restaurer les données** : régénérer `data/shards.lua` (script ci-dessus)
2. **Restaurer le module** : copier la section 4 dans `system/shardsui.lua`
3. **Restaurer les wirings** : appliquer la section 5 dans `init.lua` et la section 6 dans `trad/translations.lua`
4. **Implémenter la détection** : choisir une piste de la section 3 (recommandé : hook `ItemAction.Read` via Observe pour les futures lectures + tracker custom dans une mini-DB SQLite locale, en utilisant le `db.sqlite3` déjà présent dans le mod)

---

*Document créé le 2026-05-02. Trace conservée après abandon de l'implémentation runtime faute d'API CET adéquate.*
