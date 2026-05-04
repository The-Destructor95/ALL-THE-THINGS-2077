# ATT 2.5 — Plan de refactorisation

Document vivant. Objectif : sortir du *god file* `init.lua` et donner au mod
une structure prévisible où **ajouter une langue, une catégorie ou une feature
ne demande pas de toucher à 8 fichiers**.

Aucun refactor n'est appliqué — c'est un plan d'attaque.

---

## 1. Constat

### 1.1 Tailles actuelles

| Fichier | Lignes | État |
|---|---|---|
| `init.lua` | 3 603 | god file, mélange bootstrap + render + dispatch + agrégation |
| `system/clothesui.lua` | 3 161 | ~1 600 lignes de boilerplate de grouping répétitif |
| `system/weaponsui.lua` | 2 133 | idem, ~1 500 lignes de grouping répétitif |
| `system/modui.lua` | 793 | OK mais même pattern répétitif |
| `system/cyberwaresui.lua` | 776 | idem |
| `system/questsui.lua` | 539 | OK |
| `system/vehicules.lua` | 406 | OK |
| `system/quickhacks.lua` | 361 | OK |
| `system/misc.lua` | 302 | OK |
| `trad/translations.lua` | 4 709 | monolithe `en` + `fr` + descriptions, illisible quand on ajoutera `de`/`es`/etc. |

**Constat clé** : ~74 % du code applicatif est concentré dans 3 fichiers
(`init.lua`, `clothesui.lua`, `weaponsui.lua`). Et dans ces 3 fichiers, une
grosse part est mécanique et duplicable.

### 1.2 Découpage actuel de `init.lua`

| Lignes | Contenu | Dest. cible |
|---|---|---|
| 1–48 | requires + `ATT = {}` + flags par défaut | `init.lua` (allégé) |
| 50–122 | `categories` (mapping nom → liste de flags UI) | `core/profile.lua` ou `modules/_registry.lua` |
| 123–138 | `setActive(category, activeKey)` global | `core/ui_helpers.lua` (et namespacer en `ATT.UI.SetActive`) |
| 140–163 | `T(key)` + `ATT.T` + alias | `core/i18n.lua` |
| 166–204 | `SaveSettings` / `LoadSettings` + appel initial | `core/settings.lua` |
| 207–245 | `DetectGameLanguage` / `AutoSelectLanguage` | `core/i18n.lua` |
| 248–261 | `onOverlayOpen` / `onOverlayClose` | `core/events.lua` |
| 265–269 | `setCategory(module, name)` global | `core/ui_helpers.lua` |
| 271–2730 | `onDraw` géant (2 460 lignes !) | éclaté : `core/render.lua` + chaque module dessine sa portion |
| 2732–2786 | `DrawUIHeader` (tabs jeu + barre de recherche) | `core/ui_header.lua` |
| 2790–2880 | dispatchers `DrawUIXxxCyberpunk2077` / `DrawUIXxxPhantomLiberty` | supprimés, remplacés par registry |
| 2881–3596 | `DrawUIXxxlistYyy` (rendu conditionnel des listes) | dans le module concerné |
| 3596–3603 | `DrawUISettings` | `core/ui_settings.lua` |

### 1.3 Douleurs concrètes

- **Branchement par profil dupliqué 3 fois** dans `onDraw` (`if currentProfile == "nomad"` / `"att1"` / `"att2"`) avec ~120 lignes presque identiques à chaque fois pour agréger les compteurs.
- **Branchement par jeu dupliqué** (`if selectedGame == "Cyberpunk 2077"` / `"Phantom Liberty"`) à chaque catégorie.
- **`setActive` et `setCategory` sont des globales** sans préfixe — collision potentielle, et invisibles dans la recherche.
- **Chaque module dans `system/*.lua` redéfinit `ATT.translations` et `ATT.selectedLanguage`** ([weaponsui.lua:11](../system/weaponsui.lua), [clothesui.lua:117](../system/clothesui.lua), etc.) — devrait être *uniquement* dans `init.lua` / `core/i18n.lua`.
- **Naming incohérent** : `vehicules` (FR) vs `weaponsui`/`clothesui` (EN), camelCase mélangé avec snake_case, `Quickhacksui` vs `Modsui` (capitalisation).
- **Données ingérées dans le module UI** : `clothesui.lua` consacre ~1 600 lignes à transformer `data/clothes.lua` en `groupedClothes`. Ce n'est pas du UI, c'est du data prep, ça ne devrait pas être là.
- **Pas d'API publique propre** : pour savoir ce qu'expose un module, il faut grep tout le fichier.

---

## 2. Cible

### 2.1 Arborescence proposée

```
ATT 2.5/
├── init.lua                    # bootstrap UNIQUEMENT, ~150 lignes max
│
├── core/                       # infrastructure partagée, rien de métier
│   ├── i18n.lua               # ATT.T, AutoSelectLanguage, DetectGameLanguage
│   ├── settings.lua           # ATT.SaveSettings, ATT.LoadSettings
│   ├── events.lua             # registerForEvent wrappers + dispatcher interne
│   ├── profile.lua            # currentProfile, isProfileActive, lifepath logic
│   ├── progress.lua           # agrégation cross-modules (remplace les 350 lignes d'onDraw)
│   ├── render.lua             # boucle onDraw principale, itère le registry
│   ├── ui_header.lua          # DrawUIHeader (tabs + search)
│   ├── ui_settings.lua        # DrawUISettings
│   └── ui_helpers.lua         # SetActive, SetCategory, child windows, couleurs
│
├── modules/                    # 1 dossier par catégorie, MÊME shape
│   ├── _registry.lua          # liste des modules + auto-load
│   ├── weapons/
│   │   ├── init.lua           # API publique + register()
│   │   ├── grouping.lua       # transforme data/weapons.lua → groupedWeapons
│   │   ├── inventory.lua      # UpdateInventoryCache, CheckInStashAndInventory
│   │   ├── stats.lua          # count(), countliberty()
│   │   └── ui.lua             # uiweapons(), uiweaponsliberty()
│   ├── quests/                # même shape
│   ├── vehicles/              # même shape (renommer ./system/vehicules → vehicles)
│   ├── cyberware/
│   ├── quickhacks/
│   ├── mods/
│   ├── clothes/
│   ├── misc/
│   └── search/                # déjà cross-module, reste cross-module
│       ├── init.lua
│       ├── engine.lua
│       └── ui.lua
│
├── data/                       # INCHANGÉ pour l'instant (faible ROI à toucher)
│   └── (weapons.lua, quests.lua, ...)
│
├── trad/
│   ├── init.lua               # expose .interface, .descriptions, .vehicles
│   ├── interface/
│   │   ├── en.lua
│   │   ├── fr.lua
│   │   └── (de.lua, es.lua, ... ajoutés à la demande)
│   ├── descriptions/
│   │   ├── en.lua
│   │   └── fr.lua
│   └── vehicles/
│       ├── en.lua
│       └── fr.lua
│
├── ui_pages/                   # ex-`settings/`, renommé pour clarté
│   ├── general.lua
│   ├── changelog.lua
│   └── information.lua
│
├── profil/                     # INCHANGÉ (déjà OK)
│   ├── profil.lua, nomad.lua, att1.lua, att2.lua
│
├── docs/
│   ├── REFACTOR_PLAN.md       # ce fichier
│   ├── ARCHITECTURE.md         # à écrire après le refactor
│   ├── ADD_LANGUAGE.md         # checklist pour ajouter une locale
│   └── ADD_CATEGORY.md         # checklist pour ajouter une catégorie
│
├── settings.json
├── db.sqlite3
└── ATT 2.5.log
```

### 2.2 Forme uniforme d'un module métier

Chaque module dans `modules/<name>/` expose, via `init.lua` :

```lua
return {
    -- Métadonnées
    name        = "weapons",
    label       = "ATT_WEAPONS",        -- clé de traduction pour l'UI
    games       = { "Cyberpunk 2077", "Phantom Liberty" },
    profiles    = { "nomad", "att1", "att2" },

    -- Lifecycle (tous optionnels, appelés par le registry)
    Load        = function() ... end,   -- au require initial (build groupings)
    OnOverlayOpen = function() ... end, -- à l'ouverture (UpdateInventoryCache)

    -- Stats — retournent (owned, total) par jeu
    CountBaseGame = function() return owned, total end,
    CountDLC      = function() return owned, total end,

    -- UI
    DrawLeftMenu = function() ... end,  -- les boutons dans Child Window 9
    DrawList     = function() ... end,  -- la liste dans Child Window 10
}
```

Le **registry** itère cette liste. `onDraw` n'a plus besoin de connaître les
catégories ni les profils en détail — il fait juste :

```lua
for _, mod in ipairs(ATT.Registry.ActiveFor(currentProfile, selectedGame)) do
    mod.DrawLeftMenu()
end
```

Et la **progression globale** devient :

```lua
local owned, total = 0, 0
for _, mod in ipairs(ATT.Registry.ActiveFor(currentProfile, selectedGame)) do
    local o, t = mod.CountForGame(selectedGame)
    owned, total = owned + o, total + t
end
```

→ Les 350 lignes de stat aggregation dans `init.lua` deviennent ~10 lignes.

### 2.3 Conventions

- **Noms en anglais** partout (`vehicles` pas `vehicules`, `clothes` pas `clothesui`).
  Le suffixe `ui` disparaît : on a déjà un dossier `ui.lua` par module.
- **camelCase pour les variables**, **PascalCase pour les fonctions publiques**, **snake_case pour les fichiers**.
- **Pas de globales** : tout passe par `ATT.<Module>.<Func>` ou `ATT.<Domain>.<Func>` (Settings, I18n, Profile, Registry…).
- **Pas de `require` au milieu d'un fichier** : tous les requires en tête.
- **Un module ne touche pas l'état global d'un autre** : pas de `ATT.translations = ...` dans `weaponsui.lua`.
- **Une seule façon d'accéder à une traduction** : `ATT.T(key)`.

---

## 3. Plan d'attaque (incrémental, chaque étape mergeable)

L'ordre est conçu pour que **le mod marche après chaque étape**. Pas de big-bang.

### Étape 1 — Extraire `core/` *(faible risque, gros gain)*
- Créer `core/i18n.lua` avec `ATT.T` + détection langue
- Créer `core/settings.lua` avec Save/Load
- Créer `core/events.lua` avec onOverlay handlers
- `init.lua` ne fait plus que `require` ces modules
- **Test** : ouvrir l'overlay, vérifier que la langue se détecte, settings persistent

### Étape 2 — Extraire le rendu de `init.lua` *(gros gain visuel)*
- Créer `core/render.lua` avec la fonction `onDraw` principale
- Créer `core/ui_header.lua`, `core/ui_settings.lua`
- `init.lua` se réduit à `require` + `registerForEvent("onDraw", ATT.Render.Main)`
- **Test** : tout l'UI continue à marcher visuellement

### Étape 3 — Splitter `trad/translations.lua`
- Créer `trad/interface/en.lua`, `trad/interface/fr.lua`
- Créer `trad/descriptions/en.lua`, `trad/descriptions/fr.lua`
- Créer `trad/vehicles/en.lua`, `trad/vehicles/fr.lua`
- `trad/init.lua` re-assemble tout dans la même structure qu'avant
- Aucun consumer ne change : `ATT.T` continue de marcher pareil
- **Test** : strings affichés identiques

### Étape 4 — Introduire le registry *(refactor structurant)*
- Créer `modules/_registry.lua`
- Migrer **un module pilote** (proposition : `quests/`, déjà le plus propre)
  - `modules/quests/init.lua` retourne le manifest
  - `register()` au require
- Adapter `core/render.lua` pour utiliser le registry pour le module pilote, et l'ancien path pour les autres
- **Test** : les quêtes s'affichent toujours, les autres aussi

### Étape 5 — Migrer les modules un par un
Ordre suggéré (du plus simple au plus complexe) :
1. `quickhacks` → `modules/quickhacks/`
2. `misc` → `modules/misc/`
3. `mods` → `modules/mods/`
4. `cyberware` → `modules/cyberware/`
5. `vehicles` → `modules/vehicles/` (rename FR→EN au passage)
6. `weapons` → `modules/weapons/` (gros morceau)
7. `clothes` → `modules/clothes/` (le plus gros)
8. `search` → `modules/search/` (déjà bien isolé)

À chaque étape, **factoriser le grouping en module-local** :
- `modules/<x>/grouping.lua` reçoit la table `data/<x>.lua` et produit `groupedX`
- Les ~1 500 lignes de boilerplate dans `weaponsui.lua` tombent à ~200

### Étape 6 — Unifier la progression globale
- Créer `core/progress.lua` qui itère le registry
- Supprimer les ~350 lignes de stat aggregation dans `core/render.lua`
- **Test** : les pourcentages affichés sont identiques

### Étape 7 — Ménage final
- Renommer fichiers/dossiers pour cohérence (vehicules→vehicles, settings→ui_pages)
- Supprimer code mort (`translations copy.lua`, fonctions `DrawUIXxx` devenues stubs vides)
- Lint : pas de globale non préfixée, tous les requires en tête
- Écrire `docs/ARCHITECTURE.md` qui décrit l'état final (et plus le plan)

---

## 4. Risques & garde-fous

- **Ordre d'init** : Lua `require` s'exécute à l'appel. Si `core/i18n.lua` est `require` avant que `ATT = {}` existe, crash. → Garder `ATT = {}` en première ligne de `init.lua`.
- **Hot-reload** : CET cache les modules. Tester le `Reload All Mods` après chaque étape, pas juste `onInit`.
- **Globales toujours référencées** : `setActive`, `setCategory`, `showEnglish`, `isOverlayOpen`, `searchQuery` — les chercher AVANT de supprimer (`grep -rn`). En remplacer par leur version namespacée puis casser les anciennes.
- **Save backwards-compat** : `settings.json` actuel a déjà le shim `selectedLanguage == "trad" → "fr"`. Garder ce genre de shim quand on rename des champs.
- **DB SQLite** : si on touche `db.sqlite3`, prévoir une migration. Pour ce refactor on n'y touche PAS.
- **Avant chaque étape** : `git commit` (ou copie du dossier si pas de git ici) pour rollback rapide.

---

## 5. Métriques de succès

À la fin du refactor, on doit pouvoir :
- Ajouter une langue en touchant **1 seul fichier** (`trad/interface/<lang>.lua`).
- Ajouter une catégorie en créant **1 dossier** (`modules/<name>/`) sans modifier `init.lua`.
- Lire `init.lua` en **moins d'une minute** et comprendre tout ce qu'il fait.
- `init.lua` < 200 lignes, aucun fichier > 1 000 lignes.

---

## 6. Décisions verrouillées (2026-05-04)

- ✅ **Naming en anglais partout** : `vehicules` → `vehicles`, `clothesui` → `clothes`, suffixe `ui` supprimé.
- ✅ **`system/` → `modules/`** : maj des requires en passant.
- ✅ **`profil/` → `profiles/`** : maj des requires en passant.
- ✅ **`translations copy.lua` supprimé** (4509 lignes, ancienne copie obsolète vs 4709 actuelles).
- ⏳ **Git** : remote existant à <https://github.com/The-Destructor95/ALL-THE-THINGS-2077> mais bloqué en 2.3.
  Stratégie à choisir avant Étape 1 (voir §7 ci-dessous).

## 7. Stratégie git

Le remote contient l'historique 2.3. Le dossier local est en 2.5 sans `.git/`.
Trois options pour réconcilier, du moins au plus préservant :

| Option | Description | Historique 2.3 | 2.3 → 2.5 visible |
|---|---|---|---|
| A | `git init` local fresh, ignorer le remote, push vers une nouvelle branche `2.5` | ❌ perdu | non |
| B | Cloner le remote ailleurs, copier les fichiers 2.5 dedans, commit "2.5 release" | ✅ gardé | en 1 gros commit |
| C | `git init` local + `remote add` + `fetch` + `reset --soft origin/main` + commit "2.5" | ✅ gardé | en 1 gros commit |

**Reco : Option C** — plus rapide que B (pas de copie de fichiers), même résultat.
Les commandes seraient :
```bash
git init
git remote add origin https://github.com/The-Destructor95/ALL-THE-THINGS-2077.git
git fetch origin
# .gitignore approprié (voir liste dans Étape 0 ci-dessous)
git reset --soft origin/main      # ou origin/master selon le repo
git add .
git commit -m "ATT 2.5 — état pré-refactor"
# Pas de push pour l'instant : on commit chaque étape locale, on push à la fin
```

Avant `reset --soft`, **vérifier** que `origin/main` est bien le HEAD attendu :
`git log --oneline origin/main | head -5`. Si autre chose (e.g. `master`), adapter.

### Étape 0 — Pré-refactor

Avant l'Étape 1 du §3 :
1. Choisir l'option A/B/C ci-dessus
2. Créer `.gitignore` avec :
   ```
   *.log
   settings.json   # contient l'état utilisateur, pas le code
   ```
   (Garder `db.sqlite3` versionné — c'est de la data du mod, pas du runtime.)
3. Premier commit "ATT 2.5 — état pré-refactor"
4. Supprimer `trad/translations copy.lua`
5. Commit "chore: drop stale translations copy"
