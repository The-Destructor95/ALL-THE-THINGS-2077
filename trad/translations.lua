-- ATT 2.5 - merged translation file
-- Generated from Interface.lua + Description.json + vehicles.json
--
-- !!! DO NOT TRANSLATE THE ENGLISH VERSION — add new languages alongside `en` and `fr` !!!
--
-- Layout:
--   M.interface                    -> UI strings (en / fr / ...)
--   M.descriptions                 -> item descriptions (en / fr / ...), {placeholders} resolved at load
--   M.common_descriptions          -> placeholder values for descriptions
--   M.vehicle_descriptions         -> vehicle descriptions (en / fr / ...), {placeholders} resolved at load
--   M.vehicle_common_descriptions  -> placeholder values for vehicle descriptions

local M = {}

M.interface = {
    en = {
        --Title
            ATT_TiTLE = "ALL THE THINGS 2077",
    
        --Page Menu
            ATT_EXCLUSIVE_ITEMS = "Exclusive items",
    
        --Page Principale
            --header
                ATT_TITLE_GAME= "Cyberpunk 2077",
                ATT_TITLE_DLC= "Phantom liberty",
                ATT_PROGRESS = "Total progression : ",
                ATT_SEARCH_HINT = "Search...",
                ATT_SEARCH_NO_RESULTS = "No matching items",
                ATT_SEARCH_RESULTS_LABEL = "results",
        
            --Left menu
               --CollapsingHeader
                    ATT_VEHICLES = "Vehicles",
                    ATT_CLOTHES = "Clothes",
                    ATT_COSMETICS = "Cosmetics sets",
                    ATT_WEAPONS = "Weapons",
                    ATT_RANGED_WEAPONS = "Ranged Weapons",
                    ATT_MELEE_WEAPONS = "Melee Weapons",
                    ATT_CYBERWARE = "Cyberware",
                    ATT_QUICKHACKS = "Quickhacks",
                    ATT_MOD = "mod & attachement",
                    ATT_THROWABLE = "Melee & Throwable Weapon",
                    ATT_MUZZLES = "Muzzles",
                    ATT_Settings= "Settings",
                    ATT_MISC = "Misc",
                    ATT_QUESTS = "Quests",
                    ATT_QUEST_MAIN = "Main jobs",
                    ATT_QUEST_SECONDARY = "Side jobs",
                    ATT_QUEST_SIDE = "Side quests",
                    ATT_QUEST_GIG = "Gigs",
                    -- Main-job act / chapter sub-headers (base game)
                    ATT_QUEST_PROLOGUE = "Prologue",
                    ATT_QUEST_ACT1 = "Act 1",
                    ATT_QUEST_INTERLUDE = "Interlude",
                    ATT_QUEST_ACT2 = "Act 2",
                    ATT_QUEST_ACT3 = "Act 3",
                    ATT_QUEST_EPILOGUE = "Epilogue",
                    ATT_QUEST_EVELYN = "Evelyn Parker",
                    ATT_QUEST_ALT = "Alt Cunningham",
                    ATT_QUEST_HELLMAN = "Anders Hellman",
                    ATT_QUEST_HANAKO = "Hanako Arasaka",
                    ATT_QUEST_THE_DEVIL = "The Devil",
                    ATT_QUEST_THE_SUN = "The Sun",
                    ATT_QUEST_THE_STAR = "The Star",
                    ATT_QUEST_SECRET = "Secret",
                    -- Phantom Liberty main-job sub-headers
                    ATT_QUEST_PL_PROLOGUE = "Phantom Liberty",
                    ATT_QUEST_KING_OF_WANDS = "King of Wands",
                    ATT_QUEST_KING_OF_SWORDS = "King of Swords",
                    ATT_QUEST_KING_OF_CUPS = "King of Cups",
                    ATT_QUEST_KING_OF_PENTACLES = "King of Pentacles",
                    -- Side-job sub-categories (by quest giver / theme)
                    ATT_QUEST_NPC_JOHNNY = "Johnny Silverhand",
                    ATT_QUEST_NPC_JUDY = "Judy Álvarez",
                    ATT_QUEST_NPC_PANAM = "Panam Palmer",
                    ATT_QUEST_NPC_RIVER = "River Ward",
                    ATT_QUEST_NPC_KERRY = "Kerry Eurodyne",
                    ATT_QUEST_LIFEPATHS = "Lifepaths",
                    ATT_QUEST_ALDECALDOS = "Aldecaldos",
                    ATT_QUEST_NPC_BRENDAN = "Brendan",
                    ATT_QUEST_NPC_CLAIRE = "Claire Russell",
                    ATT_QUEST_NPC_COACH = "Coach Fred",
                    ATT_QUEST_NPC_DELAMAIN = "Delamain",
                    ATT_QUEST_NPC_PERALEZ = "Jefferson Peralez",
                    ATT_QUEST_NPC_JOSHUA = "Joshua Stephenson",
                    ATT_QUEST_NPC_NIX = "Nix",
                    ATT_QUEST_NPC_REGINA = "Regina Jones",
                    ATT_QUEST_NPC_WILSON = "Robert Wilson",
                    ATT_QUEST_NPC_VIKTOR = "Viktor Vektor",
                    ATT_QUEST_NPC_ZEN = "Zen Master",
                    ATT_QUEST_VEHICLES = "Vehicles",
                    ATT_QUEST_APARTMENTS = "Apartments",
                    ATT_QUEST_MISC = "Miscellaneous",
                    ATT_QUEST_NPC_REYES = "Muamar Reyes",
                    ATT_QUEST_NPC_HANDS = "Mr. Hands",
    
            --Button 
                --vehicles
                    ATT_CARS = "Cars",
                    ATT_MOTO = "Motorcycles",
                --ranged weapons
                    ATT_PISTOLS = "Pistol",
                    ATT_REVOLVERS = "Revolvers",
                    ATT_ASSAULT_RIFLES = "Assault Rifles",
                    ATT_PRECISION_RIFLES = "Precision Rifles",
                    ATT_SNIPER_RIFLES = "Sniper Rifles",
                    ATT_SHOTGUNS = "Shotguns",
                    ATT_SMG = "Smgs",
                    ATT_HMG = "Hmgs",
                    ATT_GRENADES = "Grenades",
    
                --melee weapons
                    ATT_TWO_HANDLE = "Two Handed Club",
                    ATT_ONE_HANDLE = "One Handed Club",
                    ATT_HAMMERS = "Hammers",
                    ATT_SWORDS = "Swords",
                    ATT_MACHETES = "Machetes",
                    ATT_KNIVES = "Knives",
                    ATT_KATANAS = "Katanas",
                    ATT_CHAINSWORDS = "Chainswords",
                    ATT_AXES = "Axes",
    
                --Clothes
                    ATT_HEAD = "Heads",
                    ATT_FACE = "Face",
                    ATT_FEET = "Feet",
                    ATT_INNERTORSOS = "Innertorsos",
                    ATT_LEGS = "Legs",
                    ATT_OUTERTORSOS = "Outertorsos",
                    ATT_COP = "cop",
                    ATT_TECHIE = "Techie",
    
                --cyberwares
                    ATT_ARMS = "Arms",
                    ATT_CIRCULATORY_SYSTEMS = "Circulatory Systems",
                    ATT_FRONTAL_CORTEX = "Frontal Cortex",
                    ATT_HANDS = "Hands",
                    ATT_INTEGUMENTARY = "Integumentary Systems",
                    ATT_LEGSCY = "Legs",
                    ATT_NERVOUS_SYSTEM = "Nervous Systems",
                    ATT_OPERATION_SYSTEMS = "Operating Systems",
                    ATT_SKELETONS = "Skeletons",
    
                --quickhacks
                    ATT_COMBAT = "Combats",
                    ATT_CONTROL = "Controls",
                    ATT_COVERT = "Coverts",
                    ATT_ULTIMATE = "Ultimates",
    
                --mod & attachement
                    ATT_RANGEDMOD = "Ranged",
                    ATT_POWERMOD = "Power",
                    ATT_TECHMOD = "Tech",
                    ATT_SMARTMOD = "Smart",
                    ATT_ARSMGLMGMOD = "AR/SMG/LMG",
                    ATT_PISTREVMOD = "Pistol / Revolver",
                    ATT_SNIPEPRECMOD = "Sniper / Precision Rifle",
                    ATT_SHOTGUNMOD = "Shotgun",
                    ATT_MELEEMOD = "Melee",
                    ATT_BLADEMOD = "Blade",
                    ATT_BLUNTMOD = "Blunt",
                    ATT_THROWABLEMOD = "Throwable",
    
                --muzzles
                    ATT_SCOPESHORTMOD = "Short Scopes",
                    ATT_SCOPELONGMOD = "Long Scope",
                    ATT_SCOPESNIPEMOD = "Sniper Scopes",
                    ATT_SILENCERMOD = "Silencers",
                    ATT_MUZZLES_AR_SMG = "Assault Rifle / SMG",
                    ATT_MUZZLE_HANDGUN = "Handguns",

                --settings
                    ATT_GENERAL = "General",
                    ATT_CHANGELOG = "Changelog",
                    ATT_INFORMATION = "Information",
                    

            --Details menu
                --Clothes
                    ATT_COP_ROLE = "Represents the Cop role",
                    ATT_CORPORATE_ROLE = "Represents the Corporate role.",
                    ATT_FIXER_ROLE = "Represents the Fixer role.",
                    ATT_MEDIA_ROLE = "Represents the Media role.",
                    ATT_NETRUNNER_ROLE = "Represents the Netrunner role.",
                    ATT_NOMAD_ROLE = "Represents the Nomad role.",
                    ATT_ROCKER_ROLE = "Represents the Rocker role.",
                    ATT_SOLO_ROLE = "Represents the Solo role.",
                    ATT_TECHIE_ROLE = "Represents the Techie role.",
                    ATT_SILVEHAND = "The clothing that Johnny Silverhand used to wear when he was still alive. Obtainable throughout the main story.",
                    ATT_CORPORAT = "The clothing that V wears during The Corpo-Rat.",
                    ATT_NOMAD = "The clothing that V wears during The Nomad.",
                    ATT_STREETKID = "The clothing that V wears during The Streetkid.",
                    ATT_THE_RESCUE = "The clothing that V used to wear. Obtained during The Rescue.",
                    ATT_YORINOBU = "The clothing that can be found in Yorinobu's Penthouse during The Heist.",
                    ATT_MAXTAC = "This clothing can only be acquired by a female V after romancing Judy Álvarez.",
                    ATT_TWITCH = "Equipment set that could be obtained through Twitch.tv promotions.",
                    ATT_WATCHTOWER = "The clothing that V wears during the All Along the Watchtower ending.",
                    ATT_POG_ENDING = "The clothing that V wears during the Path of Glory ending.",
                    ATT_NDF_ENDING = "The clothing that Johnny Silverhand wears during the New Dawn Fades ending.",
    
            --Global 
                ATT_Obtention ="Acquisition",
                ATT_ExtraInfo ="Additional information",
                ATT_Ennemie ="Can be acquired from the followings ennemies",
                ATT_Vendor ="Can be purchased from :",
                ATT_Mission ="Mission",
                ATT_NOTIFICATION = "Notification",
                ATT_NOTIFICATION_DISABLE = "Disable notification",
                ATT_Collected_Item = "Item acquired",
                ATT_Collected_vehicules = "Vehicle acquired",
                ATT_FILTERS = "Filters",

    
        --Page settings
            --General
                ATT_CURRENT_LANGUAGE = "Current language : ",
                ATT_ENGLISH= "English",
                ATT_TRAD= "French",-- change with your language
                ATT_HIDE_ITEMS = "hide items obtained",
                ATT_UNOWNED_ITEMS = "hide items not obtained",
                ATT_CHOICE = "choose your life path",
    
            --misc
                ATT_CRAFTING_COMPONENTS = "Crafting Components",
                ATT_BUFF = "Buff",
                ATT_MEDICATION = "Medication",
                ATT_ALCOHOL = "Alcohol",
                ATT_DRINK = "Drink",
                ATT_FOOD = "Food",

            --Information 
                ATT_CREDITS = "Credits",
                ATT_GRATITUDE = "A big thank you to Yakuzadeso for allowing me to reuse his code and contribute \nto the improvement of the project.\n\nAlso, a huge thank you to Huntaziel and Tw3nny for taking the time \nto test the mod and help me perfect it.\n\nThanks again!",
        
    },
        
    fr = {
        Type_66_Hoon = "Dans un entrepôt de Northside, au nord-est de Watson, Johnny Silverhand apparaîtra près d'un Quadra Type-66 'Hoon', un véhicule armé. Derrière ce véhicule se trouve une étagère métallique qui s'est effondrée, recouvrant un petit conteneur. La clé du Quadra se trouve à l'intérieur de ce conteneur.",
        --Title
            ATT_TiTLE= "ALL THE THINGS 2077",
    
        --Page Menu
            ATT_EXCLUSIVE_ITEMS = "Items exclusifs",
    
        --Page Principale
            --header
                ATT_TITLE_GAME= "Cyberpunk 2077",
                ATT_TITLE_DLC= "Phantom liberty",
                ATT_PROGRESS = "Progression Totale : ",
                ATT_SEARCH_HINT = "Rechercher...",
                ATT_SEARCH_NO_RESULTS = "Aucun objet correspondant",
                ATT_SEARCH_RESULTS_LABEL = "résultats",
    
            --Left menu
               --CollapsingHeader
                ATT_VEHICLES = "Vehicules",
                ATT_CLOTHES = "Vêtements",
                ATT_WEAPONS = "Armes",
                ATT_RANGED_WEAPONS = "Armes a distance",
                ATT_MELEE_WEAPONS = "Armes de melee",
                ATT_CYBERWARE = "Materiel Cyber",
                ATT_QUICKHACKS = "Piratage rapide",
                ATT_QUESTS = "Quêtes",
                ATT_QUEST_MAIN = "Quêtes principales",
                ATT_QUEST_SECONDARY = "Quêtes secondaires",
                ATT_QUEST_SIDE = "Side quests",
                ATT_QUEST_GIG = "Contrats",
                -- Sous-en-têtes des quêtes principales (jeu de base)
                ATT_QUEST_PROLOGUE = "Prologue",
                ATT_QUEST_ACT1 = "Acte 1",
                ATT_QUEST_INTERLUDE = "Interlude",
                ATT_QUEST_ACT2 = "Acte 2",
                ATT_QUEST_ACT3 = "Acte 3",
                ATT_QUEST_EPILOGUE = "Épilogue",
                ATT_QUEST_EVELYN = "Evelyn Parker",
                ATT_QUEST_ALT = "Alt Cunningham",
                ATT_QUEST_HELLMAN = "Anders Hellman",
                ATT_QUEST_HANAKO = "Hanako Arasaka",
                ATT_QUEST_THE_DEVIL = "Le Diable",
                ATT_QUEST_THE_SUN = "Le Soleil",
                ATT_QUEST_THE_STAR = "L'Étoile",
                ATT_QUEST_SECRET = "Secrète",
                -- Sous-en-têtes Phantom Liberty
                ATT_QUEST_PL_PROLOGUE = "Phantom Liberty",
                ATT_QUEST_KING_OF_WANDS = "Roi de Bâton",
                ATT_QUEST_KING_OF_SWORDS = "Roi d'Épée",
                ATT_QUEST_KING_OF_CUPS = "Roi de Coupe",
                ATT_QUEST_KING_OF_PENTACLES = "Roi de Denier",
                -- Sous-catégories des quêtes secondaires (par donneur / thème)
                ATT_QUEST_NPC_JOHNNY = "Johnny Silverhand",
                ATT_QUEST_NPC_JUDY = "Judy Álvarez",
                ATT_QUEST_NPC_PANAM = "Panam Palmer",
                ATT_QUEST_NPC_RIVER = "River Ward",
                ATT_QUEST_NPC_KERRY = "Kerry Eurodyne",
                ATT_QUEST_LIFEPATHS = "Origines",
                ATT_QUEST_ALDECALDOS = "Aldecaldos",
                ATT_QUEST_NPC_BRENDAN = "Brendan",
                ATT_QUEST_NPC_CLAIRE = "Claire Russell",
                ATT_QUEST_NPC_COACH = "Coach Fred",
                ATT_QUEST_NPC_DELAMAIN = "Delamain",
                ATT_QUEST_NPC_PERALEZ = "Jefferson Peralez",
                ATT_QUEST_NPC_JOSHUA = "Joshua Stephenson",
                ATT_QUEST_NPC_NIX = "Nix",
                ATT_QUEST_NPC_REGINA = "Regina Jones",
                ATT_QUEST_NPC_WILSON = "Robert Wilson",
                ATT_QUEST_NPC_VIKTOR = "Viktor Vektor",
                ATT_QUEST_NPC_ZEN = "Zen Master",
                ATT_QUEST_VEHICLES = "Véhicules",
                ATT_QUEST_APARTMENTS = "Appartements",
                ATT_QUEST_MISC = "Divers",
                ATT_QUEST_NPC_REYES = "Muamar Reyes",
                ATT_QUEST_NPC_HANDS = "Mr. Hands",
                ATT_MOD = "mod & attachement",
                ATT_THROWABLE = "Arme de mêlée et arme jetable",
                ATT_MUZZLES = "Canon",
                ATT_COSMETICS = "Ensembles cosmétiques",
                ATT_Settings= "Parametres",
                ATT_MISC = "Divers",

            --Button 
                --vehicles
                    ATT_CARS = "Voitures",
                    ATT_MOTO = "Motos",
    
                --ranged weapons
                    ATT_PISTOLS = "Pistoler",
                    ATT_REVOLVERS = "Revolvers",
                    ATT_ASSAULT_RIFLES = "Fusils d'assault",
                    ATT_PRECISION_RIFLES = "Fusils de precision",
                    ATT_SNIPER_RIFLES = "Fusils de sniper",
                    ATT_SHOTGUNS = "Fusils à pompe",
                    ATT_SMG = "Smgs",
                    ATT_HMG = "Hmgs",
                    ATT_GRENADES = "Grenades",
            
                --melee weapons
                    ATT_TWO_HANDLE = "Matraque a deux mains ",
                    ATT_ONE_HANDLE = "Matraque a une mains",
                    ATT_HAMMERS = "Marteaux",
                    ATT_SWORDS = "Épées",
                    ATT_MACHETES = "Machetes",
                    ATT_KNIVES = "Couteaux",
                    ATT_KATANAS = "Katanas",
                    ATT_CHAINSWORDS = "Epee tronconneuse",
                    ATT_AXES = "Haches",
            
                --Clothes
                    ATT_HEAD = "Tete",
                    ATT_FACE = "Visage",
                    ATT_FEET = "Pieds",
                    ATT_INNERTORSOS = "Haut leger",
                    ATT_LEGS = "Jambes",
                    ATT_OUTERTORSOS = "Haut",
                    ATT_COP = "Flic",
                    ATT_TECHIE = "technicien",
                
                --cyberwares
                    ATT_ARMS = "Bras",
                    ATT_CIRCULATORY_SYSTEMS = "Systèmes sanguin",
                    ATT_FRONTAL_CORTEX = "Cortex Frontal ",
                    ATT_HANDS = "Mains",
                    ATT_INTEGUMENTARY = "Systèmes tégumentaires",
                    ATT_LEGSCY = "Jambes",
                    ATT_NERVOUS_SYSTEM = "Systemes nerveux",
                    ATT_OPERATION_SYSTEMS = "Systèmes d'exploitation",
                    ATT_SKELETONS = "Skelette",
            
                --quickhacks
                    ATT_COMBAT = "Combat",
                    ATT_CONTROL = "Controles",
                    ATT_COVERT = "Furtivite",
                    ATT_ULTIMATE = "Ultime",
    
                --mod & attachement
                    ATT_RANGEDMOD = "module",
                    ATT_POWERMOD = "Cinetique",
                    ATT_TECHMOD = "Technique ",
                    ATT_SMARTMOD = "Intelligente",
                    ATT_ARSMGLMGMOD = "AR/SMG/LMG",
                    ATT_PISTREVMOD = "Pistoler / Revolvers",
                    ATT_SNIPEPRECMOD = "Sniper / Fusils de precision",
                    ATT_SHOTGUNMOD = "Fusils à pompe",
                    ATT_MELEEMOD = "Melee",
                    ATT_BLADEMOD = "Lame",
                    ATT_BLUNTMOD = "Contodante",
                    ATT_THROWABLEMOD = "Jetables",
                    
                --muzzles
                    ATT_SCOPESHORTMOD = "Lunettes de visée courtes",
                    ATT_SCOPELONGMOD = "Longue portée",
                    ATT_SCOPESNIPEMOD = "Lunettes de visée",
                    ATT_SILENCERMOD = "Silencieux",
                    ATT_MUZZLES_AR_SMG = "Fusils d'assault / SMG",
                    ATT_MUZZLE_HANDGUN = "Pistoler",

                --misc
                    ATT_CRAFTING_COMPONENTS = "Composants de fabrication",
                    ATT_BUFF = "Améliorations",
                    ATT_MEDICATION = "Médicaments",
                    ATT_ALCOHOL = "Alcool",
                    ATT_DRINK = "Boisson",
                    ATT_FOOD = "Alimentation",
               
                --settings
                    ATT_GENERAL = "General",
                    ATT_CHANGELOG = "Changelog",
                    ATT_INFORMATION = "Information",
                    
    
            --Details menu
                --Clothes
                    ATT_COP_ROLE = "Représente le rôle du flic",
                    ATT_CORPORATE_ROLE = "Représente le rôle de Corpo.",
                    ATT_FIXER_ROLE = "Représente le rôle de Fixeur.",
                    ATT_MEDIA_ROLE = "Représente le rôle des médias.",
                    ATT_NETRUNNER_ROLE = "Représente le rôle Netrunner.",
                    ATT_NOMAD_ROLE = "Représente le rôle de Nomade.",
                    ATT_ROCKER_ROLE = "Représente le rôle de Rocker.",
                    ATT_SOLO_ROLE = "Représente le rôle Solo .",
                    ATT_TECHIE_ROLE = "Représente le rôle de technicien.",
                    ATT_SILVEHAND = "Les vêtements que Johnny Silverhand portait lorsqu'il était encore en vie. Obtenables tout au long de l'histoire principale.",
                    ATT_CORPORAT = "Les vêtements que V porte pendant The Corpo-Rat.",
                    ATT_NOMAD = "Les vêtements que V porte pendant The Nomad.",
                    ATT_STREETKID = "Les vêtements que V porte pendant The Streetkid",
                    ATT_THE_RESCUE = "Les vêtements que V portait. Obtenus lors de The Rescue",
                    ATT_YORINOBU = "Les vêtements que l'on peut trouver dans le Penthouse de Yorinobu pendant The Heist.",
                    ATT_MAXTAC = "Ce vêtement ne peut être acquis que par une femme V après avoir eu une relation avec Judy Álvarez.",
                    ATT_TWITCH = "Ensemble d'équipements pouvant être obtenus grâce aux promotions Twitch.tv.",
                    ATT_WATCHTOWER = "Les vêtements que V porte pendant la fin de All Along the Watchtower.",
                    ATT_POG_ENDING = "Les vêtements que V porte pendant la fin du Chemin de la Gloire.",
                    ATT_NDF_ENDING = "Les vêtements que porte Johnny Silverhand pendant la fin de New Dawn Fades.",
    
            --Global 
                ATT_Obtention ="Obtention",
                ATT_ExtraInfo ="Informations supplémentaires",
                ATT_Ennemie ="Peut être obtenu auprès des ennemis suivants",
                ATT_Vendor ="Peut être acheté auprès de :",
                ATT_Mission ="Mission",
                ATT_NOTIFICATION = "Notification",
                ATT_NOTIFICATION_DISABLE = "Desactiver la notification",
                ATT_Collected_Item = "Item obtenu",
                ATT_Collected_vehicules = "Véhicule obtenu",
                ATT_FILTERS = "Filtres",


        --Page settings
            --General
                ATT_CURRENT_LANGUAGE = "langage actif : ",
                ATT_ENGLISH= "Anglais",
                ATT_TRAD= "Francais", -- change with your language
                ATT_HIDE_ITEMS = "masquer les items obtenues",
                ATT_UNOWNED_ITEMS = "masquer les items non obtenues",
                ATT_CHOICE = "choisir le chemin de vie",
            
            --Information 
                ATT_CREDITS = "Credits";
                ATT_GRATITUDE = "Un grand merci à Yakuzadeso pour m'avoir permis de réutiliser son code \net de contribuer à l'amélioration du projet.\n\nEgalement, un grand merci à Huntaziel et Tw3nny pour avoir pris le temps de tester le mod et de m'aider à le perfectionner.\n\nMerci encore !",
       
    }
       
       
    }

M.common_descriptions = {
    vendor_kabuki = {
        en = "Weapon Vendor in kabuki",
        fr = "Vendeur d'armes à Kabuki",
    },
    vendor_weapons = {
        en = "Weapon Vendor",
        fr = "Vendeur d'armes",
    },
    vendor_Japantown = {
        en = "Weapon Vendor in Japantown",
        fr = "Vendeur d'armes à Japantown",
    },
    vendor_Vista_del_Rey = {
        en = "Weapon Vendor in Vista del Rey",
        fr = "Vendeur d'armes à Vista del Rey",
    },
    vendor_Arroyo = {
        en = "Weapon Vendor in Arroyo",
        fr = "Vendeur d'armes à Arroyo",
    },
    vendor_Robert_Wilson = {
        en = "Robert Wilson in Little China",
        fr = "Robert Wilson dans Little China",
    },
    vendor_Red_Peaks = {
        en = "Weapon Vendor in Red Peaks",
        fr = "Vendeur d'armes à Red Peaks",
    },
    vendor_Downtown = {
        en = "Weapon Vendor in Downtow",
        fr = "Vendeur d'armes à Centre",
    },
    vendor_Wellsprings = {
        en = "Weapon Vendor in Wellsprings",
        fr = "Vendeur d'armes à Wellsprings",
    },
    vendor_Northside = {
        en = "Maelstrom Weapon Vendor in Northside",
        fr = "Vendeur d'armes Maelstrom à Northside",
    },
    vendor_Rancho_Coronado = {
        en = "Weapon Vendor in Rancho_Coronado}",
        fr = "Vendeur d'armes à Rancho Coronado",
    },
    vendor_Glen = {
        en = "Weapon Vendor in Glen",
        fr = "Vendeur d'armes à Glen",
    },
    vendor_West_Wind_Estate = {
        en = "Weapon Vendor in West Wind Estate",
        fr = "Vendeur d'armes à West Wind Estate",
    },
    vendor_mele_West_Wind_Estate = {
        en = "Melee weapons vendor in West Wind Estate",
        fr = "Vendeur d'armes de melee à West Wind Estate",
    },
    vendor_mele_Japantown = {
        en = "Melee weapons vendor in Japantown",
        fr = "Vendeur d'armes de melee à Japantown",
    },
    vendor_mele_Jackson_Plains = {
        en = "Melee weapons vendor in Jackson Plains",
        fr = "Vendeur d'armes de melee à Jackson Plains",
    },
    vendor_mele_rancho = {
        en = "Melee weapons vendor in Rancho Coronado",
        fr = "Vendeur d'armes de melee à Rancho Coronado",
    },
    vendor_given = {
        en = "Given to V by",
        fr = "Donné à V par",
    },
    vendor_given_reward = {
        en = "Given to V as a reward",
        fr = "Donné à V en récompense.",
    },
    vendor_given_falcon = {
        en = "Given to V if they reached out to Carol Emeka to help fight MaxTac.",
        fr = "Donné à V s'il a contacté Carol Emeka pour l'aider à combattre MaxTac .",
    },
    vendor_dropped = {
        en = "Dropped by",
        fr = "Lâchés par",
    },
    vendor_purchased = {
        en = "Can be purchased",
        fr = "Peut être acheté",
    },
    vendor_purchased_add = {
        en = "if the player did not loot the weapon, or did not choose the Corpo lifepath.",
        fr = "si le joueur n'a pas pillé l'arme ou n'a pas choisi le chemin de vie Corpo .",
    },
    vendor_looted = {
        en = "Can be looted from",
        fr = "Peut être pillé à partir des",
    },
    vendor_Airdrops = {
        en = "Airdrops",
        fr = "Parachutages",
    },
    vendor_Chinook = {
        en = "after looting Chinook",
        fr = "après avoir pillé Chinook",
    },
    vendor_CATAHOULA = {
        en = "Was available through Amazon Prime Gaming from January 24, 2024 through February 28, 2024. It is automatically added to V's stash.",
        fr = "Était disponible sur Amazon Prime Gaming du 24 janvier 2024 au 28 février 2024. Il est automatiquement ajouté à la réserve de V.",
    },
    vendor_only_obtained = {
        en = "can only be obtained",
        fr = "Ne peut être obtenu que",
    },
    vendor_only_obtained_royce = {
        en = "if Royce is neutralized at any point in the quest, either by becoming hostile to Maelstrom or by siding with them and letting Militech kill him.",
        fr = "si Royce est neutralisé à n'importe quel moment de la quête, soit en devenant hostile à Maelstrom, soit en se rangeant de leur côté et en laissant Militech le tuer",
    },
    vendor_stade = {
        en = "in the EBM Petrochem Stadium in Dogtown",
        fr = "au stade EBM Petrochem à Dogtown",
    },
    vendor_not_looted = {
        en = "if not looted from the above location",
        fr = "s'il n'a pas été pillé à l'endroit ci-dessus",
    },
    vendor_not_dropped = {
        en = "This weapon is not dropped during his possible encounter in Second Conflict.",
        fr = "Cette arme n'est pas lâchée lors de sa possible rencontre dans Second Conflit",
    },
    vendor_found_bag = {
        en = "Found inside a travel bag in VIP Room 06 of Heavy Hearts.",
        fr = "Trouvé à l'intérieur d'un sac de voyage dans la salle VIP 06 de Heavy Hearts",
    },
    vendor_DEATH_AND_TAXES = {
        en = "Can be found in Maiko Maeda's office in Clouds. \nIf not obtained during Ex-Factor, it can be picked up from Judy's Apartment after Maiko sends a message to her computer",
        fr = "Peut être trouvé dans le bureau de Maiko Maeda dans Clouds \nS'il n'est pas obtenu pendant Ex-Factor, il peut être récupéré dans l'appartement de Judy après que Maiko ait envoyé un message à son ordinateur",
    },
    vendor_free = {
        en = "Obtained for free from",
        fr = "Obtenu gratuitement auprès de",
    },
    vendor_GENJIROH = {
        en = "One can be found behind a closed door on floor 21. The code is 2906. It is also possible to open the door with a difficult Technical Ability check. \n\nArasaka Estate - One can be found on a desk. Can be obtained after starting Act II.",
        fr = "On peut en trouver un derrière une porte fermée au 21e étage. Le code est 2906. Il est également possible d'ouvrir la porte avec un test de compétence technique difficile\n\nArasaka Estate -  On peut en trouver un sur un bureau. Peut être obtenu après avoir commencé l'acte II. ",
    },
    vendor_HER_MAJESTY = {
        en = "Given at the end of the quest, in a small weapon case at the table, next to the diving gear you need.",
        fr = "Donné à la fin de la quête, dans un petit étui à armes sur la table, à côté de l'équipement de plongée dont vous avez besoin.",
    },
    vendor_KAPPA_X_MOD = {
        en = "Can be found in a small building west of the Eventide Resort & Spa after completing Gig: Spy in the Jungle. \nRequires opening a blocked opening with 10 Body",
        fr = "Peut être trouvé dans un petit bâtiment à l'ouest de l' Eventide Resort & Spa après avoir terminé le contrat : Espion dans la jungle . \nNécessite d'ouvrir une ouverture bloquée avec 10 Corps",
    },
    vendor_KONGOU = {
        en = "On a table at the foot of the bed in Yorinobu's Penthouse in Konpeki Plaza",
        fr = "Sur une table au pied du lit dans le Penthouse de Yorinobu à Konpeki Plaza",
    },
    vendor_LA_CHINGONA_DORADA = {
        en = "Can be found in the El Coyote Cojo, after completion and waiting 24 hours. ",
        fr = "Peut être trouvé dans le El Coyote Cojo , après avoir terminé et attendu 24 heures.",
    },
    vendor_LEXINGTON_X_MOD_2 = {
        en = "for getting first place in the shooting competition.",
        fr = "pour avoir obtenu la première place au concours de tir.",
    },
    vendor_MALORIAN_ARMS_3516 = {
        en = "Acquired from",
        fr = "Acquis auprès de",
    },
    vendor_PLAN_B = {
        en = "Can be looted from Dexter DeShawn's body at the Municipal Landfill at any point after Act I.",
        fr = "peut être récupéré sur le corps de Dexter DeShawn à la décharge municipale à tout moment après l'acte I",
    },
    vendor_PRIDE = {
        en = "By grabbing the gun after the fight with Adam Smasher. \n\nEnding Reward - After obtaining the Pride in aforementioned quest and finishing the game, upon returning to the \"Point of No Return\", you'll be rewarded with one. \nThis unlocks the iconic weapon, and every time you finish an ending with that character, you'll receive one as long as you don't already have it in that save file.",
        fr = "En saisissant l'arme après le combat avec Adam Smasher.\n\nPhantom Liberty - Après avoir obtenu la Pride dans la quête susmentionnée et terminé le jeu, en revenant au « Point de non-retour », vous en recevrez une. \nCela débloque l'arme emblématique, et chaque fois que vous terminez une fin avec ce personnage, vous en recevrez une tant que vous ne l'avez pas déjà dans ce fichier de sauvegarde.",
    },
    vendor_RISKIT = {
        en = "if she is neutralized. \nIf she survives, she will leave it on a nearby table.",
        fr = "si elle est neutralisée. \nSi elle survit, elle le laissera sur une table à proximité.",
    },
    vendor_ROOK = {
        en = "Can be found inside a cache in front of \"Aesculapius Inc.\" in the lower ring of The Needle. \nThe cache can be opened using the code 941229. \nThe cache can be opened prior to the quest.",
        fr = "Peut être trouvé dans une cache devant \"Aesculapius Inc.\" dans l'anneau inférieur de The Needle . \nLa cache peut être ouverte en utilisant le code 941229. \nLa cache peut être ouverte avant la quête.",
    },
    vendor_SCORCH = {
        en = "Unlocked by owning GWENT: \nThe Witcher Card Game and Cyberpunk 2077: Phantom Liberty on the GOG Galaxy platform or by linking your account with GOG if owned on Steam. It is automatically added to V's stash.",
        fr = "Débloqué en possédant GWENT: \nThe Witcher Card Game et Cyberpunk 2077 : Phantom Liberty sur la plateforme GOG Galaxy ou en liant votre compte à GOG si vous le possédez sur Steam.Il est automatiquement ajouté à la réserve de V.",
    },
    vendor_v_stash = {
        en = "Found in V's Stash.",
        fr = "Trouvé dans la réserve de V.",
    },
    vendor_SKIPPY_desc = {
        en = "Skippy can be found next to a body in an alley in Vista del Rey, Heywood.",
        fr = "Skippy peut être trouvé à côté d'un corps dans une ruelle à Vista del Rey , Heywood.",
    },
    vendor_SKIPPY_desc_additional = {
        en = "If returned, Skippy can be reacquired from Regina's place after receiving a text message from her.",
        fr = "S'il est renvoyé, Skippy peut être récupéré chez Regina après avoir reçu un SMS de sa part.",
    },
    vendor_lvl = {
        en = "starting from level",
        fr = "a partir du niveau",
    },
    vendor_from = {
        en = "from",
        fr = "auprès de",
    },
    vendor_LIZZIE = {
        en = "In a private room adjacent to Judy Álvarez' den in Lizzie's Bar. ",
        fr = "Dans une salle privée adjacente au bureau de Judy Álvarez au Lizzie's Bar",
    },
    vendor_conditions = {
        en = "The conditions still apply.",
        fr = "Les conditions s'appliquent.",
    },
    vendor_R_MK2 = {
        en = "the elite Robot R Mk.2.",
        fr = "le robot d'élite R Mk.2",
    },
    vendor_pimp = {
        en = "Pimp Variant",
        fr = "Pimp Variant",
    },
    vendor_military = {
        en = "Military Variant",
        fr = "variante militaire",
    },
    vendor_neon = {
        en = "Neon Variant",
        fr = "variante néon",
    },
    vendor_craft = {
        en = "Crafting Spec can be purchased",
        fr = "Le plan de fabrication peut être achetée",
    },
    vendor_BARGHEST = {
        en = "BARGHEST varian",
        fr = "variante BARGHEST",
    },
    vendor_Suspected_Organized_Crime_Activity = {
        en = "during a Suspected Organized Crime Activity:",
        fr = "lors d'une activité criminelle organisée suspectée:",
    },
    vendor_SOCA = {
        en = "Suspected Organized Crime Activity",
        fr = "Activité criminelle organisée suspectée:",
    },
    vendor_craftings = {
        en = "Crafting Spec",
        fr = "Le plan de fabrication",
    },
    vendor_tier = {
        en = "tier",
        fr = "niveau",
    },
    vendor_default = {
        en = "known by default",
        fr = "connue par défaut",
    },
    vendor_aldecaldos = {
        en = "Aldecaldos Weapon Vendor in Rocky Ridge",
        fr = "Vendeur d'armes Aldecaldos à Rocky Ridge",
    },
    vendor_Ben_DeBaillon = {
        en = "A variant with an intrinsic modifier {vendor_looted} Ben DeBaillon during Lex Talionis",
        fr = "Une variante avec un modificateur intrinsèque peut être récupérée sur Ben DeBaillon pendant Lex Talionis",
    },
    vendor_Maelstrom = {
        en = "maelstrome variant",
        fr = "variante Maelstrom",
    },
    vendor_Longshore_Stacks = {
        en = "in Longshore Stacks , Dogtown",
        fr = "à Longshore Stacks , Dogtown",
    },
    vendor_SLAUGHT_O_MATIC = {
        en = "The Slaught-O-Matic can be purchased for $100 at a Budget Arms S.C.S.M.",
        fr = "Le Slaught-O-Matic peut être acheté pour 100 $ chez Budget Arms S.C.S.M.",
    },
    vendor_Biotechnica_Flats = {
        en = "in Biotechnica Flats",
        fr = "dans Biotechnica Flats",
    },
    vendor_AMNESTY = {
        en = "Rewarded by Cassidy for shooting at least 12 of the 16 bottles during his mini game. \n\nEnding Reward - After obtaining the Amnesty in aforementioned quest and finishing the game, upon returning to the \"Point of No Return\", you'll be rewarded with one. This unlocks the iconic weapon, and every time you finish an ending with that character, you'll receive one as long as you don't already have it in that save file.",
        fr = "Récompensé par Cassidy pour avoir tiré au moins 12 des 16 bouteilles pendant son mini-jeu.\n\nEnding Reward - Après avoir obtenu l'amnistie dans la quête susmentionnée et terminé le jeu, en revenant au « Point de non-retour », vous en recevrez une. Cela débloque l'arme emblématique, et chaque fois que vous terminez une fin avec ce personnage, vous en recevrez une tant que vous ne l'avez pas déjà dans ce fichier de sauvegarde.",
    },
    vendor_GRIS_GRIS = {
        en = "Can be obtained in the locked off section that can be opened with Slider's hideout storage room key, which can be obtained during the Gig: Treating Symptoms.",
        fr = "Peut être obtenue dans la section verrouillée qui peut être ouverte avec la clé de la salle de stockage de la cachette de Slider , qui peut être obtenue pendant le contrat Treating Symptoms.",
    },
    vendor_LAIKA = {
        en = "Found during the first Airdrop at Los Osos in Dogtown",
        fr = "Trouvé lors du premier Airdrop à Los Osos à Dogtown",
    },
    vendor_MANCINELLA = {
        en = "The replica of the original gun is provided to V by",
        fr = "La réplique de l'arme originale est fournie à V par",
    },
    vendor_TAIGAN = {
        en = "Can be acquired from the scripted Airdrop atop the northeastern tower of Montezuma's Throne in Dogtown.",
        fr = "Peut être acquis à partir du parachutage scénarisé au sommet de la tour nord-est du trône de Montezuma à Dogtown .",
    },
    vendor_METEL = {
        en = "can also be found at the Brave Atlas.",
        fr = "peut également être trouvée dans Brave Atlas.",
    },
    vendor_CARMEN = {
        en = "if V successfully helped Paco Torres. \n\tAlternatively may be acquired by killing Paco before starting the quest.",
        fr = "Ne peut être obtenu que si V a aidé avec succès Paco Torres \n\tAlternativement, il peut être acquis en tuant Paco avant de commencer la quête.",
    },
    vendor_CHINOOK = {
        en = "after looting Amstaff.",
        fr = "après avoir pillé Amstaff.",
    },
    vendor_CHINOOK_additional = {
        en = "Was available through Amazon Prime Gaming from December 27, 2023 until January 24, 2024. It is automatically added to V's stash",
        fr = "Était disponible sur Amazon Prime Gaming du 27 décembre 2023 au 24 janvier 2024. Il est automatiquement ajouté à la réserve de V.",
    },
    vendor_DIVIDED_WE_STAND = {
        en = "Rewarded for beating Walker's score. Can also be obtained if V chooses to fight the 6th Street members.",
        fr = "Récompensé pour avoir battu le score de Walker. Peut également être obtenu si V choisit de combattre les membres de 6th Street.",
    },
    vendor_HAWK = {
        en = "Left behind by Rosalind Myers after departing the Kress Street Hideout.",
        fr = "Laissé par Rosalind Myers après avoir quitté la cachette de Kress Street.",
    },
    vendor_HERCULES_3AX = {
        en = "Found in the shooting range/warehouse section of the Nighthawks Rehabilitation Center.",
        fr = "Trouvé dans la section champ de tir/entrepôt du centre de réadaptation Nighthawks .",
    },
    vendor_KYUBI_X_MOD2 = {
        en = "Can be found in a pit filled with water across the Golden Pacific Data Term.",
        fr = "Peut être trouvé dans une fosse remplie d'eau à travers le Golden Pacific Data Term ",
    },
    vendor_WWE = {
        en = "West Wind Estate",
        fr = "West Wind Estate",
    },
    vendor_PIT_BULL = {
        en = "after looting Chesapeake.",
        fr = "après avoir pillé Chesapeake",
    },
    vendor_PIT_BULL_additional = {
        en = "Was available through Amazon Prime Gaming from October 26, 2023 through November 29, 2023. It is automatically added to V's stash.",
        fr = "Était disponible sur Amazon Prime Gaming du 26 octobre 2023 au 29 novembre 2023. Il est automatiquement ajouté à la réserve de V.",
    },
    vendor_PREJUDICE = {
        en = "Found at the Afterlife when gearing up. \n\nEnding Reward - After obtaining the Prejudice in aforementioned quest and finishing the game, upon returning to the \"Point of No Return\", you'll be rewarded with one. This unlocks the iconic weapon, and every time you finish an ending with that character, you'll receive one as long as you don't already have it in that save file.",
        fr = "Trouvé dans l' Afterlife lors de l'équipement.\n\nRécompense de fin - Après avoir obtenu le Préjugé dans la quête susmentionnée et terminé le jeu, en revenant au « Point de non-retour », vous en recevrez un. Cela débloque l'arme emblématique, et chaque fois que vous terminez une fin avec ce personnage, vous en recevrez une tant que vous ne l'avez pas déjà dans ce fichier de sauvegarde.",
    },
    vendor_UMBRA_X_MOD2 = {
        en = "Can be found at the Wild Blue hotel at Terra Cognita sometime after obtaining the first airdrop.",
        fr = "Peut être trouvé à l'hôtel Wild Blue à Terra Cognita quelque temps après avoir obtenu le premier largage aérien.",
    },
    vendor_M_179E_ACHILLES_X_MOD2 = {
        en = "Can be found in a secret room across the Black Sapphire in Dogtown.",
        fr = "Peut être trouvé dans une pièce secrète à travers le Black Sapphire à Dogtown",
    },
    vendor_WIDOW_MAKER = {
        en = "if you choose not to help Panam kill him during Ghost Town",
        fr = "si vous choisissez de ne pas aider Panam à le tuer pendant Ghost Town",
    },
    vendor_M_179E_ACHILLES = {
        en = "during \"Wipe the Gonk, Take the Implants\"",
        fr = "pendant \"Wipe the Gonk, Take the Implants\"",
    },
    vendor_BORZAYA = {
        en = "Can only be found inside an Airdrop that lands in front of the Brave Atlas in Golden Pacific, Dogtown. Only triggers after completing Lucretia My Reflection.",
        fr = "Ne peut être trouvé qu'à l'intérieur d'un Airdrop qui atterrit devant le Brave Atlas à Golden Pacific , Dogtown .\nSe déclenche uniquement après avoir terminé Lucretia Ma Réflexion .",
    },
    vendor_FOXHOUND = {
        en = "after looting Catahoula.",
        fr = "après avoir pillé Catahoula.",
    },
    vendor_FOXHOUND_additional = {
        en = "Was available through Amazon Prime Gaming from February 28, 2024 until April 3, 2024. It is automatically added to V's stash.",
        fr = "Était disponible sur Amazon Prime Gaming du 28 février 2024 au 3 avril 2024. Il est automatiquement ajouté à la réserve de V.",
    },
    vendor_NDI_OSPREY = {
        en = "Found on a weapon case in the armory of Alena Xenakis' safe-house in Dogtown. If not looted during the quest, it can be retrieved later by using the back entrance to the safe-house. A camera will scan V and open the door. ",
        fr = "Trouvé sur un étui à armes dans l'armurerie de la planque d' Alena Xenakis à Dogtown .\nSi vous ne le récupérez pas pendant la quête, vous pourrez le récupérer plus tard en utilisant l'entrée arrière de la planque. Une caméra scannera V et ouvrira la porte.",
    },
    vendor_O_FIVE = {
        en = "With a sufficiently high Body attribute, you can goad Buck Arnold into betting the weapon, increasing the fight's buy-in to $18,000. Upon winning the fight, Buck Arnold and his compatriots will attack. Upon eliminating Buck Arnold and the gangsters, you can retrieve your prize money from Buck's corpse and loot the weapon. \nAlternatively, you can win the fight normally, and verbally taunt Buck into attacking you. Upon eliminating him and the gangers, you can retrieve your prize money and loot the weapon as if it had been bet.",
        fr = "Avec un attribut Corps suffisamment élevé , vous pouvez inciter Buck Arnold à parier sur l'arme, augmentant ainsi le buy-in du combat à 18 000 $ . Une fois le combat remporté, Buck Arnold et ses compatriotes attaqueront. Après avoir éliminé Buck Arnold et les gangsters, vous pouvez récupérer votre prix en argent sur le cadavre de Buck et piller l'arme.\nAlternativement, vous pouvez gagner le combat normalement et provoquer verbalement Buck pour qu'il vous attaque. Après l'avoir éliminé ainsi que les gangers, vous pouvez récupérer votre prix en argent et piller l'arme comme si elle avait été mise en jeu.",
    },
    vendor_end_quest = {
        en = "at the end of the quest.",
        fr = "à la fin de la quête",
    },
    vendor_RASETSU = {
        en = "Automatically obtained after the gauntlet atop the Black Sapphire. The weapon is initially attached on top of a pintle mount, and is then removed by V once the objective in the area concludes.",
        fr = "Obtenu automatiquement après le gantelet au sommet Black Sapphire. L'arme est initialement fixée au sommet d'un support à pivot, puis retirée par V une fois l'objectif de la zone terminé.",
    },
    vendor_Criminal_Activity = {
        en = "Increased Criminal Activity:",
        fr = "Augmentation de l'activité criminelle:",
    },
    vendor_SPARKY_key = {
        en = "Inside the gated cache. Key",
        fr = "À l'intérieur de la cache fermée. La clé",
    },
    vendor_SPARKY = {
        en = "the Arasaka drone",
        fr = "drone Arasaka.",
    },
    vendor_YASHA = {
        en = "Could be acquired by gifting 2 Twitch subscriptions on eligible Twitch partner and affiliate channels between September 25, 2023 and October 21, 2023.",
        fr = "Peut être acquis en offrant 2 abonnements Twitch sur les chaînes partenaires et affiliées Twitch éligibles entre le 25 septembre 2023 et le 21 octobre 2023.",
    },
    vendor_YASHA_additional = {
        en = "Yasha is automatically added to the Stash once it has been added to your GOG account.",
        fr = "Yasha est automatiquement ajouté a la planque une fois qu'il a été ajouté à votre compte GOG.",
    },
    vendor_ASHURA = {
        en = "during Desperate Sons-of-Bitches",
        fr = "pendant Desperate Sons-of-Bitches .",
    },
    vendor_ALABAI = {
        en = "Can be found in a scripted Airdrop close to the Brave Atlas in Longshore Stacks, Dogtown.",
        fr = "Peut être trouvé dans un Airdrop scénarisé près du Brave Atlas à Longshore Stacks , Dogtown.",
    },
    vendor_AMSTAFF = {
        en = "after looting Pit Bull.",
        fr = "après avoir pillé Pit Bull.",
    },
    vendor_AMSTAFF_additional = {
        en = "Was available through Amazon Prime Gaming from November 29, 2023 until December 27, 2023. It is automatically added to V's stash.",
        fr = "Était disponible sur Amazon Prime Gaming du 29 novembre 2023 au 27 décembre 2023. Il est automatiquement ajouté à la réserve de V.",
    },
    vendor_BA_XING_CHONG = {
        en = "can be found on a locked room on the Ebunike, inside a chest behind the desk directly to the side of the weapon rack. This room is only accessible after defeating Adam Smasher and looting his personal Access Token.",
        fr = "se trouve dans une pièce fermée à clé sur l' Ebunike , à l'intérieur d'un coffre derrière le bureau, juste à côté du râtelier d'armes. Cette pièce n'est accessible qu'après avoir vaincu Adam Smasher et récupéré son jeton d'accès personnel",
    },
    vendor_DEZERTER = {
        en = "Found in Leon Rinder's garage",
        fr = "Trouvé dans le garage de Leon Rinder",
    },
    vendor_GUTS = {
        en = "Can be acquired among some bushes in the southern part, close to three praying monks.",
        fr = "Peut être acquis parmi quelques buissons dans la partie sud, à proximité de trois moines en prière.",
    },
    vendor_MOX = {
        en = "after finishing the last of her quests. It can be found on the kitchen table inside her apartment in Kabuki, Watson. A V who has not romanced Judy can find the shotgun there not long after finishing Pyramid Song, otherwise they will have to wait several in-game days until Judy messages V, stating she has left a gift for them in her apartment.",
        fr = "après avoir terminé la dernière de ses quêtes. On peut la trouver sur la table de cuisine à l'intérieur de son appartement à Kabuki , Watson .\nSi V qui n'a pas eu de liaison avec Judy peut trouver le fusil de chasse peu de temps après avoir terminé Pyramid Song, sinon ils devront attendre plusieurs jours de jeu jusqu'à ce que Judy envoie un message à V, indiquant qu'elle leur a laissé un cadeau dans son appartement.",
    },
    vendor_POZHAR_X_MOD2 = {
        en = "Can be found in a secret room near Elizabeth Kress Street in Longshore Stacks, Dogtown. The door only opens after 01:00AM.",
        fr = "Peut être trouvé dans une pièce secrète près de la rue Elizabeth Kress à Longshore Stacks , Dogtown . La porte ne s'ouvre qu'après 01h00 du matin.",
    },
    vendor_DB_4_IGLA = {
        en = "Variant with a Short Scope can be looted from Lely Hein during Six Feet Under",
        fr = "Une variante avec une lunette courte peut être récupérée sur Lely Hein pendant Six Feet Under",
    },
    vendor_DB_4_IGLA_additional = {
        en = "during a",
        fr = "lors d'une",
    },
    vendor_at_level = {
        en = "at level",
        fr = "au niveau",
    },
    vendor_higter = {
        en = "or higher",
        fr = "ou supérieur",
    },
    vendor_CHESAPEAKE = {
        en = "Was available through Amazon Prime Gaming from September 26, 2023 through October 23, 2023. It is automatically added to V's stash.",
        fr = "Était disponible sur Amazon Prime Gaming du 26 septembre 2023 au 23 octobre 2023. Il est automatiquement ajouté à la réserve de V.",
    },
    vendor_EREBUS = {
        en = "can be found in the Cynosure Facility's maintenance room in Engineering quarters of Sector 2. The behavioral system component looted from the Militech Cerberus is needed to unlock \"This Corrosion\". The deciphered Cerberus' decoded behavioral system component is required to craft the weapon, which can be obtained during \"This Corrosion\"",
        fr = "peut être trouvée dans la salle de maintenance de l'installation Cynosure dans les quartiers d'ingénierie du secteur 2.\nLe composant du système comportemental pillé sur le Militech Cerberus est nécessaire pour débloquer \"Cette corrosion\".\nLe composant du système comportemental décodé du Cerbère déchiffré est nécessaire pour fabriquer l'arme, qui peut être obtenue pendant \"Cette Corrosion\"",
    },
    vendor_FENRIR = {
        en = "Looted from a table next to the captive monk.",
        fr = "Pillé sur une table à côté du moine captif.",
    },
    vendor_GUILLOTINE_X_MOD2 = {
        en = "Can be found in a container home in Longshore Stacks, Dogtown.",
        fr = "Peut être trouvé dans une maison conteneur à Longshore Stacks , Dogtown.",
    },
    vendor_GUILLOTINE_X_MOD2_additional = {
        en = "The door requires 10 Body or 10 Tech to open, alternatively, it can be taken through the window after breaking the glass.",
        fr = "La porte nécessite 10 points de Body ou 10 points de Tech pour s'ouvrir, sinon, elle peut être emportée par la fenêtre après avoir brisé la vitre.",
    },
    vendor_PIZDETS = {
        en = "Can be looted off of Boris Ribakov after neutralizing him.",
        fr = "Peut être récupéré sur Boris Ribakov après l'avoir neutralisé.",
    },
    vendor_boss_wraith = {
        en = "a Wraiths Boss Hunter.",
        fr = "un chasseur de boss Wraiths ",
    },
    vendor_PROTOTYPE = {
        en = "Can be found inside the trailer marked 667, parked in the exterior loading dock",
        fr = "Peut être trouvé à l'intérieur de la remorque marquée 667, garée sur le quai de chargement extérieur",
    },
    vendor_MA70_HB_X_MOD2 = {
        en = "Can be found inside a crashed Militech Valgus near the Luxor High Wellness Spa, Dogtown. The door requires 10 Body",
        fr = "Peut être trouvé à l'intérieur d'un Militech Valgus écrasé près du Luxor High Wellness Spa , Dogtown . La porte nécessite 10 Body .",
    },
    vendor_M2067_DEFENDER = {
        en = "during \"Opposites Attract\"",
        fr = "pendant \"Les contraires s'attirent\"",
    },
    vendor_contained = {
        en = "Can be contained in",
        fr = "Peut être contenu dans les",
    },
    vendor_MK_31_HMG = {
        en = "Can be ripped off of any Militech Aegis X2 ground turret, requiring a varied level in the Body attribute, unless the turret has been destroyed.",
        fr = "Peut être arraché à n'importe quelle tourelle terrestre Militech Aegis X2 , nécessitant un niveau varié dans l' attribut Corps , à moins que la tourelle n'ait été détruite.",
    },
    vendor_OZOB = {
        en = "obtained from",
        fr = "obtenue auprès de",
    },
    vendor_open_world = {
        en = "Can be found as open-world loot, inside caches, looted from enemies",
        fr = "Peut être trouvé sous forme de butin en monde ouvert, à l'intérieur de caches et pillé sur les ennemis.",
    },
    vendor_any = {
        en = "any Weapon Vendor.",
        fr = "auprès de n'importe quel vendeur d'armes",
    },
    vendor_any_melee = {
        en = "any Melee Weapon Vendor.",
        fr = "auprès de n'importe quel vendeur d'armes de melee",
    },
    vendor_any_ripperdoc = {
        en = "any Ripperdoc",
        fr = "auprès de n'importe quel Ripperdoc",
    },
    vendor_rarely = {
        en = "Can rarely be purchased",
        fr = "Peut rarement être acheté",
    },
    vendor_purchased_from = {
        en = "and be purchased from Weapon Vendors.",
        fr = "et acheté auprès des vendeurs d'armes",
    },
    vendor_CLAW_X = {
        en = "Can be found atop the Heavy Hearts club in Dogtown.",
        fr = "Peut être trouvé au sommet du club Heavy Hearts à Dogtown",
    },
    vendor_CUT_O_MATIC = {
        en = "Can be found in lodged in John Blum's head inbetween ESC Explorer and Digimmortal in Terra Cognita, Dogtown.",
        fr = "Peut être trouvé logé dans la tête de John Blum entre ESC Explorer et Digimmortal à Terra Cognita , Dogtown",
    },
    vendor_BLACK_UNICORN = {
        en = "Unlocked by owning the game on the GOG Galaxy platform or by linking your account with GOG. It is automatically added to V's stash.",
        fr = "Débloqué en possédant le jeu sur la plateforme GOG Galaxy ou en liant votre compte à GOG . Il est automatiquement ajouté à la réserve de V.",
    },
    vendor_COCKTAIL_STICK = {
        en = "Can be found inside the dressing room at Clouds. ",
        fr = "Peut être trouvé à l'intérieur du vestiaire de Clouds .",
    },
    vendor_ERRATA = {
        en = "Can be found at the forge inside the Electric Corporation power plant. ",
        fr = "Peut être trouvé dans la forge à l’intérieur de la centrale électrique de la société électrique .",
    },
    vendor_looted_from = {
        en = "Looted from",
        fr = "Pillé à",
    },
    vendor_SATORI = {
        en = "Found leaning against a seat inside Saburo Arasaka's personal AV parked on the rooftop landing pad. ",
        fr = "Trouvé appuyé contre un siège à l'intérieur du véhicule utilitaire personnel de Saburo Arasaka garé sur l'aire d'atterrissage sur le toit.",
    },
    vendor_TSUMETOGI = {
        en = "or taken from its display stand.",
        fr = "ou retiré de son présentoir.",
    },
    vendor_BUTCHER_S = {
        en = "Can be found in Rolland's Butcher Shop, after Placide finishes butchering a chicken.",
        fr = "Peut être trouvé dans la boucherie de Rolland , après que Placide ait fini de découper un poulet.",
    },
    vendor_FANG = {
        en = "if sided with Solomon Reed.",
        fr = "s'il est du côté de Solomon Reed .",
    },
    vendor_food = {
        en = "Food Vendors in Night City",
        fr = "Vendeurs de nourriture à Night City",
    },
    vendor_NC = {
        en = "in Night City",
        fr = "à Night City",
    },
    vendor_VB_variant = {
        en = "Voodoo Boys variant has a rare chance to be contained in the cache rewarded for completion",
        fr = "La variante Voodoo Boys a une chance rare d'être contenue dans la cache récompensée pour l'achèvement.",
    },
    vendor_police_station = {
        en = "Found in the police station",
        fr = "Trouvé au poste de police",
    },
    vendor_GWYNBLEIDD = {
        en = "Unlocked by owning The Witcher 3: Wild Hunt and Cyberpunk 2077: Phantom Liberty on the GOG Galaxy platform or by linking your account with GOG if owned on Steam. It is automatically added to V's stash.",
        fr = "Débloqué en possédant The Witcher 3: Wild Hunt et Cyberpunk 2077 : Phantom Liberty sur la plateforme GOG Galaxy ou en liant votre compte à GOG si vous le possédez sur Steam. Il est automatiquement ajouté à la réserve de V.",
    },
    vendor_CARETAKER = {
        en = "Leaning against a group of rocks in the central area of the Arasaka Tower jungle floor. After obtaining the Caretaker's Spade in the aforementioned quest and finishing the game, upon returning to the \"Point of No Return\", the player will be rewarded with one. It can be obtained multiple times.",
        fr = "Appuyé contre un groupe de rochers dans la zone centrale du sol de la jungle de la tour Arasaka , près de la table de conférence.\nAprès avoir obtenu la pelle du gardien dans la quête susmentionnée et avoir terminé le jeu, en revenant au « point de non-retour », le joueur sera récompensé par une pelle. Elle peut être obtenue plusieurs fois.",
    },
    vendor_SASQUATCH = {
        en = "Looted during the fight with Sasquatch, or at the end of the Mission",
        fr = "Pillé pendant le combat avec Sasquatch, ou à la fin de la Mission",
    },
    vendor_BFC = {
        en = "Can be found on Hugo Selvig at a crashed AV near the Dam Viewpoint in Rancho Coronado. To reach it, get to the other side of the dam and look over the ledge. You should already see Hugo walking around on a ledge down below",
        fr = "Vous pouvez le trouver sur Hugo Selvig dans un AV accidenté près du point de vue du barrage à Rancho Coronado . Pour l'atteindre, allez de l'autre côté du barrage et regardez par-dessus le rebord. Vous devriez déjà voir Hugo se promener sur un rebord en contrebas.",
    },
    vendor_COTTONMOUTH = {
        en = "On a coffee table in Fingers' clinic.",
        fr = "Sur une table basse dans la clinique de Fingers.",
    },
    vendor_Bunker_CROWBAR = {
        en = "Prior to the jump to access the Cynosure Facility, there are two locked doors with a 20 Body check (only one needs to be opened). The crowbar is found in a box inside",
        fr = "Avant le saut pour accéder à l' installation Cynosure , il y a deux portes verrouillées avec un test de corps de 20 (une seule doit être ouverte). Le pied-de-biche se trouve dans une boîte à l'intérieur.",
    },
    vendor_SIR_JOHN = {
        en = "Left by Meredith Stout on the bed after completion",
        fr = "Laissée par Meredith Stout sur le lit après l'achèvement",
    },
    vendor_TINKER = {
        en = "Found in the control room of Edgewood Farm.",
        fr = "Trouvé dans la salle de contrôle d' Edgewood Farm",
    },
    vendor_BABY = {
        en = "if V did not let Lina read Tool's Letter",
        fr = "si V n'a pas laissé Lina lire la lettre de Tool",
    },
    vendor_BASEBALL = {
        en = "Can be found on a boardwalk close to the Black Sapphire in Dogtown.",
        fr = "Peut être trouvé sur une promenade près du Black Sapphire à Dogtown .",
    },
    vendor_GOLD_PLATED = {
        en = "Can be looted from Denny's pool after she tosses it inside.",
        fr = "Peut être pillé dans la piscine de Denny après l'avoir jeté à l'intérieur.",
    },
    vendor_MURPHY = {
        en = "requires siding with Songbird",
        fr = "nécessite de se ranger du côté de Songbird",
    },
    vendor_in_LT = {
        en = "in Little China",
        fr = "dans Little China",
    },
    vendor_be_present = {
        en = "can sometimes be present at",
        fr = "peuvent parfois être présents chez les",
    },
    vendor_wweapons = {
        en = "Weapon Vendors",
        fr = "vendeurs d'armes",
    },
    vendor_melee_weapons = {
        en = "Melee Weapon Vendors",
        fr = "vendeurs d'armes de mêlée",
    },
    vendor_tier13 = {
        en = "Tier 1 through Tier 3 ",
        fr = "Les niveaux 1 à 3",
    },
    vendor_craft_chimera = {
        en = "Can only be crafted using the Active Chimera Core obtained during Spider and the Fly, after defeating the Militech Chimera.",
        fr = "Ne peut être fabriqué qu'en utilisant le noyau de chimère actif obtenu pendant Spider and the Fly , après avoir vaincu la chimère Militech .",
    },
    vendor_rarity_increases = {
        en = "Rarity increases every",
        fr = "La rareté augmente tous les",
    },
    vendor_reaching_lvl = {
        en = "after reaching level",
        fr = "après avoir atteint le niveau",
    },
    vendor_MAXTAC_MANTIS = {
        en = "There is a chance they may drop from Melissa Rory if V attacks and defeats her after completing Bullets but before leaving the area.\n\nEnding reward \nDuring Black Steel In The Hour of Chaos, you must call Mr. Hands and hire the netrunner of his choice. \nAfterwards, accept Yoko Tsuru's deal and later inform Hands about the MaxTac convoy. \nSome time after finishing Leave in Silence, Hands will call you and mention he has left a gift for you in your apartment.",
        fr = "Il y a une chance qu'elles tombent de Melissa Rory si V l'attaque et la bat après avoir terminé Balles mais avant de quitter la zone.\n\nRécompense de fin - Pendant Black Steel In The Hour of Chaos , vous devez appeler M. Hands et engager le netrunner de son choix. Ensuite, acceptez le marché de Yoko Tsuru et informez Hands du convoi MaxTac . Quelque temps après avoir terminé Leave in Silence , Hands vous appellera et vous dira qu'il a laissé un cadeau pour vous dans votre appartement .",
    },
    vendor_up_to = {
        en = "up to",
        fr = "jusqu'au",
    },
    vendor_Dogtown_Ripperdocs = {
        en = "Dogtown Ripperdocs",
        fr = "Ripperdocs de Dogtown",
    },
    vendor_Obtained_during = {
        en = "Obtained during:",
        fr = "Obtenu pendant:",
    },
    vendor_Installed_by = {
        en = "Installed by",
        fr = "Installer par",
    },
    vendor_clinic_heywood = {
        en = "Wellspring's Clinic at Heywood",
        fr = "Clinique Wellspring à Heywood",
    },
    vendor_clinic_watson = {
        en = "Buck's Clinic at Watson",
        fr = "Clinique Buck à Watson",
    },
    vendor_ZETATECH_SANDEVISTAN = {
        en = "can be found in a locker during the Gig:Prototype in The Scraper.",
        fr = "peut être trouvée dans un casier pendant le contrat :Prototype dans The Scraper.",
    },
    vendor_dr_chrome = {
        en = "Dr. Chrome at Watson (SW of Kabuki Market)",
        fr = "Dr Chrome à Watson (au sud-ouest du marché Kabuki)",
    },
    vendor_containers = {
        en = "containers",
        fr = "conteneurs",
    },
    vendor_E305 = {
        en = "Cannot be purchased or looted. Only comes pre-installed on weapons.",
        fr = "Ne peut pas être acheté ou pillé. Livré préinstallé uniquement sur les armes.",
    },
    vendor_netwatch = {
        en = "Can be found at the NetWatch outpost at the Solar Arrays in Jackson Plains",
        fr = "Peut être trouvé à l' avant-poste NetWatch des panneaux solaires de Jackson Plains",
    },
    vendor_LAD = {
        en = "after completing its hidden quest.",
        fr = "après avoir terminé sa quête cachée.",
    },
    vendor_iconic_variant = {
        en = "Iconic variant",
        fr = "La variante iconique",
    },
    vendor_Quickhack = {
        en = "Quickhack",
        fr = "Piratage rapide",
    },
    vendor_and = {
        en = "and",
        fr = "et",
    },
    vendor_Netrunners = {
        en = "Netrunners",
        fr = "Netrunners",
    },
    vendor_hidden = {
        en = "Picked up from the hidden marked chest objective",
        fr = "Récupéré dans le coffre marqué comme objectif caché.",
    },
    vendor_if = {
        en = "if chosen",
        fr = "si choisi",
    },
    vendor_Ryder = {
        en = "Purchased from Cassius Ryder for free as a gift from Wakako Okada.",
        fr = "Purchased from Cassius Ryder for free as a gift from Wakako Okada.",
    },
    vendor_awward = {
        en = "Awarded for completion",
        fr = "Récompensé pour avoir terminé",
    },
    vendor_MILITECH_CANTO_MK_6 = {
        en = "can be found in the Cynosure Facility's Experimental Prototyping lab in Sector 3 after entering the keycode '714212'.\n\nThe behavioral system component looted from the Militech Cerberus is needed to unlock This Corrosion.\n\nThe deciphered Cerberus' decoded behavioral system component is required to craft the cyberdeck, which can be obtained during This Corrosion.\n\nThe deciphered Cerberus' decoded behavioral system component is required to craft the cyberdeck, which can be obtained during This Corrosion.",
        fr = "La spécification d'artisanat peut être trouvée dans le laboratoire de prototypage expérimental de l' installation Cynosure dans le secteur 3 après avoir entré le code clé « 714212 ».\n\nLe composant du système comportemental pillé sur le Militech Cerberus est nécessaire pour débloquer  This Corrosion. .\n\nLe composant du système comportemental décodé du Cerbère déchiffré est nécessaire pour fabriquer le cyberdeck, qui peut être obtenu pendant Cette Corrosion.",
    },
    vendor_auto_installed = {
        en = "Automatically installed on V from the start of the quest.",
        fr = "Installé automatiquement sur V dès le début de la quête.",
    },
    vendor_Agent_HEADGEAR = {
        en = "Could be acquired as a Twitch.tv drop by watching Cyberpunk 2077 for 1 hour on eligible Twitch partners and affiliate channels between September 25, 2023 and October 21, 2023.",
        fr = "Peut être acquis en tant que drop Twitch.tv en regardant Cyberpunk 2077 pendant 1 heure sur les partenaires Twitch éligibles et les canaux affiliés entre le 25 septembre 2023 et le 21 octobre 2023",
    },
    vendor_mission_reward = {
        en = "Mission reward :",
        fr = "Récompense de Mission:",
    },
    vendor_auto_obtained = {
        en = "Automatically obtained",
        fr = "Obtenu automatiquement",
    },
    vendor_quest_start = {
        en = "at the start of the quest",
        fr = "au début de la quête.",
    },
    vendor_mission = {
        en = "Mission:",
        fr = "Mission:",
    },
    vendor_bootleg = {
        en = "Can be found inside the locker alongside the Bootleg Shard and Car Keys.",
        fr = "Peut être trouvé à l'intérieur du casier à côté du Bootleg Shard et des clés de voiture",
    },
    vendor_bedroom = {
        en = "Can be found in a suitcase in the bedroom.",
        fr = "Peut être trouvé dans une valise dans la chambre.",
    },
    vendor_after = {
        en = "Acquired after",
        fr = "Acquis après",
    },
    vendor_stash = {
        en = "later deposited in the Stash.",
        fr = "puis déposé dans la planque",
    },
    vendor_mirror = {
        en = "Only worn during the mirror scene, afterwards it becomes unobtainable",
        fr = "Porté uniquement pendant la scène du miroir, il devient ensuite introuvable",
    },
    vendor_yorinobu = {
        en = "Can be found inside a cache in Yorinobu's Penthouse in Konpeki Plaza during The Heist.",
        fr = "Peut être trouvé à l'intérieur d'une cache dans le Penthouse de Yorinobu à Konpeki Plaza pendant The Heist.",
    },
    vendor_judy = {
        en = "Can be found inside a cache in the bedroom of Judy's apartment after romancing her during Pyramid Song",
        fr = "Peut être trouvé dans une cache dans la chambre de l'appartement de Judy après l'avoir courtisée pendant Pyramid Song",
    },
    vendor_agent = {
        en = "Could be acquired as a Twitch.tv drop by watching Cyberpunk 2077 for 1 hour on eligible Twitch partners and affiliate channels between September 25, 2023 and October 21, 2023",
        fr = "Peut être acquis en tant que drop Twitch.tv en regardant Cyberpunk 2077 pendant 1 heure sur les partenaires Twitch éligibles et les canaux affiliés entre le 25 septembre 2023 et le 21 octobre 2023.",
    },
    vendor_the_star = {
        en = "as a gift for joining the Aldecaldos.\n\nEnding Reward \nAfter obtaining the jacket in aforementioned quest and finishing the game, upon returning to the 'Point of No Return,' you'll be rewarded with one. This unlocks the jacket, and every time you finish an ending with that character, you'll receive one as long as you don't already have it in that save file.",
        fr = "en cadeau pour son adhésion aux Aldecaldos.\n\nRécompense de fin\nAprès avoir obtenu la veste dans la quête susmentionnée et terminé le jeu, en revenant au 'Point de non-retour', vous en recevrez une en récompense. Cela débloque la veste, et chaque fois que vous terminez une fin avec ce personnage, vous en recevrez une tant que vous ne l'avez pas déjà dans ce fichier de sauvegarde",
    },
    vendor_auto_equiped = {
        en = "Automatically equipped",
        fr = "Équipé automatiquement",
    },
    vendor_not_kept = {
        en = "The item is not kept after completing this Ending.",
        fr = "L'objet n'est pas conservé après avoir terminé cette fin.",
    },
    vendor_optional = {
        en = "Optional objective",
        fr = "Objectif optionnel",
    },
    vendor_bed = {
        en = "Can be looted from the bed",
        fr = "peut être récupéré sur le lit",
    },
    vendor_apart = {
        en = "Looted in the apartment",
        fr = "Pillé dans l'appartement",
    },
    vendor_cop_BADGE = {
        en = "Can be found on a NCPD Officer's body in an alley between Martin and Goldsmith Street in Northside, Watson.",
        fr = "Peut être trouvé sur le corps d'un officier du NCPD dans une ruelle entre Martin et Goldsmith Street à Northside, Watson.",
    },
    vendor_cop_COAT = {
        en = "Two can be found on the bodies of NCPD officers at a house near Almunecar & Jerez in Rancho Coronado, Santo Domingo.",
        fr = "Deux d'entre eux ont été retrouvés sur les corps des officiers du NCPD dans une maison près d'Almunecar et Jerez à Rancho Coronado, Santo Domingo.",
    },
    vendor_cop_PANTS = {
        en = "Can be found on the body of a NCPD officer to the west of Metro station Farrier St. in Little China, Watson.",
        fr = "Peut être trouvé sur le corps d'un officier du NCPD à l'ouest de la station de métro Farrier St. à Little China, Watson.",
    },
    vendor_cop_BOOTS = {
        en = "Two can be found on bodies of NCPD officers atop of a building in the east of Rancho Coronado, Santo Domingo.",
        fr = "Deux d'entre eux ont été retrouvés sur les corps des officiers du NCPD au sommet d'un immeuble à l'est de Rancho Coronado, à Santo Domingo.",
    },
    vendor_corporate_GLASSES = {
        en = "One can be found on the switchback road near the Fixer Muamar Reyes in Rancho Coronado. In a cache below an Arasaka billboard.\n\nOne can be found {vendor_Biotechnica_Flats}, on the highway to Los Angeles between the Border Checkpoint and Fuel Station. On a body inside the container of a crashed Zetatech Canopy.",
        fr = "On peut en trouver un sur la route sinueuse près du Fixer Muamar Reyes à Rancho Coronado. Dans une cache sous un panneau d'affichage d'Arasaka.\n\nOn peut en trouver un dans les appartements Biotechnica, sur l'autoroute de Los Angeles entre le poste frontière et la station-service. Sur un corps à l'intérieur du conteneur d'un Zetatech Canopy écrasé.",
    },
    vendor_corporate_BULLETPROOF = {
        en = "Can be found in Northside, Watson. On a body with a Machete plunged in it",
        fr = "Peut être trouvé à Northside, Watson. Sur un corps avec une machette plongée dedans",
    },
    vendor_corporate_SHIRT = {
        en = "Can be found on the border of Downtown, City Center and The Glen, Heywood. On a body beneath orange scaffolding covered by black tarp.",
        fr = "On peut le trouver à la frontière du Centre, du Centre et de The Glen, à Heywood. Sur un corps sous un échafaudage orange recouvert d'une bâche noire.",
    },
    vendor_corporate_SLACKS = {
        en = "Can be found in Northside, Watson. The item is on a body in the car park of a large power plant.",
        fr = "Peut être trouvé à Northside, Watson. L'objet se trouve sur un corps dans le parking d'une grande centrale électrique.",
    },
    vendor_corporate_PUMPS = {
        en = "Can be found on a body amidst three burning vans in a parking lot just north of San Amaro Street in Charter Hill, Westbrook, after completion of the side job 'I Fought the Law'.",
        fr = "Peut être trouvé sur un corps au milieu de trois camionnettes en feu dans un parking juste au nord de la rue San Amaro à Charter Hill, Westbrook, après avoir terminé le travail secondaire 'I Fought the Law'.",
    },
    vendor_fixer_GLASSES = {
        en = "Can be found on a body at the Brae street warehouse in Arroyo, Santo Domingo.",
        fr = "Peut être trouvé sur un corps à l'entrepôt de la rue Brae à Arroyo, Santo Domingo.",
    },
    vendor_fixer_JACKET = {
        en = "Can be found at the collapsed Ferris wheel at Kendal Park in Rancho Coronado, Santo Domingo with the Archived Conversation: Kendric Feller and Octavius Brown shard.",
        fr = "Peut être trouvé près de la grande roue effondrée du parc Kendal à Rancho Coronado, Santo Domingo avec la conversation archivée : le fragment Kendric Feller et Octavius ​​Brown.",
    },
    vendor_fixer_BUStier = {
        en = "Can be found on a body, next to the Buck-A-Slice on the corner of Haakensen and Piper Street in The Glen, Heywood.",
        fr = "Peut être trouvé sur un corps, à côté du Buck-A-Slice au coin de Haakensen et Piper Street à The Glen, Heywood.",
    },
    vendor_fixer_SKIRT = {
        en = "Can be found on a body on the rooftop of the Love Hotel on Jig-Jig Street in Japantown, Westbrook.",
        fr = "Peut être trouvé sur un corps sur le toit du Love Hotel sur Jig-Jig Street à Japantown, Westbrook.",
    },
    vendor_fixer_PUMPS = {
        en = "Can be found on a body inside a destroyed blue Villefort Columbus near the Crescent & Broad DataTerm in Japantown, Westbrook.",
        fr = "Peut être trouvé sur un corps à l'intérieur d'un Villefort Columbus bleu détruit près du Crescent & Broad DataTerm à Japantown, Westbrook.",
    },
    vendor_media_CAP = {
        en = "Can only be found after completing Life During Wartime. A top the tower at the Regional Airport in Jackson Plains, Southern Badlands.",
        fr = "Ne peut être trouvé qu'après avoir terminé La vie en temps de guerre. Au sommet de la tour de l'aéroport régional de Jackson Plains, dans les Badlands du Sud.",
    },
    vendor_media_ARMORED = {
        en = "Can be found inside an abandoned recreational vehicle, to the south-west of the Regional Airport in Jackson Plains, Southern Badlands.",
        fr = "Peut être trouvé à l'intérieur d'un véhicule récréatif abandonné, au sud-ouest de l'aéroport régional de Jackson Plains, dans le sud des Badlands.",
    },
    vendor_media_VEST = {
        en = "Can be found on Philippo Bergamo's body in an alley on Crescent road in Japantown, Westbrook",
        fr = "Peut être trouvé sur le corps de Philippo Bergamo dans une ruelle de Crescent Road à Japantown, Westbrook",
    },
    vendor_media_SHIRT = {
        en = "Can be found on a body on the lower level of the docks near Corporation St. in Wellsprings, Heywood with the Archived Conversation: Jacob Miller and Callum Black.",
        fr = "Peut être trouvé sur un corps au niveau inférieur des quais près de Corporation St. à Wellsprings, Heywood avec la conversation archivée : Jacob Miller et Callum Black.",
    },
    vendor_media_PANTS = {
        en = "Can be found on a body on an advertisement sign on Francis street in Charter Hill, Westbrook.\n\nCan also be found on a body on the roof of the Cirrus Cola shop at Lele Park in Charter Hill, Westbrook along with Lightweight hardened-rubber media steel-toes.",
        fr = "Peut être trouvé sur un corps sur un panneau publicitaire sur la rue Francis à Charter Hill, Westbrook\n\nOn peut également le retrouver sur une carrosserie sur le toit de la boutique Cirrus Cola à Lele Park à Charter Hill, Westbrook avec Lightweight hardened-rubber media steel-toes.",
    },
    vendor_media_TOES = {
        en = "Can be found on a body on the roof of the Cirrus Cola shop at Lele Park in Charter Hill, Westbrook",
        fr = "Peut être trouvé sur un corps sur le toit du magasin Cirrus Cola à Lele Park à Charter Hill, Westbrook",
    },
    vendor_netrunner_INFOVISOR = {
        en = "Found in a locked container during Reported Crime: Delivery From Above in the Rattlesnake Creek region of the Southern Badlands.",
        fr = "Trouvé dans un conteneur verrouillé lors d'un crime signalé : Livraison d'en haut dans la région de Rattlesnake Creek dans les Badlands du Sud.",
    },
    vendor_netrunner_SUIT = {
        en = "Found on the border of Wellsprings and The Glen, to the east of Megabuilding H2. It has a minimum level requirement of 30.",
        fr = "Situé à la frontière entre Wellsprings et The Glen, à l'est du Megabuilding H2. Son niveau minimum requis est de 30.",
    },
    vendor_netrunner_PANTS = {
        en = "Can be found on Vessel's body atop a spherical gas tank on Knoll Street in Northside, Watson.",
        fr = "Peut être trouvé sur le corps du Vessel au sommet d'un réservoir d'essence sphérique sur Knoll Street à Northside, Watson.",
    },
    vendor_netrunner_BOOTS = {
        en = "Found in an opened hatch near Longshore South Data Term in Charter Hill, Westbrook.",
        fr = "Trouvé dans une trappe ouverte près de Longshore South Data Term à Charter Hill, Westbrook",
    },
    vendor_nomad_MASK = {
        en = "Can be found in a cache on a black couch in front of a destroyed Villefort Columbus at the Solar Arrays in Jackson Plains, Badlands",
        fr = "Peut être trouvé dans une cache sur un canapé noir devant un Villefort Columbus détruit aux Solar Arrays à Jackson Plains, Badlands",
    },
    vendor_nomad_JACKET = {
        en = "DestFound in a basement next to a trailer near the Border Checkpoint in Rattlesnake Creek, Southern Badlands. The door can be forced open withBody attribute.",
        fr = "Trouvé dans un sous-sol à côté d'une caravane près du poste frontière de Rattlesnake Creek, dans les Badlands du Sud. La porte peut être forcée avec l'attribut Corps.",
    },
    vendor_nomad_SHIRT = {
        en = "Can be found on a body next to a destroyed blue Villefort Columbus in southern Jackson Plains, Northern Badlands.",
        fr = "Peut être trouvé sur un corps à côté d'un Villefort Columbus bleu détruit dans le sud de Jackson Plains, dans les Badlands du Nord.",
    },
    vendor_nomad_PANTS = {
        en = "Can be found on Zachary Preston's body north of the Las Palapas Motel in the Biotechnica Flats, Badlands.(Bugged as of Patch 2.0)",
        fr = "Peut être trouvé sur le corps de Zachary Preston au nord du motel Las Palapas dans les Biotechnica Flats, Badlands.(Buggué depuis le patch 2.0)",
    },
    vendor_nomad_BOOTS = {
        en = "Can be found on a body inside a cellar at an abandoned fuel station north of the Medpoint in Rocky Ridge, Northern Badlands.",
        fr = "Peut être trouvé sur un corps à l'intérieur d'une cave dans une station-service abandonnée au nord de Medpoint à Rocky Ridge, dans les Badlands du Nord.",
    },
    vendor_rocker_AVIATORS = {
        en = "Underneath the overpass, near to where you can purchase the Quadra Type-66 640 TS in Rancho Coronado, Santo Domingo.",
        fr = "Sous le viaduc, près de l'endroit où vous pouvez acheter le Quadra Type-66 640 TS à Rancho Coronado, Santo Domingo.",
    },
    vendor_rocker_FOLDTOP = {
        en = "Can be found on a body at the 3rd floor of Bellevue Overwalk in Kabuki, Watson.",
        fr = "Peut être trouvé sur un corps au 3ème étage de Bellevue Overwalk à Kabuki, Watson.",
    },
    vendor_rocker_BRA = {
        en = "Can be found on a body at an abandoned band performance near Batty's Hotel in Coastview, Pacifica.",
        fr = "Peut être trouvé sur un corps lors d'un concert de groupe abandonné près de l'hôtel Batty à Coastview, Pacifica.",
    },
    vendor_rocker_PANTS = {
        en = "Can be found on a body inside a fenced enclosure to the west of Downtown North Data Term in Corpo Plaza, City Center. The enclosure can be entered either by climbing on top and descending through a gap, or by forcing open the door with Body level 13.",
        fr = "Peut être trouvé sur un corps à l'intérieur d'une enceinte clôturée à l'ouest du Downtown North Data Term à Corpo Plaza, City Center. On peut entrer dans l'enceinte soit en grimpant dessus et en descendant par un espace, soit en forçant la porte avec le niveau Corps 13",
    },
    vendor_rocker_BOOTS = {
        en = "Can be found on a body inside a locked cage to the north-east of Skyline & Republic Data Term in Downtown, City Center. The door can be forced open with Body level 12. Alternatively, there is an opening on the side of the cage.",
        fr = "Peut être trouvé sur un corps à l'intérieur d'une cage verrouillée au nord-est de Skyline & Republic Data Term dans le Centre, Centre. La porte peut être forcée avec le niveau Corps 12. Alternativement, il y a une ouverture sur le côté de la cage.",
    },
    vendor_solo_SOFTWARE = {
        en = "Can be found on on the body of Samuel Morton in the Biotechnica Flats.",
        fr = "Peut être trouvé sur le corps de Samuel Morton dans les appartements Biotechnica.",
    },
    vendor_solo_JACKET = {
        en = "Can be found on the body of Olena Sorokin behind a locked gate in an alley to the right of Megabuilding H1 in The Glen, Heywood. The gate requires Technical Ability to open. The easiest way to find this location is by fast-travelling to the Embers Fast Travel Dataterm and looking East, then heading towards Megabuilding H1.",
        fr = "Peut être trouvé sur le corps d'Olena Sorokin derrière une porte verrouillée dans une ruelle à droite du Megabuilding H1 à The Glen, Heywood. La porte nécessite une compétence technique pour s'ouvrir. Le moyen le plus simple de trouver cet endroit est de voyager rapidement jusqu'au dataterm de voyage rapide Embers et de regarder vers l'est, puis de se diriger vers le Megabuilding H1.",
    },
    vendor_solo_SHIRT = {
        en = "Can be found inside a cache at the Wind Farms in the Badlands",
        fr = "Peut être trouvé à l'intérieur d'une cache dans les parcs éoliens des Badlands.",
    },
    vendor_solo_PANTS = {
        en = "Can be found on a body inside a hidden shack on the beach beneath the Wellsprings Water Treatment Facility in Wellsprings, Heywood.",
        fr = "Peut être trouvé sur un corps à l'intérieur d'une cabane cachée sur la plage sous l'usine de traitement des eaux de Wellsprings à Wellsprings, Heywood.",
    },
    vendor_solo_BOOTS = {
        en = "Can be found on the third level of Kabuki Market in Kabuki, Watson.",
        fr = "Peut être trouvé au troisième niveau du marché Kabuki à Kabuki, Watson.",
    },
    vendor_techie_CAP = {
        en = "Can be found in Rocky Ridge, in a locked basement. The door can be opened with Technical Ability Attribute level 5.",
        fr = "Peut être trouvé à Rocky Ridge, dans un sous-sol fermé à clé. La porte peut être ouverte avec un attribut de capacité technique de niveau 5",
    },
    vendor_techie_OCUSET = {
        en = "Can be found in Rocky Ridge, to the east of Medeski Fuel Station and the west of Edgewood Farm, in an abandoned trailer surrounded by mines.",
        fr = "Peut être trouvé à Rocky Ridge, à l'est de la station-service Medeski et à l'ouest d'Edgewood Farm, dans une remorque abandonnée entourée de mines.",
    },
    vendor_techie_HARNESS = {
        en = "Can be found inside a garage at a storage facility to the west of the Ventura & Skyline Data Term on Skyline South in The Glen, Heywood. The garage can be opened with 14 Body.",
        fr = "Peut être trouvé dans un garage dans un entrepôt à l'ouest du Ventura & Skyline Data Term sur Skyline South à The Glen, Heywood. Le garage peut être ouvert avec 14 Corps.",
    },
    vendor_techie_SHIRT = {
        en = "Murk Man Returns Again Once More Forever \nFound inside the cache in the container at the Raffen Shiv hideout in Rocky Ridge. Available after Ghost Town and reaching 40 Street Cred.",
        fr = "Murk Man revient encore une fois pour toujours \nTrouvé dans la cache du conteneur de la cachette de Raffen Shiv à Rocky Ridge. Disponible après Ghost Town et en atteignant 40 Street Cred.",
    },
    vendor_techie_PANTS = {
        en = "Can be found at a parking lot near the Dam Viewpoint in Rancho Coronado, Santo Domingo.",
        fr = "Peut être trouvé sur un parking près du point de vue du barrage à Rancho Coronado, Santo Domingo.",
    },
    vendor_techie_SHOES = {
        en = "Can be found in near the roundabout in Corpo Plaza, City Center, behind a locked gate. Technical Ability level 5 is required to open the gate, though it can be jumped over.",
        fr = "Peut être trouvé près du rond-point de Corpo Plaza, dans le Centre, derrière une porte verrouillée. Le niveau de compétence technique 5 est requis pour ouvrir la porte, mais il est possible de la franchir en sautant.",
    },
}

M.descriptions = {
    AMBITION_desc = {
        en = "Go Your Own Way",
        fr = "Go Your Own Way",
    },
    AMBITION_desc_additional = {
        en = "{vendor_given} Hasan Demir.",
        fr = "{vendor_given} Hasan Demir.",
    },
    APPARITION_desc = {
        en = "War Pigs",
        fr = "War Pigs",
    },
    APPARITION_desc_additional = {
        en = "{vendor_dropped} Frank Nostra.\n\n{vendor_purchased} Herold Lowe {vendor_purchased_add}",
        fr = "{vendor_dropped} Frank Nostra\n\n{vendor_purchased} Herold Lowe {vendor_purchased_add}",
    },
    CATAHOULA_desc = {
        en = "{vendor_looted} {vendor_Airdrops} {vendor_Chinook}",
        fr = "{vendor_looted} {vendor_Airdrops} {vendor_Chinook}",
    },
    CATAHOULA_desc_additional = {
        en = "{vendor_CATAHOULA}",
        fr = "{vendor_CATAHOULA}",
    },
    CHAOS_desc = {
        en = "The Pickup",
        fr = "The Pickup",
    },
    CHAOS_desc_additional = {
        en = "{vendor_dropped} Royce \n{vendor_only_obtained} {vendor_only_obtained_royce} \n\n(Phantom Liberty) {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}. {vendor_conditions}\n\n{vendor_not_dropped}",
        fr = "{vendor_dropped} Royce \n{vendor_only_obtained} {vendor_only_obtained_royce} \n\n(Phantom Liberty) {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}. {vendor_conditions}\n\n{vendor_not_dropped}",
    },
    CHEETAH_desc = {
        en = "No Easy Way Out",
        fr = "No Easy Way Out",
    },
    CHEETAH_desc_additional = {
        en = "{vendor_dropped} Angelica Whelan.",
        fr = "{vendor_dropped} Angelica Whelan.",
    },
    CRIMESTOPPER_desc = {
        en = "Heaviest of Hearts",
        fr = "Heaviest of Hearts",
    },
    CRIMESTOPPER_desc_additional = {
        en = "{vendor_found_bag}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_found_bag}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    DEATH_AND_TAXES_desc = {
        en = "Ex-Factor",
        fr = "Ex-Factor",
    },
    DEATH_AND_TAXES_desc_additional = {
        en = "{vendor_DEATH_AND_TAXES}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_DEATH_AND_TAXES}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    DYING_NIGHT_desc = {
        en = "The Gun",
        fr = "The Gun",
    },
    DYING_NIGHT_desc_additional = {
        en = "{vendor_free} Robert Wilson.",
        fr = "{vendor_free} Robert Wilson",
    },
    GENJIROH_desc = {
        en = "Play It Safe",
        fr = "Play It Safe",
    },
    GENJIROH_desc_additional = {
        en = "{vendor_GENJIROH}",
        fr = "{vendor_GENJIROH}",
    },
    HER_MAJESTY_desc = {
        en = "Get It Together",
        fr = "Get It Together",
    },
    HER_MAJESTY_desc_additional = {
        en = "{vendor_HER_MAJESTY}",
        fr = "{vendor_HER_MAJESTY}",
    },
    ["KAPPA_X-MOD2_desc"] = {
        en = "{vendor_KAPPA_X_MOD}",
        fr = "{vendor_KAPPA_X_MOD}",
    },
    KONGOU_desc = {
        en = "The Heis",
        fr = "The Heist",
    },
    KONGOU_desc_additional = {
        en = "{vendor_KONGOU} \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_KONGOU} \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    LA_CHINGONA_DORADA_desc = {
        en = "Heroes",
        fr = "Heroes",
    },
    LA_CHINGONA_DORADA_desc_additional = {
        en = "{vendor_LA_CHINGONA_DORADA}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_LA_CHINGONA_DORADA}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    ["LEXINGTON_X-MOD_2_desc"] = {
        en = "Shoot To Thrill",
        fr = "Shoot To Thrill",
    },
    ["LEXINGTON_X-MOD_2_desc_additional"] = {
        en = "{vendor_given} Robert Wilson {vendor_LEXINGTON_X_MOD_2}",
        fr = "{vendor_given} Robert Wilson {vendor_LEXINGTON_X_MOD_2}",
    },
    LIZZIE_desc = {
        en = "Automatic Lov",
        fr = "Automatic Love",
    },
    LIZZIE_desc_additional = {
        en = "{vendor_LIZZIE}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_not_looted}.",
        fr = "{vendor_LIZZIE}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_not_looted}.",
    },
    MALORIAN_ARMS_3516_desc = {
        en = "Chippin' In",
        fr = "Chippin' In",
    },
    MALORIAN_ARMS_3516_desc_additional = {
        en = "{vendor_MALORIAN_ARMS_3516} Jeremiah Grayson.",
        fr = "{vendor_MALORIAN_ARMS_3516} Jeremiah Grayson .",
    },
    OGOU_desc = {
        en = "Treating Symptoms",
        fr = "Treating Symptoms",
    },
    OGOU_desc_additional = {
        en = "{vendor_dropped} {vendor_R_MK2}",
        fr = "{vendor_dropped} {vendor_R_MK2} ",
    },
    PARIAH_desc = {
        en = "The Killing Moon",
        fr = "The Killing Moon",
    },
    PARIAH_desc_additional = {
        en = "{vendor_dropped} Solomon Reed.",
        fr = "{vendor_dropped} Solomon Reed .",
    },
    PLAN_B_desc = {
        en = "{vendor_PLAN_B}",
        fr = "{vendor_PLAN_B}",
    },
    PLAN_B_desc_additional = {
        en = "Phantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "Phantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
    },
    PRIDE_desc = {
        en = "Knockin' on Heaven's Door",
        fr = "Knockin' on Heaven's Door",
    },
    PRIDE_desc_additional = {
        en = "{vendor_PRIDE}",
        fr = "{vendor_PRIDE}",
    },
    RISKIT_desc = {
        en = "Shot by Both Sides",
        fr = "Shot by Both Sides",
    },
    RISKIT_desc_additional = {
        en = "{vendor_dropped} Bree Whitney {vendor_RISKIT}",
        fr = "{vendor_dropped} Bree Whitney {vendor_RISKIT}",
    },
    ROOK_desc = {
        en = "Voodoo Treasure",
        fr = "Voodoo Treasure",
    },
    ROOK_desc_additional = {
        en = "{vendor_ROOK}",
        fr = "{vendor_ROOK}",
    },
    SCORCH_desc = {
        en = "{vendor_SCORCH}",
        fr = "{vendor_SCORCH}",
    },
    SERAPH_desc = {
        en = "God Bless This Mes",
        fr = "God Bless This Mess",
    },
    SERAPH_desc_additional = {
        en = "{vendor_v_stash}",
        fr = "{vendor_v_stash}",
    },
    SKIPPY_desc = {
        en = "{vendor_SKIPPY_desc}",
        fr = "{vendor_SKIPPY_desc}",
    },
    SKIPPY_desc_additional = {
        en = "{vendor_SKIPPY_desc_additional}",
        fr = "{vendor_SKIPPY_desc_additional}",
    },
    ["A-22B_CHAO_desc"] = {
        en = "6th Street \nTyger Claws \nClassified Black Ops Operative\nKang Tao Heavy\nNetrunner\nSecurity Guard\nVoodoo Boys",
        fr = "6th Street \nTyger Claws \nClassified Black Ops Operative\nKang Tao Heavy\nNetrunner\nSecurity Guard\nVoodoo Boys",
    },
    ["HA-4_GRIT_desc"] = {
        en = "BARGHEST",
        fr = "BARGHEST",
    },
    ["HA-4_GRIT_desc_additional"] = {
        en = "{vendor_purchased} Herold Lowe {vendor_stade} {vendor_BARGHEST}",
        fr = "{vendor_purchased} Herold Lowe {vendor_stade} {vendor_BARGHEST}",
    },
    ["HJKE-11_YUKIMURA_desc"] = {
        en = "6th Street\nBARGHEST Netrunner\nClassified Black Ops Netrunner\nTrauma Team\nTyger Claws\nVoodoo Boys",
        fr = "6th Street\nBARGHEST Netrunner\nClassified Black Ops Netrunner\nTrauma Team\nTyger Claws\nVoodoo Boys",
    },
    ["HJKE-11_YUKIMURA_desc_additional"] = {
        en = "{vendor_lvl} 9 {vendor_from}\n{vendor_Red_Peaks}{vendor_military}\n{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Rancho_Coronado}\n\n{vendor_craft} {vendor_lvl} 1 {vendor_from}:\n{vendor_kabuki}\n\n{vendor_craftings}{vendor_dropped} Zoe Alonzo {vendor_Suspected_Organized_Crime_Activity} Chapel",
        fr = "{vendor_lvl} 9 {vendor_from}\n{vendor_Red_Peaks}{vendor_military}\n{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Rancho_Coronado}\n\n{vendor_craft} {vendor_lvl} 1 {vendor_from}:\n{vendor_kabuki}\n\n{vendor_craftings}{vendor_dropped} Zoe Alonzo {vendor_Suspected_Organized_Crime_Activity} Chapelle",
    },
    ["JKE-X2_KENSHIN_desc"] = {
        en = "Maelstrom\nWraiths",
        fr = "Maelstrom\nWraiths",
    },
    ["JKE-X2_KENSHIN_desc_additional"] = {
        en = "{vendor_lvl} 17 {vendor_from}:\n{vendor_Red_Peaks} {vendor_military}\n{vendor_kabuki}\n {vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n\n{vendor_craft} {vendor_lvl} 10 {vendor_from}:\n{vendor_Wellsprings}",
        fr = "{vendor_lvl} 17 {vendor_from}:\n{vendor_Red_Peaks} {vendor_military}\n{vendor_kabuki}\n {vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n\n{vendor_craft} {vendor_lvl} 10 {vendor_from}:\n{vendor_Wellsprings}",
    },
    KAPPA_desc_additional = {
        en = "{vendor_lvl} 17 {vendor_from}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}",
        fr = "{vendor_lvl} 17 {vendor_from}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}",
    },
    LIBERTY_desc = {
        en = "6th Street\nTyger Claws\nValentinos",
        fr = "6th Street\nTyger Claws\nValentinos",
    },
    LIBERTY_desc_additional = {
        en = "{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.\n\n{vendor_craft} {vendor_lvl} 1 {vendor_from}:\nMarty Jenklow {vendor_Biotechnica_Flats}",
        fr = "{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.\n\n{vendor_craft} {vendor_lvl} 1 {vendor_from}:\nMarty Jenklow {vendor_Biotechnica_Flats}",
    },
    ["M-10AF_LEXINGTON_desc"] = {
        en = "6th Street\nBARGHEST\nClassified Black Ops\nMilitech",
        fr = "6th Street\nBARGHEST\nClassified Black Ops\nMilitech",
    },
    ["M-10AF_LEXINGTON_desc_additional"] = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki} {vendor_neon}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nHerold Lowe {vendor_stade} {vendor_BARGHEST}\nSophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_Ben_DeBaillon}\n\nPhantom Liberty {vendor_BARGHEST} {vendor_looted} {vendor_Airdrops}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}\n\n{vendor_craftings}{vendor_Northside}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki} {vendor_neon}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nHerold Lowe {vendor_stade} {vendor_BARGHEST}\nSophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_Ben_DeBaillon}\n\nPhantom Liberty {vendor_BARGHEST} {vendor_looted} {vendor_Airdrops}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}\n\n{vendor_craftings}{vendor_Northside}",
    },
    ["M-76E_OMAHA_desc"] = {
        en = "6th Street\nBARGHEST\nClassified Black Ops\nMaelstrom\nMilitech\nVoodoo Boys\nWraiths",
        fr = "6th Street\nBARGHEST\nClassified Black Ops\nMaelstrom\nMilitech\nVoodoo Boys\nWraiths",
    },
    ["M-76E_OMAHA_desc_additional"] = {
        en = "{vendor_lvl} 9 {vendor_from}\n{vendor_aldecaldos}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_West_Wind_Estate}\n{vendor_Northside} ({vendor_Maelstrom})\nHerold Lowe {vendor_stade} {vendor_BARGHEST}\n\n{vendor_craft} {vendor_lvl} 1 {vendor_from}\n{vendor_Wellsprings}",
        fr = "{vendor_lvl} 9 {vendor_from}\n{vendor_aldecaldos}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_West_Wind_Estate}\n{vendor_Northside} {vendor_Maelstrom}\nHerold Lowe {vendor_stade} {vendor_BARGHEST}\n\n{vendor_craft} {vendor_lvl} 1 {vendor_from}\n{vendor_Wellsprings}",
    },
    MILITECH_TICON_desc = {
        en = "BARGHEST Commando\nVoodoo Boys Manbo",
        fr = "BARGHEST Commando\nVoodoo Boys Manbon",
    },
    MILITECH_TICON_desc_additional = {
        en = "Sophia Dupont {vendor_stade} {vendor_military}\nLeon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}Leon Watson {vendor_Longshore_Stacks}.",
        fr = "Sophia Dupont {vendor_stade} {vendor_military}\nLeon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}Leon Watson {vendor_Longshore_Stacks}.",
    },
    NUE_desc_ennemies = {
        en = "Tyger Claws\nValentinos",
        fr = "Tyger Claws\nValentinos",
    },
    NUE_desc_vendor = {
        en = "{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\nSophia Dupont {vendor_stade}.",
        fr = "{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\nSophia Dupont {vendor_stade}.",
    },
    ["SLAUGHT-O-MATIC_desc"] = {
        en = "{vendor_SLAUGHT_O_MATIC}",
        fr = "{vendor_SLAUGHT_O_MATIC}",
    },
    TAMAYURA_desc = {
        en = "Arasaka\nVoodoo Boys Manbo\nVoodoo Boys Netrunner",
        fr = "Arasaka\nVoodoo Boys Manbo\nVoodoo Boys Netrunner",
    },
    TAMAYURA_desc_additional = {
        en = "{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo}\n{vendor_Rancho_Coronado}\nLeon Watson {vendor_Longshore_Stacks}.\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo}\n{vendor_Rancho_Coronado}\nLeon Watson {vendor_Longshore_Stacks}.\n{vendor_looted} {vendor_Airdrops}.",
    },
    UNITY_desc = {
        en = "Maelstrom\nScavengers\nVoodoo Boys\nWraiths",
        fr = "Maelstrom\nScavengers\nVoodoo Boys\nWraiths",
    },
    UNITY_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\nLeon Watson {vendor_Longshore_Stacks}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_looted}:\nKaiser Herzog {vendor_Suspected_Organized_Crime_Activity} Tygers by the Tail",
        fr = "{vendor_aldecaldos} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\nLeon Watson {vendor_Longshore_Stacks}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_looted}:\nKaiser Herzog {vendor_Suspected_Organized_Crime_Activity} Tygers by the Tail",
    },
    AMNESTY_desc = {
        en = "We Gotta Live Together",
        fr = "We Gotta Live Together ",
    },
    AMNESTY_desc_additional = {
        en = "{vendor_AMNESTY}",
        fr = "{vendor_AMNESTY}",
    },
    ARCHANGEL_desc = {
        en = "A Like Supreme",
        fr = "A Like Supreme",
    },
    ARCHANGEL_desc_additional = {
        en = "{vendor_given} Kerry.",
        fr = "{vendor_given} Kerry.",
    },
    BALD_EAGLE_desc = {
        en = "Firestarter",
        fr = "Firestarter",
    },
    BALD_EAGLE_desc_additional = {
        en = "{vendor_dropped} Kurt Hansen. \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_dropped} Kurt Hansen. \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    ["COMRADE'S_HAMMER_desc"] = {
        en = "{vendor_SOCA} (Arroyo)",
        fr = "Activité criminelle organisée suspectée (Arroyo)",
    },
    ["COMRADE'S_HAMMER_desc_additional"] = {
        en = "{vendor_craftings}{vendor_dropped} Darius Miles.",
        fr = "{vendor_craftings}{vendor_dropped} Darius Miles.",
    },
    CRASH_desc = {
        en = "Following the River",
        fr = "Following the River",
    },
    CRASH_desc_additional = {
        en = "{vendor_given} River.",
        fr = "{vendor_given} River",
    },
    DOOM_DOOM_desc = {
        en = "Second Conflict",
        fr = "Second Conflict",
    },
    DOOM_DOOM_desc_additional = {
        en = "{vendor_dropped} Dum Dum. \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_dropped} Dum Dum. \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    ["GRIS-GRIS_desc"] = {
        en = "Slider's Hideout",
        fr = "Slider's Hideout",
    },
    ["GRIS-GRIS_desc_additional"] = {
        en = "{vendor_GRIS_GRIS}",
        fr = "{vendor_GRIS_GRIS}",
    },
    LAIKA_desc = {
        en = "{vendor_LAIKA}",
        fr = "{vendor_LAIKA}",
    },
    LAIKA_desc_additional = {
        en = "{vendor_purchased} {vendor_from} Herold Lowe, {vendor_stade} {vendor_not_looted}",
        fr = "{vendor_purchased} {vendor_from} Herold Lowe , {vendor_stade} {vendor_not_looted}",
    },
    MANCINELLA_desc = {
        en = "Run This Town",
        fr = "Run This Town",
    },
    MANCINELLA_desc_additional = {
        en = "{vendor_MANCINELLA} Mr. Hands.",
        fr = "{vendor_MANCINELLA} M. Hands",
    },
    ["OL'_RELIABLE_desc"] = {
        en = "Shot by Both Sides",
        fr = "Shot by Both Sides",
    },
    ["OL'_RELIABLE_desc_additional"] = {
        en = "{vendor_dropped} Dante Caruso.",
        fr = "{vendor_dropped} Dante Caruso .",
    },
    ROSCO_desc = {
        en = "Waiting for Dodger",
        fr = "Waiting for Dodger",
    },
    ROSCO_desc_additional = {
        en = "{vendor_dropped} Dodger.",
        fr = "{vendor_dropped} Dodger",
    },
    TAIGAN_desc = {
        en = "{vendor_TAIGAN}",
        fr = "{vendor_TAIGAN}",
    },
    TAIGAN_desc_additional = {
        en = "{vendor_purchased} {vendor_from} Herold Lowe, {vendor_stade} {vendor_not_looted}",
        fr = "{vendor_purchased} {vendor_from} Herold Lowe, {vendor_stade} {vendor_not_looted}",
    },
    ["DR-12_QUASAR_desc"] = {
        en = "Animals\nMaelstrom\nValentinos\nWraiths",
        fr = "Animals\nMaelstrom\nValentinos\nWraiths",
    },
    ["DR-12_QUASAR_desc_additional"] = {
        en = "{vendor_aldecaldos}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nSophia Dupont {vendor_stade} {vendor_military}\n\nSophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_Glen}",
        fr = "{vendor_aldecaldos}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nSophia Dupont {vendor_stade} {vendor_military}\n\nSophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_Glen}",
    },
    DR5_NOVA_desc = {
        en = "6th Street\nAnimals\nScavengers\nTyger Claws\nValentinos",
        fr = "6th Street\nAnimals\nScavengers\nTyger Claws\nValentinos",
    },
    DR5_NOVA_desc_additional = {
        en = "{vendor_aldecaldos}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nSophia Dupont {vendor_stade}\n\n{vendor_tier} 1 {vendor_craftings} {vendor_default}.\n\n{vendor_craftings}{vendor_Northside}",
        fr = "{vendor_aldecaldos}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nSophia Dupont {vendor_stade}\n\n{vendor_tier} 1 {vendor_craftings} {vendor_default}.\n\n{vendor_craftings}{vendor_Northside}",
    },
    METEL_desc = {
        en = "Scavengers Rat",
        fr = "Scavengers Rat",
    },
    METEL_desc_additional = {
        en = "Sophia Dupont {vendor_stade} {vendor_military}\nLeon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}Sophia Dupont {vendor_stade}\n\n{vendor_craftings} {vendor_METEL}",
        fr = "Sophia Dupont {vendor_stade} {vendor_military}\nLeon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}Sophia Dupont {vendor_stade}\n\n{vendor_craftings} {vendor_METEL}",
    },
    OVERTURE_desc = {
        en = "6th Street\nValentinos",
        fr = "6th Street\nValentinos",
    },
    OVERTURE_desc_additional = {
        en = "{vendor_lvl} 17 {from}\n{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Rancho_Coronado}\nSophia Dupont {vendor_stade} {vendor_military}\nLeon Watson {vendor_Longshore_Stacks}",
        fr = "{vendor_lvl} 17 {from}\n{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Rancho_Coronado}\nSophia Dupont {vendor_stade} {vendor_military}\nLeon Watson {vendor_Longshore_Stacks}",
    },
    ["RT-46_BURYA_desc"] = {
        en = "Animals\nMaelstrom\nWraiths",
        fr = "Animals\nMaelstrom\nWraiths",
    },
    ["RT-46_BURYA_desc_additional"] = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Northside} {vendor_neon}\n{vendor_Arroyo} {vendor_military}\n Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_craftings} {vendor_purchased} {vendor_from} {vendor_Arroyo}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Northside} {vendor_neon}\n{vendor_Arroyo} {vendor_military}\n Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_craftings} {vendor_purchased} {vendor_from} {vendor_Arroyo}",
    },
    CARMEN_desc = {
        en = "Balls to the Wall",
        fr = "Balls to the Wall",
    },
    CARMEN_desc_additional = {
        en = "{vendor_only_obtained} {vendor_CARMEN}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_only_obtained} {vendor_CARMEN}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    CHINOOK_desc = {
        en = "{vendor_looted} {vendor_Airdrops} {vendor_CHINOOK}",
        fr = "{vendor_looted} {vendor_Airdrops} {vendor_CHINOOK}",
    },
    CHINOOK_desc_additional = {
        en = "{vendor_CHINOOK_additional}",
        fr = "{vendor_CHINOOK_additional}",
    },
    DIVIDED_WE_STAND_desc = {
        en = "Stadium Love",
        fr = "Stadium Love",
    },
    DIVIDED_WE_STAND_desc_additional = {
        en = "{vendor_DIVIDED_WE_STAND}",
        fr = "{vendor_DIVIDED_WE_STAND}",
    },
    D5_Sidewinder_desc = {
        en = "6th Street Sarge (Fast Ranged)\n6th Street Soldier (Ranged)\nTyger Claws Assassin (Tyger Claws)\nBlazer\nHardened Triggerman\nMaelstrom Fanatic\nMaelstrom Goon\nMaelstrom Robot\nAfterlife Mercs Merc\nMerc\nArasaka Soldier (Arasaka)\nTyger Claws Dragon\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nValentinos Sanguinario\nVoodoo Boys Malfini\nWraiths Devil\nWraiths Hunter",
        fr = "6th Street Sarge (Fast Ranged)\n6th Street Soldier (Ranged)\nTyger Claws Assassin (Tyger Claws)\nBlazer\nHardened Triggerman\nMaelstrom Fanatic\nMaelstrom Goon\nMaelstrom Robot\nAfterlife Mercs Merc\nMerc\nArasaka Soldier (Arasaka)\nTyger Claws Dragon\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nValentinos Sanguinario\nVoodoo Boys Malfini\nWraiths Devil\nWraiths Hunter",
    },
    D5_Sidewinder_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_Rancho_Coronado}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_Rancho_Coronado}",
    },
    HAWK_desc = {
        en = "Lucretia My Reflection",
        fr = "Lucretia My Reflection",
    },
    HAWK_desc_additional = {
        en = "{vendor_HAWK}",
        fr = "{vendor_HAWK}",
    },
    HERCULES_3AX_desc = {
        en = "Roads to Redemption",
        fr = "Roads to Redemption",
    },
    HERCULES_3AX_desc_additional = {
        en = "{vendor_HERCULES_3AX}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_HERCULES_3AX}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
    },
    ["KYUBI_X-MOD2_desc"] = {
        en = "{vendor_KYUBI_X_MOD2}",
        fr = "{vendor_KYUBI_X_MOD2}",
    },
    MORON_LABE_desc = {
        en = "{vendor_SOCA} ({vendor_WWE})",
        fr = "{vendor_SOCA} ({vendor_WWE})",
    },
    MORON_LABE_desc_additional = {
        en = "{vendor_craftings}{vendor_dropped} Anton Kolev",
        fr = "{vendor_craftings}{vendor_dropped} Anton Kolev",
    },
    PIT_BULL_desc = {
        en = "{vendor_looted} {vendor_Airdrops} {vendor_PIT_BULL}",
        fr = "{vendor_looted} {vendor_Airdrops} {vendor_PIT_BULL}",
    },
    PIT_BULL_desc_additional = {
        en = "{vendor_PIT_BULL_additional}",
        fr = "{vendor_PIT_BULL_additional}",
    },
    PREJUDICE_desc = {
        en = "For Whom the Bell Tolls",
        fr = "For Whom the Bell Tolls",
    },
    PREJUDICE_desc_additional = {
        en = "{vendor_PREJUDICE}",
        fr = "{vendor_PREJUDICE}",
    },
    ["PSALM_11:6_desc"] = {
        en = "Just Say No",
        fr = "Just Say No",
    },
    ["PSALM_11:6_desc_additional"] = {
        en = "{vendor_craftings}{vendor_dropped} Tom Ayer.",
        fr = "{vendor_craftings}{vendor_dropped} Tom Ayer.",
    },
    ["UMBRA_X-MOD2_desc"] = {
        en = "{vendor_UMBRA_X_MOD2}",
        fr = "{vendor_UMBRA_X_MOD2}",
    },
    D5_COPPERHEAD_desc = {
        en = "6th Street Sarge (Fast Ranged)\n6th Street Soldier (Ranged)\nBARGHEST Lieutenant\nBARGHEST Sergeant\nMerc\nPatrol Officer (NCPD)\nRobot\nNCPD Robot (NCPD)\nWraiths Robot (Wraiths)\nScavengers Crow\nArasaka Soldier (Arasaka)\nValentinos Sanguinario\nVeteran Guard",
        fr = "6th Street Sarge (Fast Ranged)\n6th Street Soldier (Ranged)\nBARGHEST Lieutenant\nBARGHEST Sergeant\nMerc\nPatrol Officer (NCPD)\nRobot\nNCPD Robot (NCPD)\nWraiths Robot (Wraiths)\nScavengers Crow\nArasaka Soldier (Arasaka)\nValentinos Sanguinario\nVeteran Guard",
    },
    D5_COPPERHEAD_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nHerold Lowe {vendor_stade} {vendor_BARGHEST}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_looted}:\nBruce Ward {vendor_Suspected_Organized_Crime_Activity} Rocky Ridge",
        fr = "{vendor_aldecaldos} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nHerold Lowe {vendor_stade} {vendor_BARGHEST}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_looted}:\nBruce Ward {vendor_Suspected_Organized_Crime_Activity} Rocky Ridge",
    },
    DA8_UMBRA_desc = {
        en = "BARGHEST Lieutenant\nBARGHEST Sergeant\nClassified Black Ops Operative\nBlazer\nMaelstrom Fanatic\nMaelstrom Goon\nMaelstrom Robot\nAfterlife Mercs Merc\nMerc\nMilitech Infantry Scout\nTyger Claws Dragon\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nVoodoo Boys Malfini\nWraiths Boss Hunter (Wraiths)\nWraiths Devil\nWraiths Hunter",
        fr = "BARGHEST Lieutenant\nBARGHEST Sergeant\nClassified Black Ops Operative\nBlazer\nMaelstrom Fanatic\nMaelstrom Goon\nMaelstrom Robot\nAfterlife Mercs Merc\nMerc\nMilitech Infantry Scout\nTyger Claws Dragon\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nVoodoo Boys Malfini\nWraiths Boss Hunter (Wraiths)\nWraiths Devil\nWraiths Hunter",
    },
    DA8_UMBRA_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}\n\n{vendor_craftings}{vendor_Northside}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}\n\n{vendor_craftings}{vendor_Northside}",
    },
    ["HJSH-18_MASAMUNE_desc"] = {
        en = "Arasaka Ranger (Arasaka)\nArasaka Robot (Arasaka)\nArasaka Soldier (Arasaka)\nTrauma Team Support\nTyger Claws Dragon\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nVoodoo Boys Malfini",
        fr = "Arasaka Ranger (Arasaka)\nArasaka Robot (Arasaka)\nArasaka Soldier (Arasaka)\nTrauma Team Support\nTyger Claws Dragon\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nVoodoo Boys Malfini",
    },
    ["HJSH-18_MASAMUNE_desc_additional"] = {
        en = "{vendor_Japantown}\n{vendor_Downtown} {vendor_neon}\nPhantom Liberty Sophia Dupont {vendor_stade}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}\n{vendor_Japantown}",
        fr = "{vendor_Japantown}\n{vendor_Downtown} {vendor_neon}\nPhantom Liberty Sophia Dupont {vendor_stade}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}\n{vendor_Japantown}",
    },
    KYUBI_desc = {
        en = "6th Street Sarge (Fast Ranged)\n6th Street Soldier (Ranged)\nBARGHEST Lieutenant\nBARGHEST Sergeant\nClassified Black Ops Operative\nMilitech Infantry Scout\nValentinos Sanguinario\nVeteran Guard",
        fr = "6th Street Sarge (Fast Ranged)\n6th Street Soldier (Ranged)\nBARGHEST Lieutenant\nBARGHEST Sergeant\nClassified Black Ops Operative\nMilitech Infantry Scout\nValentinos Sanguinario\nVeteran Guard",
    },
    KYUBI_desc_additional = {
        en = "{vendor_kabuki}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Rancho_Coronado}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}",
        fr = "{vendor_kabuki}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Rancho_Coronado}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}",
    },
    M251S_AJAX_desc = {
        en = "6th Street Sarge (Fast Ranged)\n6th Street Soldier (Ranged)\nBARGHEST Lieutenant\nBARGHEST Sergeant\nClassified Black Ops Operative\nHardened Triggerman\nMaelstrom Fanatic\nMaelstrom Goon\nMaelstrom Robot\nMaxTac Enforcer (NCPD)\nMerc\nMilitech Infantry Scout\nPatrol Officer (NCPD)\nRobot\nMilitech Robot (Militech)\nNCPD Robot (NCPD)\nValentinos Sanguinario\nVeteran Guard\nVoodoo Boys Malfini\nWraiths Devil\nWraiths Hunter",
        fr = "6th Street Sarge (Fast Ranged)\n6th Street Soldier (Ranged)\nBARGHEST Lieutenant\nBARGHEST Sergeant\nClassified Black Ops Operative\nHardened Triggerman\nMaelstrom Fanatic\nMaelstrom Goon\nMaelstrom Robot\nMaxTac Enforcer (NCPD)\nMerc\nMilitech Infantry Scout\nPatrol Officer (NCPD)\nRobot\nMilitech Robot (Militech)\nNCPD Robot (NCPD)\nValentinos Sanguinario\nVeteran Guard\nVoodoo Boys Malfini\nWraiths Devil\nWraiths Hunter",
    },
    M251S_AJAX_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}{vendor_West_Wind_Estate}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}{vendor_West_Wind_Estate}",
    },
    NOWAKI_desc = {
        en = "Arasaka Robot (Arasaka)\nArasaka Soldier (Arasaka)\nTyger Claws Dragon\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress",
        fr = "Arasaka Robot (Arasaka)\nArasaka Soldier (Arasaka)\nTyger Claws Dragon\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress",
    },
    NOWAKI_desc_additional = {
        en = "{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo}\n{vendor_Rancho_Coronado}\nPhantom Liberty Sophia Dupont {vendor_stade}",
        fr = "{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo}\n{vendor_Rancho_Coronado}\nPhantom Liberty Sophia Dupont {vendor_stade}",
    },
    HYPERCRITICAL_desc = {
        en = "Concrete Cage Trap",
        fr = "Concrete Cage Trap",
    },
    HYPERCRITICAL_desc_additional = {
        en = "{vendor_given} Tiny Mike.",
        fr = "{vendor_given} Tiny Mike ",
    },
    ["M-179E_ACHILLES_X-MOD2_desc"] = {
        en = "{vendor_M_179E_ACHILLES_X_MOD2}",
        fr = "{vendor_M_179E_ACHILLES_X_MOD2}",
    },
    WIDOW_MAKER_desc = {
        en = "Ghost Town(1)\n\nQueen of the Highway(2)",
        fr = "Ghost Town(1)\n\nQueen of the Highway(2)",
    },
    WIDOW_MAKER_desc_additional = {
        en = "(1){vendor_dropped} Nash\n\n(2){vendor_dropped} Nash, {vendor_WIDOW_MAKER}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
        fr = "(1){vendor_dropped} Nash\n\n(2){vendor_dropped} Nash, {vendor_WIDOW_MAKER}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
    },
    ["M-179E_ACHILLES_desc"] = {
        en = "Classified Black Ops Sniper\nMilitech Sniper\nWraiths Sniper",
        fr = "Classified Black Ops Sniper\nMilitech Sniper\nWraiths Sniper",
    },
    ["M-179E_ACHILLES_desc_additional"] = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_Northside} (2077) {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_craftings}{vendor_aldecaldos}\n\n{vendor_craftings}{vendor_dropped}:\nStanislaus Zbyszko {vendor_M_179E_ACHILLES}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_Northside} (2077) {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_craftings}{vendor_aldecaldos}\n\n{vendor_craftings}{vendor_dropped}:\nStanislaus Zbyszko {vendor_M_179E_ACHILLES}",
    },
    ["SOR-22_desc"] = {
        en = "6th Street Sniper\nBARGHEST Sniper\nClassified Black Ops Sniper\nMilitech Sniper\nValentinos Francotirador\nWraiths Sniper",
        fr = "6th Street Sniper\nBARGHEST Sniper\nClassified Black Ops Sniper\nMilitech Sniper\nValentinos Francotirador\nWraiths Sniper",
    },
    ["SOR-22_desc_additional"] = {
        en = "{vendor_aldecaldos}\n{vendor_Red_Peaks}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings} {vendor_purchased}\n{vendor_Japantown}",
        fr = "{vendor_aldecaldos}\n{vendor_Red_Peaks}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings} {vendor_purchased}\n{vendor_Japantown}",
    },
    BORZAYA_desc = {
        en = "{vendor_BORZAYA}",
        fr = "{vendor_BORZAYA}",
    },
    BORZAYA_desc_additional = {
        en = "{vendor_purchased} {vendor_from} Herold Lowe, {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_purchased} {vendor_from} Herold Lowe, {vendor_stade} {vendor_not_looted}.",
    },
    BREAKTHROUGH_desc = {
        en = "{vendor_SOCA}:New Boss, New Rules",
        fr = "{vendor_SOCA}:New Boss, New Rules",
    },
    BREAKTHROUGH_desc_additional = {
        en = "{vendor_craftings}{vendor_dropped} Olga Elisabeth Longmead.",
        fr = "{vendor_craftings}{vendor_dropped} Olga Elisabeth Longmead",
    },
    FOXHOUND_desc = {
        en = "{vendor_looted} {vendor_Airdrops} {vendor_FOXHOUND}",
        fr = "{vendor_looted} {vendor_Airdrops} {vendor_FOXHOUND}",
    },
    FOXHOUND_desc_additional = {
        en = "{vendor_FOXHOUND_additional}",
        fr = "{vendor_FOXHOUND_additional}",
    },
    NDI_OSPREY_desc = {
        en = "Birds with Broken Wings",
        fr = "Birds with Broken Wings",
    },
    NDI_OSPREY_desc_additional = {
        en = "{vendor_NDI_OSPREY}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_NDI_OSPREY}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    ["O'FIVE_desc"] = {
        en = "Beat on the Brat: Arroyo",
        fr = "Beat on the Brat: Arroyo",
    },
    ["O'FIVE_desc_additional"] = {
        en = "{vendor_O_FIVE}",
        fr = "{vendor_O_FIVE}",
    },
    OVERWATCH_desc = {
        en = "Riders on the Storm",
        fr = "Riders on the Storm",
    },
    OVERWATCH_desc_additional = {
        en = "{vendor_given} Panam Palmer {vendor_end_quest}",
        fr = "{vendor_given} Panam Palmer {vendor_end_quest}",
    },
    RASETSU_desc = {
        en = "You Know My Name",
        fr = "You Know My Name",
    },
    RASETSU_desc_additional = {
        en = "{vendor_RASETSU}",
        fr = "{vendor_RASETSU}",
    },
    SPARKY_desc = {
        en = "{vendor_Criminal_Activity} SCAVENGERS",
        fr = "{vendor_Criminal_Activity} SCAVENGERS",
    },
    SPARKY_desc_additional = {
        en = "{vendor_SPARKY_key} {vendor_looted} {vendor_SPARKY}",
        fr = "{vendor_SPARKY_key} {vendor_looted} {vendor_SPARKY}",
    },
    YASHA_desc = {
        en = "{vendor_YASHA}",
        fr = "{vendor_YASHA}",
    },
    YASHA_desc_additional = {
        en = "{vendor_YASHA_additional}",
        fr = "{vendor_YASHA_additional}",
    },
    ASHURA_desc = {
        en = "Arasaka Sniper (Arasaka)\nKang Tao Sniper",
        fr = "Arasaka Sniper (Arasaka)\nKang Tao Sniper",
    },
    ASHURA_desc_additional = {
        en = "{vendor_lvl} {vendor_from}:\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings} {vendor_purchased}\n{vendor_Downtown}\n\n{vendor_craftings}{vendor_dropped}\nPaul Craven {vendor_ASHURA}",
        fr = "{vendor_lvl} {vendor_from}:\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings} {vendor_purchased}\n{vendor_Downtown}\n\n{vendor_craftings}{vendor_dropped}\nPaul Craven {vendor_ASHURA}",
    },
    NEKOMATA_desc = {
        en = "6th Street Sniper\nBARGHEST Sniper\nClassified Black Ops Sniper\nMaelstrom Raven\nMilitech Sniper\nScavengers Sniper\nArasaka Sniper (Arasaka)\nSniper\nKang Tao Sniper\nValentinos Francotirador\nWraiths Sniper",
        fr = "6th Street Sniper\nBARGHEST Sniper\nClassified Black Ops Sniper\nMaelstrom Raven\nMilitech Sniper\nScavengers Sniper\nArasaka Sniper (Arasaka)\nSniper\nKang Tao Sniper\nValentinos Francotirador\nWraiths Sniper",
    },
    NEKOMATA_desc_additional = {
        en = "{vendor_Red_Peaks} {vendor_military}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Rancho_Coronado}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}",
        fr = "{vendor_Red_Peaks} {vendor_military}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Rancho_Coronado}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}",
    },
    SPT32_GRAD_desc = {
        en = "6th Street Sniper\nScavengers Sniper\nValentinos Francotirador",
        fr = "6th Street Sniper\nScavengers Sniper\nValentinos Francotirador",
    },
    SPT32_GRAD_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\nPhantom Liberty {vendor_looted} {vendor_Airdrops}.\n\n{vendor_craft} {vendor_lvl} 9 {vendor_from}:\n{vendor_aldecaldos}",
        fr = "{vendor_aldecaldos} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\nPhantom Liberty {vendor_looted} {vendor_Airdrops}.\n\n{vendor_craft} {vendor_lvl} 9 {vendor_from}:\n{vendor_aldecaldos}",
    },
    ALABAI_desc = {
        en = "{vendor_ALABAI}",
        fr = "{vendor_ALABAI}",
    },
    ALABAI_desc_additional = {
        en = "{vendor_purchased} {vendor_from} Herold Lowe, {vendor_stade}{vendor_not_looted}",
        fr = "{vendor_purchased} {vendor_from} Herold Lowe, {vendor_stade}{vendor_not_looted}",
    },
    AMSTAFF_desc = {
        en = "{vendor_looted} {vendor_Airdrops} {vendor_AMSTAFF}",
        fr = "{vendor_looted} {vendor_Airdrops} {vendor_AMSTAFF}",
    },
    AMSTAFF_desc_additional = {
        en = "{vendor_AMSTAFF_additional}",
        fr = "{vendor_AMSTAFF_additional}",
    },
    BA_XING_CHONG_desc = {
        en = "{vendor_craftings} {vendor_BA_XING_CHONG}",
        fr = "{vendor_craftings} {vendor_BA_XING_CHONG}",
    },
    BLOODY_MARIA_desc = {
        en = "Ride Captain Ride",
        fr = "Ride Captain Ride",
    },
    BLOODY_MARIA_desc_additional = {
        en = "{vendor_v_stash}.",
        fr = "{vendor_v_stash}",
    },
    DEZERTER_desc = {
        en = "Addicted To Chaos",
        fr = "Addicted To Chaos",
    },
    DEZERTER_desc_additional = {
        en = "{vendor_DEZERTER}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_DEZERTER}\n\n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    GUTS_desc = {
        en = "MAP Memorial Park",
        fr = "MAP Memorial Park",
    },
    GUTS_desc_additional = {
        en = "{vendor_GUTS}",
        fr = "{vendor_GUTS}",
    },
    MOX_desc = {
        en = "Pyramid Song",
        fr = "Pyramid Song",
    },
    MOX_desc_additional = {
        en = "{vendor_given} Judy {vendor_MOX}",
        fr = "{vendor_given} Judy {vendor_MOX}",
    },
    ORDER_desc = {
        en = "{vendor_purchased} Herold Lowe {vendor_stade}",
        fr = "{vendor_purchased} Herold Lowe {vendor_stade}",
    },
    ["POZHAR_X-MOD2_desc"] = {
        en = "{vendor_POZHAR_X_MOD2}",
        fr = "{vendor_POZHAR_X_MOD2}",
    },
    SOVEREIGN_desc = {
        en = "Modern Labor Market",
        fr = "Modern Labor Market",
    },
    SOVEREIGN_desc_additional = {
        en = "{vendor_craftings}{vendor_dropped} Shinobu Amai.",
        fr = "{vendor_craftings}{vendor_dropped} Shinobu Amai.",
    },
    THE_HEADSMAN_desc = {
        en = "Privacy Policy Violation",
        fr = "Privacy Policy Violation",
    },
    THE_HEADSMAN_desc_additional = {
        en = "{vendor_craftings}{vendor_dropped} the Militech Minotaur",
        fr = "{vendor_craftings}{vendor_dropped} the Militech Minotaur",
    },
    CARNAGE_desc = {
        en = "Animals Brutalizer\nAnimals Jackhammer\nBARGHEST Enforcer\nBARGHEST Punisher\nMaelstrom Maniac\nStreet Scrapper\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)",
        fr = "Animals Brutalizer\nAnimals Jackhammer\nBARGHEST Enforcer\nBARGHEST Punisher\nMaelstrom Maniac\nStreet Scrapper\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)",
    },
    CARNAGE_desc_additional = {
        en = "Marty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}\n\n{vendor_craftings} {vendor_purchased}\n{vendor_Vista_del_Rey}",
        fr = "Marty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}\n\n{vendor_craftings} {vendor_purchased}\n{vendor_Vista_del_Rey}",
    },
    CRUSHER_desc = {
        en = "{vendor_aldecaldos}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Glen}",
        fr = "{vendor_aldecaldos}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Glen}",
    },
    ["DB-2_SATARA_desc"] = {
        en = "Animals Brutalizer\nAnimals Jackhammer\nMaelstrom Maniac\nScavengers Hound\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)\nVoodoo Boys Punisher\nVoodoo Boys Snakecharmer\nWraiths Bane\nWraiths Ghoul (Fast Shotgunner)",
        fr = "Animals Brutalizer\nAnimals Jackhammer\nMaelstrom Maniac\nScavengers Hound\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)\nVoodoo Boys Punisher\nVoodoo Boys Snakecharmer\nWraiths Bane\nWraiths Ghoul (Fast Shotgunner)",
    },
    ["DB-2_SATARA_desc_additional"] = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_Vista_del_Rey}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_Vista_del_Rey}",
    },
    ["DB-2_TESTERA_desc"] = {
        en = "Animals Brutalizer\nAnimals Jackhammer\nMaelstrom Maniac\nVeteran Guard",
        fr = "Animals Brutalizer\nAnimals Jackhammer\nMaelstrom Maniac\nVeteran Guard",
    },
    ["DB-2_TESTERA_desc_additional"] = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade}\n\n{vendor_craftings}{vendor_Northside}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade}\n\n{vendor_craftings}{vendor_Northside}",
    },
    ["DB-4_IGLA_desc"] = {
        en = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nBARGHEST Enforcer\nBARGHEST Punisher\nScavengers Hound\nValentinos Macho\nValentinos Sicario",
        fr = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nBARGHEST Enforcer\nBARGHEST Punisher\nScavengers Hound\nValentinos Macho\nValentinos Sicario",
    },
    ["DB-4_IGLA_desc_additional"] = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Japantown}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\n\n{vendor_DB_4_IGLA}\n\n{vendor_tier} 1 {vendor_craftings} {vendor_default}.\n\n{vendor_craftings} {vendor_dropped}\nRufus McBride {vendor_DB_4_IGLA_additional} {vendor_SOCA} in Jackson Plains",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Japantown}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\n\n{vendor_DB_4_IGLA}\n\n{vendor_tier} 1 {vendor_craftings} {vendor_default}.\n\n{vendor_craftings} {vendor_dropped}\nRufus McBride {vendor_DB_4_IGLA_additional} {vendor_SOCA} a Jackson Plains",
    },
    ["DB-4_PALICA_desc"] = {
        en = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nAnimals Brutalizer\nAnimals Jackhammer\nScavengers Hound\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)",
        fr = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nAnimals Brutalizer\nAnimals Jackhammer\nScavengers Hound\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)",
    },
    ["DB-4_PALICA_desc_additional"] = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.\n\n{vendor_craft} {vendor_lvl} 9 {vendor_from}\n{vendor_Rancho_Coronado}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Japantown}\n{vendor_Vista_del_Rey}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.\n\n{vendor_craft} {vendor_lvl} 9 {vendor_from}\n{vendor_Rancho_Coronado}",
    },
    ["L-69_ZHUO_desc"] = {
        en = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nAnimals Brutalizer\nAnimals Jackhammer\nArasaka Assault Specialist (Arasaka)\nArasaka Cyborg Demo Expert\nArasaka Elite Assault Specialist (Arasaka)\nKang Tao Elite Rapid\nKang Tao Rapid\nArasaka Specialist (Arasaka)\nArasaka Tactician (Arasaka)\nTrauma Team Assault Specialist\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)\nValentinos Macho\nValentinos Sicario\nVoodoo Boys Punisher\nVoodoo Boys Snakecharmer\nWraiths Bane\nWraiths Ghoul (Fast Shotgunner)",
        fr = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nAnimals Brutalizer\nAnimals Jackhammer\nArasaka Assault Specialist (Arasaka)\nArasaka Cyborg Demo Expert\nArasaka Elite Assault Specialist (Arasaka)\nKang Tao Elite Rapid\nKang Tao Rapid\nArasaka Specialist (Arasaka)\nArasaka Tactician (Arasaka)\nTrauma Team Assault Specialist\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)\nValentinos Macho\nValentinos Sicario\nVoodoo Boys Punisher\nVoodoo Boys Snakecharmer\nWraiths Bane\nWraiths Ghoul (Fast Shotgunner)",
    },
    ["L-69_ZHUO_desc_additional"] = {
        en = "{vendor_Red_Peaks} {vendor_military}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Downtown}",
        fr = "{vendor_Red_Peaks} {vendor_military}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Downtown}",
    },
    M2038_TACTICIAN_desc = {
        en = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nArasaka Assault Specialist (Arasaka)\nBARGHEST Enforcer\nBARGHEST Punisher\nClassified Black Ops Shotgunner\nClassified Black Ops Shotgunner (Elite)\nArasaka Cyborg Demo Expert\nArasaka Elite Assault Specialist (Arasaka)\nArasaka Guard (Arasaka)\nMilitech Ranger\nMilitech Spec Ops Soldier\nMilitech Robot (Militech)\nWraiths Robot (Wraiths)\nScavengers Hound\nArasaka Tactician (Arasaka)\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)\nValentinos Macho\nValentinos Sicario\nVoodoo Boys Punisher\nVoodoo Boys Snakecharmer\nWraiths Bane\nWraiths Ghoul (Fast Shotgunner)",
        fr = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nArasaka Assault Specialist (Arasaka)\nBARGHEST Enforcer\nBARGHEST Punisher\nClassified Black Ops Shotgunner\nClassified Black Ops Shotgunner (Elite)\nArasaka Cyborg Demo Expert\nArasaka Elite Assault Specialist (Arasaka)\nArasaka Guard (Arasaka)\nMilitech Ranger\nMilitech Spec Ops Soldier\nMilitech Robot (Militech)\nWraiths Robot (Wraiths)\nScavengers Hound\nArasaka Tactician (Arasaka)\nTyger Claws Blitzer\nTyger Claws Blitzer (Elite)\nValentinos Macho\nValentinos Sicario\nVoodoo Boys Punisher\nVoodoo Boys Snakecharmer\nWraiths Bane\nWraiths Ghoul (Fast Shotgunner",
    },
    M2038_TACTICIAN_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}Phantom Liberty Sophia Dupont {vendor_stade}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}Phantom Liberty Sophia Dupont {vendor_stade}",
    },
    ["VST-37_POZHAR_desc"] = {
        en = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nAnimals Brutalizer\nAnimals Jackhammer\nValentinos Macho\nValentinos SicarioWraiths Bane",
        fr = "6th Street Lieutenant\n6th Street Lieutenant (Fast Shotgunner)\n6th Street Sarge\nAnimals Brutalizer\nAnimals Jackhammer\nValentinos Macho\nValentinos SicarioWraiths Bane",
    },
    ["VST-37_POZHAR_desc_additional"] = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Northside}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Northside}",
    },
    BUZZSAW_desc = {
        en = "Vice Control",
        fr = "Vice Control",
    },
    BUZZSAW_desc_additional = {
        en = "{vendor_craftings}{vendor_dropped} Yelena Sidorova.",
        fr = "{vendor_craftings}{vendor_dropped} Yelena Sidorova.",
    },
    CHESAPEAKE_desc = {
        en = "{vendor_looted} {vendor_Airdrops} {vendor_at_level} 40 {vendor_higter}",
        fr = "{vendor_looted} {vendor_Airdrops} {vendor_at_level} 40 {vendor_higter}",
    },
    CHESAPEAKE_desc_additional = {
        en = "{vendor_CHESAPEAKE}",
        fr = "{vendor_CHESAPEAKE}",
    },
    EREBUS_desc = {
        en = "Somewhat Damaged",
        fr = "Somewhat Damaged",
    },
    EREBUS_desc_additional = {
        en = "{vendor_craftings} {vendor_EREBUS}",
        fr = "{vendor_craftings} {vendor_EREBUS}",
    },
    FENRIR_desc = {
        en = "Sacrum Profanum/Losing My Religion",
        fr = "Sacrum Profanum/Losing My Religion",
    },
    FENRIR_desc_additional = {
        en = "{vendor_FENRIR}",
        fr = "{vendor_FENRIR}",
    },
    ["GUILLOTINE_X-MOD2_desc"] = {
        en = "{vendor_GUILLOTINE_X_MOD2}",
        fr = "{vendor_GUILLOTINE_X_MOD2}",
    },
    ["GUILLOTINE_X-MOD2_desc_additional"] = {
        en = "{vendor_GUILLOTINE_X_MOD2_additional}",
        fr = "{vendor_GUILLOTINE_X_MOD2_additional}",
    },
    PIZDETS_desc = {
        en = "Spy in the Jungle",
        fr = "Spy in the Jungle",
    },
    PIZDETS_desc_additional = {
        en = "{vendor_PIZDETS}",
        fr = "{vendor_PIZDETS}",
    },
    PROBLEM_SOLVER_desc = {
        en = "Riders on the Storm",
        fr = "Riders on the Storm.",
    },
    PROBLEM_SOLVER_desc_additional = {
        en = "{vendor_dropped} {vendor_boss_wraith} \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_dropped} {vendor_boss_wraith} \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    PROTOTYPE_SHINGEN_MARK_V_desc = {
        en = "Arasaka Industrial Park",
        fr = "Arasaka Industrial Park",
    },
    PROTOTYPE_SHINGEN_MARK_V_desc_additional = {
        en = "{vendor_PROTOTYPE}",
        fr = "{vendor_PROTOTYPE}",
    },
    RAIJU_desc = {
        en = "{vendor_Criminal_Activity} BARGHEST",
        fr = "{vendor_Criminal_Activity} BARGHEST",
    },
    RAIJU_desc_additional = {
        en = "{vendor_SPARKY_key} {vendor_looted} {vendor_from} Ross Ulmer.",
        fr = "{vendor_SPARKY_key} {vendor_looted} {vendor_from} Ross Ulmer .",
    },
    YINGLONG_desc = {
        en = "Living the Big Life",
        fr = "Living the Big Life",
    },
    YINGLONG_desc_additional = {
        en = "{vendor_craftings}{vendor_dropped} Denzel Cryer.",
        fr = "{vendor_craftings}{vendor_dropped} Denzel Cryer.",
    },
    DS1_PULSAR_desc = {
        en = "6th Street Recruit (Ranged)\n6th Street Robot\nBARGHEST Private\nBARGHEST Sergeant\nClassified Black Ops Operative\nMaelstrom Goon\nMaelstrom Robot\nMilitech Recon Support\nPatrol Officer (NCPD)\nScavengers Robot (Scavengers)\nWraiths Robot (Wraiths)\nScavengers Crow\nScavengers Rat\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nVeteran Guard\nVoodoo Boys Malfini\nWraiths Devil\nWraiths Hunter\nWraiths Marauder",
        fr = "6th Street Recruit (Ranged)\n6th Street Robot\nBARGHEST Private\nBARGHEST Sergeant\nClassified Black Ops Operative\nMaelstrom Goon\nMaelstrom Robot\nMilitech Recon Support\nPatrol Officer (NCPD)\nScavengers Robot (Scavengers)\nWraiths Robot (Wraiths)\nScavengers Crow\nScavengers Rat\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nVeteran Guard\nVoodoo Boys Malfini\nWraiths Devil\nWraiths Hunter\nWraiths Marauder",
    },
    DS1_PULSAR_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_Northside} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_tier} 2 {vendor_craftings}{vendor_default}.",
    },
    ["G-58_DIAN_desc"] = {
        en = "6th Street Recruit (Ranged)\n6th Street Robot\nAnimals Gunner\nAnimals Raptor\nKang Tao Robot (Kang Tao)\nScavengers Crow\nScavengers Rat\nKang Tao Soldier\nTrauma Team Support\nVoodoo Boys Malfini",
        fr = "6th Street Recruit (Ranged)\n6th Street Robot\nAnimals Gunner\nAnimals Raptor\nKang Tao Robot (Kang Tao)\nScavengers Crow\nScavengers Rat\nKang Tao Soldier\nTrauma Team Support\nVoodoo Boys Malfini",
    },
    ["G-58_DIAN_desc_additional"] = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_kabuki}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Glen}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\n{vendor_kabuki}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Glen}",
    },
    GUILLOTINE_desc = {
        en = "Animals Gunner\nAnimals Raptor\nBARGHEST Private\nBARGHEST Sergeant\nMaelstrom Goon\nMaelstrom Robot\nScavengers Crow\nScavengers Rat\nWraiths Devil\nWraiths Hunter\nWraiths Marauder",
        fr = "Animals Gunner\nAnimals Raptor\nBARGHEST Private\nBARGHEST Sergeant\nMaelstrom Goon\nMaelstrom Robot\nScavengers Crow\nScavengers Rat\nWraiths Devil\nWraiths Hunter\nWraiths Marauder",
    },
    GUILLOTINE_desc_additional = {
        en = "Marty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\nMaelstrom Weapon Vendor (Maelstrom) in Northside {vendor_neon}\n{vendor_Japantown}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_Robert_Wilson}",
        fr = "Marty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\nMaelstrom Weapon Vendor (Maelstrom) in Northside {vendor_neon}\n{vendor_Japantown}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_West_Wind_Estate}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings}{vendor_Robert_Wilson}",
    },
    M221_SARATOGA_desc = {
        en = "6th Street Recruit (Ranged)\n6th Street Robot\nAnimals Gunner\nAnimals Raptor\nBARGHEST Private\nBARGHEST Sergeant\nClassified Black Ops Operative\nMaelstrom Goon\nMaelstrom Robot\nMilitech Recon Support\nNetrunner\nScavengers Crow\nScavengers Rat\nSecurity Guard\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nVeteran Guard\nVoodoo Boys Malfini\nWraiths Boss Hunter (Wraiths)\nWraiths Devil\nWraiths Hunter\nWraiths Marauder",
        fr = "6th Street Recruit (Ranged)\n6th Street Robot\nAnimals Gunner\nAnimals Raptor\nBARGHEST Private\nBARGHEST Sergeant\nClassified Black Ops Operative\nMaelstrom Goon\nMaelstrom Robot\nMilitech Recon Support\nNetrunner\nScavengers Crow\nScavengers Rat\nSecurity Guard\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress\nVeteran Guard\nVoodoo Boys Malfini\nWraiths Boss Hunter (Wraiths)\nWraiths Devil\nWraiths Hunter\nWraiths Marauder",
    },
    M221_SARATOGA_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Northside} {vendor_neon}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}Phantom Liberty Sophia Dupont {vendor_stade}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Northside} {vendor_neon}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Herold Lowe {vendor_stade} {vendor_BARGHEST}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings}Phantom Liberty Sophia Dupont {vendor_stade}",
    },
    SENKOH_LX_desc = {
        en = "Zane Jagger in Downtown.",
        fr = "Zane Jagger au Centre .",
    },
    ["TKI-20_SHINGEN_desc"] = {
        en = "Tyger Claws Assassin (Tyger Claws)\nArasaka Guard (Arasaka)\nArasaka Ranger (Arasaka)\nArasaka Robot (Arasaka)\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress",
        fr = "Tyger Claws Assassin (Tyger Claws)\nArasaka Guard (Arasaka)\nArasaka Ranger (Arasaka)\nArasaka Robot (Arasaka)\nTyger Claws Racketeer\nTyger Claws Tyger/Tygress",
    },
    ["TKI-20_SHINGEN_desc_additional"] = {
        en = "{vendor_Red_Peaks} {vendor_military}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Downtown}",
        fr = "{vendor_Red_Peaks} {vendor_military}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Downtown}",
    },
    WARDEN_desc = {
        en = "BARGHEST Private\nBARGHEST Sergeant\nScavengers Crow\nScavengers Rat\nVoodoo Boys Malfini",
        fr = "BARGHEST Private\nBARGHEST Sergeant\nScavengers Crow\nScavengers Rat\nVoodoo Boys Malfini",
    },
    WARDEN_desc_additional = {
        en = "Sophia Dupont {vendor_stade} {vendor_military}\nHerold Lowe {vendor_stade} {vendor_BARGHEST}\n\n{vendor_craftings}Herold Lowe {vendor_stade}",
        fr = "Sophia Dupont {vendor_stade} {vendor_military}\nHerold Lowe {vendor_stade} {vendor_BARGHEST}\n\n{vendor_craftings}Herold Lowe {vendor_stade}",
    },
    ["MA70_HB_X-MOD2_desc"] = {
        en = "{vendor_MA70_HB_X_MOD2}",
        fr = "{vendor_MA70_HB_X_MOD2}",
    },
    WILD_DOG_desc = {
        en = "Firestarter",
        fr = "Firestarter",
    },
    WILD_DOG_desc_additional = {
        en = "{vendor_dropped} Kurt Hansen. \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_dropped} Kurt Hansen. \n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    M2067_DEFENDER_desc = {
        en = "Animals Crusher\nArasaka Armored Enforcer\nBARGHEST Gunner\nMaelstrom Ironstormer\nScavengers Vulture\nSupport\nNCPD Tactical Officer\nThug\nVeteran Guard",
        fr = "Animals Crusher\nArasaka Armored Enforcer\nBARGHEST Gunner\nMaelstrom Ironstormer\nScavengers Vulture\nSupport\nNCPD Tactical Officer\nThug\nVeteran Guard",
    },
    M2067_DEFENDER_desc_additional = {
        en = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings} {vendor_purchased}\n{vendor_Red_Peaks}\n\n{vendor_craftings}{vendor_dropped}:\nBarry Alken {vendor_M2067_DEFENDER}",
        fr = "{vendor_aldecaldos} {vendor_military}\n{vendor_Red_Peaks} {vendor_military}\nMarty Jenklow {vendor_Biotechnica_Flats} {vendor_military}\n{vendor_Northside}\n{vendor_Robert_Wilson}\n{vendor_kabuki}\n{vendor_Northside} {vendor_neon}\n{vendor_Japantown}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Wellsprings} {vendor_neon}\n{vendor_Glen}\n{vendor_Vista_del_Rey}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\n{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craftings} {vendor_purchased}\n{vendor_Red_Peaks}\n\n{vendor_craftings}{vendor_dropped}:\nBarry Alken {vendor_M2067_DEFENDER}",
    },
    MA70_HB_desc = {
        en = "{vendor_aldecaldos}\n{vendor_Red_Peaks}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Red_Peaks}\n\nPhantom Liberty {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_aldecaldos}\n{vendor_Red_Peaks}\n{vendor_Downtown} {vendor_pimp}\n{vendor_Arroyo} {vendor_military}\n{vendor_Rancho_Coronado}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\nPhantom Liberty Leon Watson {vendor_Longshore_Stacks}\n\n{vendor_craft} {vendor_lvl} 17 {vendor_from}:\n{vendor_Red_Peaks}\n\nPhantom Liberty {vendor_contained} {vendor_Airdrops}.",
    },
    ["MK.31_HMG_desc"] = {
        en = "Animals Wrecker\nBARGHEST Gunner\nClassified Black Ops HMG Operator\nArasaka Juggernaut (Arasaka)\nMilitech Heavy Gunner\nScavengers Vulture\nWraiths Goliath",
        fr = "Animals Wrecker\nBARGHEST Gunner\nClassified Black Ops HMG Operator\nArasaka Juggernaut (Arasaka)\nMilitech Heavy Gunner\nScavengers Vulture\nWraiths Goliath",
    },
    ["MK.31_HMG_desc_additional"] = {
        en = "{vendor_MK_31_HMG}",
        fr = "{vendor_MK_31_HMG}",
    },
    ["OZOB'S_NOSE_ICONIC_desc"] = {
        en = "Send in the Clowns",
        fr = "Send in the Clowns",
    },
    ["OZOB'S_NOSE_ICONIC_desc_additional"] = {
        en = "{vendor_craftings} {vendor_OZOB} Ozob Bozo.",
        fr = "{vendor_craftings} {vendor_OZOB} Ozob Bozo.",
    },
    ["F-GX_Frag_Grenade_desc"] = {
        en = "{vendor_open_world}",
        fr = "{vendor_open_world}",
    },
    ["F-GX_Frag_Grenade_desc_additional"] = {
        en = "{vendor_purchased} {vendor_any}",
        fr = "{vendor_purchased} {vendor_any}",
    },
    MOLODETS_BioHaz_Grenade_desc = {
        en = "{vendor_open_world}",
        fr = "{vendor_open_world}",
    },
    MOLODETS_BioHaz_Grenade_desc_additional = {
        en = "{vendor_purchased} {vendor_any} {vendor_at_level} 17.",
        fr = "{vendor_purchased} {vendor_any} {vendor_at_level} 17.",
    },
    CHAR_Incendiary_Grenade_desc = {
        en = "{vendor_open_world}",
        fr = "{vendor_open_world}",
    },
    CHAR_Incendiary_Grenade_desc_additional = {
        en = "{vendor_purchased} {vendor_any} {vendor_at_level} 9 {vendor_higter}.",
        fr = "{vendor_purchased} {vendor_any} {vendor_at_level} 9 {vendor_higter}.",
    },
    EMP_Grenade_desc = {
        en = "{vendor_open_world}",
        fr = "{vendor_open_world}",
    },
    EMP_Grenade_desc_additional = {
        en = "{vendor_purchased} {vendor_from} {vendor_any}",
        fr = "{vendor_purchased} {vendor_from} {vendor_any}",
    },
    GASH_Antipersonnel_Grenade_desc = {
        en = "{vendor_at_level} 33 {vendor_higter} {vendor_from}:\n{vendor_Japantown}\n{vendor_Downtown}\n{vendor_Red_Peaks}\nPhantom Liberty Sophia Dupont {vendor_stade}",
        fr = "{vendor_at_level} 33 {vendor_higter} {vendor_from}:\n{vendor_Japantown}\n{vendor_Downtown}\n{vendor_Red_Peaks}\nPhantom Liberty Sophia Dupont {vendor_stade}",
    },
    Recon_Grenade_desc = {
        en = "{vendor_open_world}",
        fr = "{vendor_open_world}",
    },
    Recon_Grenade_desc_additional = {
        en = "{vendor_purchased} {vendor_any} {vendor_at_level} 9 {vendor_higter}",
        fr = "{vendor_purchased} {vendor_any} {vendor_at_level} 9 {vendor_higter}",
    },
    Smoke_Grenade_desc = {
        en = "{vendor_purchased} {vendor_weapons}",
        fr = "{vendor_purchased} {vendor_weapons}",
    },
    ["X-22_Flashbang_Grenade_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_weapons}",
        fr = "{vendor_purchased} {vendor_from} {vendor_weapons}",
    },
    AGAOU_desc = {
        en = "{vendor_Criminal_Activity} Voodoo Boys",
        fr = "{vendor_Criminal_Activity} Voodoo Boys",
    },
    AGAOU_desc_additional = {
        en = "{vendor_dropped} Ayo Zarin.",
        fr = "{vendor_dropped} Ayo Zarin ",
    },
    ["CLAW_X-MOD2_desc"] = {
        en = "{vendor_CLAW_X}",
        fr = "{vendor_CLAW_X}",
    },
    CLAW_desc = {
        en = "Scavengers Hooligan\nTyger Claws Thug",
        fr = "Hooligans charognards\nLe voyou des griffes de Tyger",
    },
    CLAW_desc_additional = {
        en = "{vendor_mele_West_Wind_Estate}\n\n{vendor_craftings}{vendor_mele_West_Wind_Estate}",
        fr = "{vendor_mele_West_Wind_Estate}\n\n{vendor_craftings}{vendor_mele_West_Wind_Estate}",
    },
    TOMAHAWK_desc = {
        en = "{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade}",
        fr = "{vendor_West_Wind_Estate}\nPhantom Liberty Sophia Dupont {vendor_stade}",
    },
    ["CUT-O-MATIC_X-MOD2_desc"] = {
        en = "{vendor_CUT_O_MATIC}",
        fr = "{vendor_CUT_O_MATIC}",
    },
    ["CUT-O-MATIC_desc"] = {
        en = "Wraiths Outlaw\nWraiths Ravager",
        fr = "Les spectres hors-la-loi\nRavageur des spectres",
    },
    ["CUT-O-MATIC_desc_additional"] = {
        en = "{vendor_Northside} {vendor_neon}\n\n{vendor_craftings}{vendor_Northside}",
        fr = "{vendor_Northside} {vendor_neon}\n\n{vendor_craftings}{vendor_Northside}",
    },
    BLACK_UNICORN_desc = {
        en = "{vendor_BLACK_UNICORN}",
        fr = "{vendor_BLACK_UNICORN}",
    },
    BYAKKO_desc = {
        en = "Professional Widow",
        fr = "Professional Widow ",
    },
    BYAKKO_desc_additional = {
        en = "{vendor_v_stash}",
        fr = "{vendor_v_stash}",
    },
    COCKTAIL_STICK_desc = {
        en = "Automatic Love",
        fr = "Automatic Love",
    },
    COCKTAIL_STICK_desc_additional = {
        en = "{vendor_COCKTAIL_STICK}\n\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_COCKTAIL_STICK}\nnPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
    },
    ERRATA_desc = {
        en = "Disasterpiece",
        fr = "Disasterpiece",
    },
    ERRATA_desc_additional = {
        en = "{vendor_ERRATA}\n\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_ERRATA}\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    ["JINCHU-MARU_desc"] = {
        en = "Play It Safe",
        fr = "Play It Safe",
    },
    ["JINCHU-MARU_desc_additional"] = {
        en = "{vendor_looted} {vendor_from} Sandayu Oda. \n\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_looted} {vendor_from} Sandayu Oda. \n\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    SATORI_desc = {
        en = "The Heist",
        fr = "The Heist",
    },
    SATORI_desc_additional = {
        en = "{vendor_SATORI}\n\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_SATORI}\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    SCALPEL_desc = {
        en = "Big in Japan",
        fr = "Big in Japan",
    },
    SCALPEL_desc_additional = {
        en = "{vendor_given_reward}",
        fr = "{vendor_given_reward}",
    },
    TSUMETOGI_desc = {
        en = "Pisces",
        fr = "Pisces",
    },
    TSUMETOGI_desc_additional = {
        en = "{vendor_dropped} Hiromi Sato {vendor_TSUMETOGI}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
        fr = "{vendor_dropped} Hiromi Sato {vendor_TSUMETOGI}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
    },
    KATANA_desc = {
        en = "Arasaka Assassin (Arasaka)\nArasaka Samurai (Arasaka)\nArasaka Special Agent (Arasaka)\nStreet Samurai\nTyger Claws Adept\nTyger Claws Kunoichi",
        fr = "Assassin d'Arasaka (Arasaka)\nSamouraï d'Arasaka (Arasaka)\nAgent spécial d'Arasaka (Arasaka)\nSamouraï des rues\nExpert des griffes de tigre\nGriffes de tigre Kunoichi",
    },
    KATANA_desc_additional = {
        en = "{vendor_purchased} {vendor_mele_Japantown}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings} {vendor_mele_Japantown}",
        fr = "{vendor_purchased} {vendor_mele_Japantown}\nPhantom Liberty Sophia Dupont {vendor_stade} {vendor_military}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings} {vendor_mele_Japantown}",
    },
    ["BLUE_FANG_(NEUROTOXIN_KNIFE)_desc"] = {
        en = "{vendor_mele_Jackson_Plains}",
        fr = "{vendor_mele_Jackson_Plains}",
    },
    ["BUTCHER'S_CLEAVER_desc"] = {
        en = "M'ap Tann Pèlen",
        fr = "M'ap Tann Pèlen",
    },
    ["BUTCHER'S_CLEAVER_desc_additional"] = {
        en = "{vendor_BUTCHER_S}\n\nPhantom Liberty {vendor_purchased} {vendor_from} Herold Lowe {vendor_stade} {vendor_not_looted}",
        fr = "{vendor_BUTCHER_S}\n\nPhantom Liberty {vendor_purchased} {vendor_from} Herold Lowe {vendor_stade} {vendor_not_looted}",
    },
    FANG_desc = {
        en = "Firestarter",
        fr = "Firestarter",
    },
    FANG_desc_additional = {
        en = "{vendor_dropped} Kurt Hansen {vendor_FANG}",
        fr = "{vendor_dropped} Kurt Hansen {vendor_FANG}",
    },
    ["HEADHUNTER_(PUNKNIFE)_desc"] = {
        en = "{vendor_mele_West_Wind_Estate}",
        fr = "{vendor_mele_West_Wind_Estate}",
    },
    NEHAN_desc = {
        en = "The Heist",
        fr = "The Heist",
    },
    NEHAN_desc_additional = {
        en = "{vendor_dropped} Saburo Arasaka. \n\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
        fr = "{vendor_dropped} Saburo Arasaka. \n\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
    },
    STINGER_desc = {
        en = "I'll Fly Away",
        fr = "I'll Fly Away",
    },
    STINGER_desc_additional = {
        en = "{vendor_given} Mitch.",
        fr = "{vendor_given} Mitch .",
    },
    ["CHEF'S_KNIFE_desc"] = {
        en = "{vendor_food}",
        fr = "{vendor_food}",
    },
    KNIFE_desc = {
        en = "Arasaka Guard (Arasaka)",
        fr = "Garde d'Arasaka (Arasaka)",
    },
    KNIFE_desc_additional = {
        en = "{vendor_mele_Jackson_Plains}\n{vendor_mele_West_Wind_Estate}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.",
        fr = "{vendor_mele_Jackson_Plains}\n{vendor_mele_West_Wind_Estate}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.",
    },
    Neurotoxin_Knife_desc = {
        en = "6th Street Recruit (Melee)\n6th Street Soldier (Melee)",
        fr = "Recrue de la 6e rue (mêlée)\nSoldat de la 6e rue (mêlée)",
    },
    Neurotoxin_Knife_desc_additional = {
        en = "{vendor_mele_Jackson_Plains}\n{vendor_mele_West_Wind_Estate}\n\n{vendor_craftings}{vendor_mele_Jackson_Plains}",
        fr = "{vendor_mele_Jackson_Plains}\n{vendor_mele_West_Wind_Estate}\n\n{vendor_craftings}{vendor_mele_Jackson_Plains}",
    },
    PUNKNIFE_desc = {
        en = "Maelstrom Scout\nMaelstrom Zealot\nMerc\nValentinos Guerrero\nValentinos Seasoned Thug\nValentinos Thug",
        fr = "Scout Maelström\nFanatique du Maelström\nMerc\nValentino Guerrero\nLe voyou chevronné de Valentino\nLe voyou de Valentino",
    },
    PUNKNIFE_desc_additional = {
        en = "{vendor_mele_Jackson_Plains}\n{vendor_mele_West_Wind_Estate}\n\n{vendor_craftings}{vendor_mele_West_Wind_Estate}",
        fr = "{vendor_mele_Jackson_Plains}\n{vendor_mele_West_Wind_Estate}\n\n{vendor_craftings}{vendor_mele_West_Wind_Estate}",
    },
    KUKRI_desc = {
        en = "Liberty Just Another Story",
        fr = "Liberty Just Another Story.",
    },
    KUKRI_desc_additional = {
        en = "{vendor_VB_variant}",
        fr = "{vendor_VB_variant}",
    },
    MACHETE_desc = {
        en = "Animals Mauler\nMaelstrom Goon\nMaelstrom Maniac\nMaelstrom Zealot\nMerc\nScavengers Cur\nValentinos Guerrero\nValentinos Matón\nValentinos Seasoned Thug\nValentinos Toro",
        fr = "Mauler des animaux\nGoon du Maelström\nManiaque du Maelström\nFanatique du Maelström\nMerc\nLes charognards Cur\nValentino Guerrero\nValentino Matón",
    },
    RAZOR_desc = {
        en = "Phantom Liberty Sophia Dupont {vendor_stade} {vendor_military}",
        fr = "Phantom Liberty Sophia Dupont {vendor_stade} {vendor_military}",
    },
    VOLKODAV_desc = {
        en = "Gig: Waiting for Dodger",
        fr = "Gig: Waiting for Dodger",
    },
    VOLKODAV_desc_additional = {
        en = "{vendor_police_station}\n\nPhantom Liberty {vendor_purchased} {vendor_from} Herold Lowe {vendor_stade} {vendor_not_looted}",
        fr = "{vendor_police_station}\n\nPhantom Liberty {vendor_purchased} {vendor_from} Herold Lowe {vendor_stade} {vendor_not_looted}",
    },
    GWYNBLEIDD_desc = {
        en = "{vendor_GWYNBLEIDD}",
        fr = "{vendor_GWYNBLEIDD}",
    },
    ["CARETAKER'S_SPADE_desc"] = {
        en = "Knockin' on Heaven's Door ",
        fr = "Knockin' on Heaven's Door",
    },
    ["CARETAKER'S_SPADE_desc_additional"] = {
        en = "{vendor_CARETAKER}",
        fr = "{vendor_CARETAKER}",
    },
    ["SASQUATCH'S_HAMMER_desc"] = {
        en = "I Walk the Line",
        fr = "I Walk the Line",
    },
    ["SASQUATCH'S_HAMMER_desc_additional"] = {
        en = "{vendor_SASQUATCH}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
        fr = "{vendor_SASQUATCH}\n\nPhantom Liberty - {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}",
    },
    HAMMER_desc = {
        en = "Animals Mauler\nAnimals Undertaker",
        fr = "Mauler des animaux\nPompes funèbres pour animaux",
    },
    HAMMER_desc_additional = {
        en = "{vendor_mele_rancho}\n\n{vendor_craftings} {vendor_mele_rancho}",
        fr = "{vendor_mele_rancho}\n\n{vendor_craftings} {vendor_mele_rancho}",
    },
    BFC_9000_desc = {
        en = "{vendor_BFC}",
        fr = "{vendor_BFC}",
    },
    BFC_9000_desc_additional = {
        en = "Phantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "Phantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    COTTONMOUTH_desc = {
        en = "The Space in Between",
        fr = "The Space in Between",
    },
    COTTONMOUTH_desc_additional = {
        en = "{vendor_COTTONMOUTH}",
        fr = "{vendor_COTTONMOUTH}",
    },
    Bunker_CROWBAR_desc = {
        en = "Somewhat Damaged",
        fr = "Somewhat Damaged",
    },
    Bunker_CROWBAR_desc_additional = {
        en = "{vendor_Bunker_CROWBAR}",
        fr = "{vendor_Bunker_CROWBAR}",
    },
    SIR_JOHN_PHALLUSTIFF_desc = {
        en = "Venus in Furs",
        fr = "Venus in Furs",
    },
    SIR_JOHN_PHALLUSTIFF_desc_additional = {
        en = "{vendor_SIR_JOHN}\n\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_SIR_JOHN}\n\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    TINKER_BELL_desc = {
        en = "The Hunt",
        fr = "The Hunt",
    },
    TINKER_BELL_desc_additional = {
        en = "{vendor_TINKER}\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
        fr = "{vendor_TINKER}\nPhantom Liberty {vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}.",
    },
    Crowbar_desc = {
        en = "6th Street Recruit (Melee)\nMaelstrom Scout\nScavengers Hooligan\nScavengers Thug\nTyger Claws Thug\nWraiths Outlaw\nWraiths Ravager",
        fr = "Recrue de la 6e rue (mêlée)\nScout Maelström\nHooligans charognards\nLes charognards voyous\nLe voyou des griffes de Tyger\nLes spectres hors-la-loi\nRavageur des spectres",
    },
    STEEL_PIPE_desc = {
        en = "6th Street Recruit (Melee)\nMaelstrom Scout\nScavengers Hooligan\nScavengers Thug\nTyger Claws Thug\nWraiths Outlaw\nWraiths Ravager",
        fr = "Recrue de la 6e rue (mêlée)\nScout Maelström\nHooligans charognards\nLes charognards voyous\nLe voyou des griffes de Tyger\nLes spectres hors-la-loi\nRavageur des spectres",
    },
    TIRE_IRON_desc = {
        en = "6th Street Recruit (Melee)\nMaelstrom Scout\nScavengers Hooligan\nScavengers Thug\nTyger Claws Thug\nWraiths Outlaw\nWraiths Ravager",
        fr = "Recrue de la 6e rue (mêlée)\nScout Maelström\nHooligans charognards\nLes charognards voyous\nLe voyou des griffes de Tyger\nLes spectres hors-la-loi\nRavageur des spectres",
    },
    BABY_BOOMER_desc = {
        en = "Dazed and Confused",
        fr = "Dazed and Confused",
    },
    BABY_BOOMER_desc_additional = {
        en = "{vendor_only_obtained} {vendor_BABY}",
        fr = "{vendor_only_obtained} {vendor_BABY}",
    },
    ["BASEBALL_BAT_X-MOD2_desc"] = {
        en = "{vendor_BASEBALL}",
        fr = "{vendor_BASEBALL}",
    },
    GOLD_PLATED_BASEBALL_BAT_desc = {
        en = "Second Conflict",
        fr = "Second Conflict",
    },
    GOLD_PLATED_BASEBALL_BAT_desc_additional = {
        en = "{vendor_GOLD_PLATED}",
        fr = "{vendor_GOLD_PLATED}",
    },
    ["MURPHY'S_LAW_desc"] = {
        en = "Firestarter",
        fr = "Firestarter",
    },
    ["MURPHY'S_LAW_desc_additional"] = {
        en = "{vendor_looted} Albert Murphy ({vendor_MURPHY}). \n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}. {vendor_conditions}",
        fr = "{vendor_looted} Albert Murphy ({vendor_MURPHY}). \n{vendor_purchased} Herold Lowe {vendor_stade} {vendor_not_looted}. {vendor_conditions}",
    },
    BASEBALL_BAT_desc = {
        en = "6th Street Soldier (Melee)\nAnimals Bouncer\nTyger Claws Hunter\nTyger Claws Thug\nValentinos Thug\nVoodoo Boys Spirit\nWraiths Skewer",
        fr = "Soldat de la 6e rue (mêlée)\nAnimaux sauteurs\nChasseur de griffes de tigre\nLe voyou des griffes de Tyger\nLe voyou de Valentino\nL'esprit des garçons vaudous\nBrochette de spectres",
    },
    BASEBALL_BAT_desc_additional = {
        en = "Coach Fred {vendor_in_LT}\n{vendor_mele_rancho}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings} Coach Fred {vendor_in_LT}",
        fr = "Coach Fred {vendor_in_LT}\n{vendor_mele_rancho}\n\n{vendor_tier} 1 {vendor_craftings}{vendor_default}.\n\n{vendor_craftings} Coach Fred {vendor_in_LT}",
    },
    KANABO_desc = {
        en = "Arasaka Bodyguard (Arasaka)\nTyger Claws Fang\nTyger Claws Ozeki",
        fr = "Garde du corps d'Arasaka (Arasaka)\nCrocs de griffes de tigre\nOzeki Griffes de tigre",
    },
    KANABO_desc_additional = {
        en = "Coach Fred {vendor_in_LT}\nPhantom Liberty Sophia Dupont {vendor_stade}",
        fr = "Coach Fred {vendor_in_LT}\nPhantom Liberty Sophia Dupont {vendor_stade}",
    },
    BIG_MAG_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
    },
    FOCUS_FIRE_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_wweapons}\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_wweapons}\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}",
    },
    READY_STEADY_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_wweapons}\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_wweapons}\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops} ",
    },
    BLEEDOUT_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
    },
    HAEMOCIDE_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_looted} Wesley Hunt",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_looted} Wesley Hunt",
    },
    ["SLICE_'EM_UP_desc"] = {
        en = "{vendor_rarely} {vendor_from} {vendor_any_melee} {vendor_at_level} 50 {vendor_higter}.",
        fr = "{vendor_rarely} {vendor_from} {vendor_any_melee} {vendor_at_level} 50 {vendor_higter}.",
    },
    BARBARIAN_desc = {
        en = "{vendor_rarely} {vendor_from} {vendor_any_melee} {vendor_at_level} 40 {vendor_higter}",
        fr = "{vendor_rarely} {vendor_from} {vendor_any_melee} {vendor_at_level} 40 {vendor_higter}",
    },
    BLOODBRUISER_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
    },
    ["K.O._desc"] = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
    },
    AIRSTRIKE_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
    },
    CYCLONE_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
    },
    SEVERANCE_desc = {
        en = "{vendor_craft_chimera}",
        fr = "{vendor_craft_chimera}",
    },
    SILENCIO_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
    },
    ["RC-7_ASWANG_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30.",
    },
    ["RC-7_IFRIT_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    ["RC-7_STRIGOI_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ["RC-7_VARKOLAK_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_rarity_increases} 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_rarity_increases}10 {vendor_tier}",
    },
    ["RC-7_ZAAR_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons}. {vendor_rarity_increases} 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    ["RC-7_BABAROGA_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons}. {vendor_rarity_increases} 10 {vendor_tier}.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons}. {vendor_rarity_increases} 10 {vendor_tier}.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}.",
    },
    ["RC-7_DYBBUK_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons}. {vendor_rarity_increases} 10 {vendor_tier}.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons}. {vendor_rarity_increases} 10 {vendor_tier}.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}.",
    },
    ["RC-7_KUTRUB_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ["RC-7_LIGER_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30",
    },
    ["RC-7_YOKAI_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    PARALLAX_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}",
    },
    PINPOINT_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
    },
    ZENITH_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}",
    },
    CRITOCHET_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
    },
    FIRECRACKER_desc = {
        en = "{vendor_craft_chimera}",
        fr = "{vendor_craft_chimera}",
    },
    PYRO_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
    },
    SWISS_CHEESE_desc = {
        en = "{vendor_looted} {vendor_containers}.\n\n{vendor_rarely} {vendor_from} {vendor_Glen}",
        fr = "{vendor_looted} {vendor_containers}.\n\n{vendor_rarely} {vendor_from} {vendor_Glen}",
    },
    ["CLEARVUE_MK.8_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20",
    },
    E255_PERCIPIENT_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1.",
    },
    ["GRANDSTAND_MK.2X_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1",
    },
    JUE_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}",
    },
    ["KAIRO_SA-1_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1",
    },
    ["SO-21_SAIKA_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}.",
    },
    ["ADD-VANTAGE_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1",
    },
    ["CQO_KANONE_MINI_MK.72_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20.",
    },
    HANDYMAN_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1.\n\nPhantom Liberty A {vendor_tier} 5 {vendor_looted} {vendor_Airdrops} or enemies.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1.\n\nPhantom Liberty A {vendor_tier} 5 {vendor_looted} {vendor_Airdrops} or enemies.",
    },
    HYAKUME_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 20.",
    },
    KANETSUGU_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30.",
    },
    ["OS-1_GIMLETEYE_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1.\n\nPhantom Liberty {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 1.\n\nPhantom Liberty {vendor_contained} {vendor_Airdrops}.",
    },
    TYPE_2067_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30",
    },
    E305_PROSPECTA_desc = {
        en = "{vendor_E305}",
        fr = "{vendor_E305}",
    },
    GAKI_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_at_level} 30.\n\nPhantom Liberty {vendor_tier} 5 {vendor_contained} {vendor_Airdrops}.",
    },
    ["HPO_KANONE_MAX_MK.77_desc"] = {
        en = "{vendor_E305}",
        fr = "{vendor_E305}",
    },
    CONDENSER_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
    },
    ["KNEEL!_desc"] = {
        en = "{vendor_rarely} {vendor_from} {vendor_any} {vendor_at_level} 50 {vendor_higter}.",
        fr = "{vendor_rarely} {vendor_from} {vendor_any} {vendor_at_level} 50 {vendor_higter}.",
    },
    VIVISECTOR_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}",
    },
    ["CS-1_TAIPAN_desc"] = {
        en = "{vendor_purchased} {vendor_wweapons}",
        fr = "{vendor_purchased} {vendor_wweapons}",
    },
    TSX_TOCORORO_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_reaching_lvl} 20",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_reaching_lvl} 20",
    },
    ["XC-10_CETUS_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_reaching_lvl} 30.\n\nPhantom Liberty {vendor_tier} 5 {vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_reaching_lvl} 30.\n\nPhantom Liberty {vendor_tier} 5 {vendor_looted} {vendor_Airdrops}.",
    },
    ["XC-10_STRIX_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_reaching_lvl} 20",
        fr = "{vendor_purchased} {vendor_from} {vendor_wweapons} {vendor_reaching_lvl} 20",
    },
    GAMBITEER_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.",
    },
    HACKATOMY_desc = {
        en = "{vendor_craft_chimera}",
        fr = "{vendor_craft_chimera}",
    },
    HEADHOPPER_desc = {
        en = "{vendor_rarely} {vendor_from} {vendor_any} {vendor_at_level} 40 {vendor_higter}.\n\n{vendor_netwatch} {vendor_at_level} 40 {vendor_higter}.\n\nPhantom Liberty {vendor_tier} 4 {vendor_dropped} 1R-0NC-LAD {vendor_LAD}",
        fr = "{vendor_rarely} {vendor_from} {vendor_any} {vendor_at_level} 40 {vendor_higter}.\n\n{vendor_netwatch} {vendor_at_level} 40 {vendor_higter}.\n\nPhantom Liberty {vendor_tier} 4 {vendor_dropped} 1R-0NC-LAD {vendor_LAD}",
    },
    PANORAMA_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}",
    },
    FLEETSHOT_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}",
    },
    HEADTOLL_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
    },
    STABILIZER_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}",
    },
    ["C-THRU_desc"] = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
    },
    SPINETICKLER_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}",
    },
    SUPERCHARGER_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.",
    },
    WALLPUNCHER_desc = {
        en = "{vendor_craft_chimera}",
        fr = "{vendor_craft_chimera}",
    },
    BOOMERANG_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_looted} Maggie Isley.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_looted} Maggie Isley.",
    },
    JAVELIN_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_melee_weapons}",
    },
    ["ZERO-G_desc"] = {
        en = "{vendor_rarely} {vendor_from}:\n{vendor_mele_Jackson_Plains}\n{vendor_mele_West_Wind_Estate}",
        fr = "{vendor_rarely} {vendor_from}:\n{vendor_mele_Jackson_Plains}\n{vendor_mele_West_Wind_Estate}",
    },
    PAX_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
    },
    BETTER_HALF_desc = {
        en = "{vendor_rarely} {vendor_from} {vendor_any} {vendor_at_level} 40 {vendor_higter}.\n\nPhantom Liberty {vendor_tier} 4 {vendor_dropped} 1R-0NC-LAD {vendor_LAD}",
        fr = "{vendor_rarely} {vendor_from} {vendor_any} {vendor_at_level} 40 {vendor_higter}.\n\nPhantom Liberty {vendor_tier} 4 {vendor_dropped} 1R-0NC-LAD {vendor_LAD}",
    },
    EQUALIZER_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.\n\nPhantom Liberty {vendor_tier} 3 {vendor_higter} {vendor_contained} {vendor_Airdrops}.",
    },
    SHUFFLER_desc = {
        en = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.",
        fr = "{vendor_tier13} {vendor_be_present} {vendor_from} {vendor_wweapons}.",
    },
    CONTAGION_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    OVERHEAT_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "Quickhack et {vendor_craftings}peuvent être achetés auprès de Netrunners .\nPhantom Liberty La variante emblématique peut être achetée auprès de Sammy Taylor au stade EBM Petrochem , Dogtown .",
    },
    SHORT_CIRCUIT_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    SYNAPSE_BURNOUT_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    CRIPPLE_MOVEMENT_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    CYBERWARE_MALFUNCTION_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    REBOOT_OPTICS_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    WEAPON_GLITCH_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    BAIT_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    MEMORY_WIPE_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    PING_desc = {
        en = "The Gift - {vendor_tier} 1 {vendor_given} Yoko Tsuru.\n\n{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "Le Cadeau - {vendor_tier} 1 {vendor_given} Yoko Tsuru.\nQ{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    REQUEST_BACKUP_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    SONIC_SHOCK_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    Blacwall_Gateway_desc = {
        en = "This quickhack comes pre-installed on the Militech Canto Mk.6, or it can be automatically inflicted on non-boss Enemies at low health {vendor_from} hits by the Midnight Arms Erebus.",
        fr = "Ce hack rapide est préinstallé sur le Militech Canto Mk.6 , ou il peut être automatiquement infligé aux ennemis non-boss à faible santé suite aux coups du Midnight Arms Erebus .",
    },
    CYBERPSYCHOSIS_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    DETONATE_GRENADE_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    SUICIDE_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    SYSTEM_COLLAPSE_desc = {
        en = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
        fr = "{vendor_Quickhack} {vendor_and} {vendor_craftings} {vendor_purchased} {vendor_Netrunners}.\n\nPhantom Liberty {vendor_iconic_variant} {vendor_purchased} Sammy Taylor {vendor_stade}.",
    },
    ELECTRIFYING_GORILLA_ARMS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    ELECTRIFYING_MANTIS_BLADES_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ELECTRIFYING_MONOWIRE_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    LECTRIFYING_PROJECTILE_LAUNCH_SYSTEM_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    GORILLA_ARMS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    MANTIS_BLADES_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    MAXTAC_MANTIS_BLADES_desc = {
        en = "Mission:Bullets - \n{vendor_MAXTAC_MANTIS}",
        fr = "Mission:Bullets - \n{vendor_MAXTAC_MANTIS}",
    },
    MONOWIRE_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}, {vendor_up_to} {vendor_tier} 5.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}, {vendor_up_to} {vendor_tier} 5.",
    },
    PROJECTILE_LAUNCH_SYSTEM_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    THERMAL_GORILLA_ARMS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    THERMAL_MANTIS_BLADES_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    THERMAL_MONOWIRE_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    THERMAL_PROJECTILE_LAUNCH_SYSTEM_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    TOXIC_GORILLA_ARMS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}",
    },
    TOXIC_MANTIS_BLADES_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    TOXIC_MONOWIRE_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    TOXIC_PROJECTILE_LAUNCH_SYSTEM_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ADRENALINE_BOOSTER_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    BIOMONITOR_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    BLACK_MAMBA_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    BLOOD_PUMP_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    CLUTCH_PADDING_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10 {vendor_tier}.",
    },
    ELECTROMAG_RECYCLER_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    FEEDBACK_CIRCUIT_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ["HEAL-ON-KILL_desc"] = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ISOMETRIC_STABILIZER_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}\n\n{vendor_looted} {vendor_Airdrops}",
    },
    MICROROTORS_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    SECOND_HEART_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    THREATEVAC_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    BASIC_KIROSHI_OPTICS_desc = {
        en = "{vendor_Obtained_during} The Ripperdoc\n\n{vendor_purchased} {vendor_any_ripperdoc} {vendor_NC}",
        fr = "{vendor_Obtained_during} The Ripperdoc\n\n{vendor_purchased} {vendor_any_ripperdoc} {vendor_NC}",
    },
    KIROSHI_CLAIRVOYANT_OPTICS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20 {vendor_higter}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20 {vendor_higter}",
    },
    KIROSHI_COCKATRICE_OPTICS_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} in Dogtown {vendor_at_level} 35 {vendor_higter}.\n\n{vendor_looted} {vendor_Airdrops}",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} in Dogtown {vendor_at_level} 35 {vendor_higter}.\n\n{vendor_looted} {vendor_Airdrops}",
    },
    KIROSHI_DOOMSAYER_OPTICS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}.",
    },
    KIROSHI_SENTRY_OPTICS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}.",
    },
    KIROSHI_STALKER_OPTICS_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}.",
    },
    ["BEHAVIORAL_IMPRINT-SYNCED_FACEPLATE_desc"] = {
        en = "Mission: Birds with Broken Wings - {vendor_Installed_by} Farida Nazeri.",
        fr = "Mission: Birds with Broken Wings - {vendor_Installed_by} Farida Nazeri.",
    },
    Newton_Module_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_clinic_heywood}\n\n{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_watson}",
        fr = "{vendor_purchased} {vendor_from} {vendor_clinic_heywood}\n\n{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_watson}",
    },
    ["KERENZIKOV BOOST SYSTEM"] = {
        en = "{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_watson}\n\n{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_heywood}",
        fr = "{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_watson}\n\n{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_heywood}",
    },
    ZETATECH_SANDEVISTAN = {
        en = "{vendor_tier} 5 {vendor_ZETATECH_SANDEVISTAN}\n\n{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_watson}",
        fr = "{vendor_tier} 5 {vendor_ZETATECH_SANDEVISTAN}\n\n{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_watson}",
    },
    RAVEN_MICROCYBER_MK3 = {
        en = "{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_dr_chrome}\n\n{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_watson}",
        fr = "{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_dr_chrome}\n\n{vendor_tier} 5 {vendor_purchased} {vendor_from} {vendor_clinic_watson}",
    },
    KIROSHI_THE_ORACLE_OPTICS_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 30. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 30. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    AXOLOTL_desc = {
        en = "Last Call - {vendor_given} Regina Jones.\n\n{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "Last Call - {vendor_given} Regina Jones.\n\n{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    BIOCONDUCTOR_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    CAMILLO_RAM_MANAGER_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}, {vendor_lvl} 30.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}, {vendor_lvl} 30.",
    },
    ["COX-2_CYBERSOMATIC_OPTIMIZER_desc"] = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    ["EX-DISK_desc"] = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 20.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 20.",
    },
    MECHATRONIC_CORE_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    MEMORY_BOOST_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 5.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 5.",
    },
    QUANTUM_TUNER_desc = {
        en = "{vendor_from} Her to Eternity - {vendor_hidden}",
        fr = "{vendor_from} Her to Eternity - {vendor_hidden}",
    },
    RAM_REALLOCATOR_desc = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    RAM_UPGRADE_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ["SELF-ICE_desc"] = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 20.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 20",
    },
    BALLISTIC_COPROCESSOR_desc = {
        en = "{vendor_Obtained_during} The Ripperdoc.\n\n{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_Obtained_during} The Ripperdoc.\n\n{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    HANDLE_WRAP_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    IMMOVABLE_FORCE_desc = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 10.\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 10.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    MICROGENERATOR_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
    },
    SHOCK_ABSORBER_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    SMART_LINK_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ["TATTOO:_JOHNNY'S_SPECIAL_desc"] = {
        en = "{vendor_Obtained_during} \"Chippin' In\" {vendor_if}",
        fr = "{vendor_Obtained_during} \"Chippin' In\" {vendor_if}",
    },
    ["TATTOO:_TOGETHER_FOREVER_desc"] = {
        en = "{vendor_Obtained_during} \"Chippin' In\" {vendor_if}",
        fr = "{vendor_Obtained_during} \"Chippin' In\" {vendor_if}",
    },
    ["TATTOO:_TYGER_CLAWS_DERMAL_IMPRINT_desc"] = {
        en = "The Gig - {vendor_Ryder}",
        fr = "The Gig - {vendor_Ryder}",
    },
    CARAPACE_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    CELLULAR_ADAPTER_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    CHITIN_desc = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    COGITO_LATTICE_desc = {
        en = "{vendor_MALORIAN_ARMS_3516} {vendor_any_ripperdoc}.",
        fr = "{vendor_MALORIAN_ARMS_3516} {vendor_any_ripperdoc}.",
    },
    COUNTERSHELL_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    DEFENZIKOV_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ["NANO-PLATING_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    OPTICAL_CAMO_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    PAIN_EDITOR_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 30. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 30. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    PAINDUCER_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 30. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_at_level} 30. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    PERIPHERAL_INVERSE_desc = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}. ",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    PROXISHIELD_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    RANGEGUARD_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    ["SHOCK-N-AWE_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    SUBDERMAL_ARMOR_desc = {
        en = "{vendor_Obtained_during} The Ripperdoc.\n\n{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_Obtained_during} The Ripperdoc.\n\n{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs}. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    FORTIFIED_ANKLES_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
    },
    ["JENKINS'_TENDONS_desc"] = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
    },
    LEEROY_LIGAMENT_SYSTEM_desc = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    LYNX_PAWS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
    },
    REINFORCED_TENDONS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
    },
    ADRENALINE_CONVERTER_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    ["ADRENO-TRIGGER_desc"] = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}. ",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    ATOMIC_SENSORS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    ["DEEP-FIELD_VISUAL_INTERFACE_desc"] = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}. ",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    KERENZIKOV_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    NEOFIBER_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    REFLEX_TUNER_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    REVULSOR_desc = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    STABBER_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_tier} increases every 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_tier} increases every 10 {vendor_tier}.",
    },
    SYNAPTIC_ACCELERATOR_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    TYROSINE_INJECTOR_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    VISUAL_CORTEX_SUPPORT_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    ["ARASAKA_MK.1_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_any_ripperdoc}.",
        fr = "{vendor_purchased} {vendor_from} {vendor_any_ripperdoc}.",
    },
    BIODYNE_BERSERK_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10.",
    },
    ["BIOTECH_Σ_MK.1_desc"] = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 10.",
    },
    CHROME_COMPRESSOR_desc = {
        en = "Psycho Killer {vendor_awward}.\n\n{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "Psycho Killer {vendor_awward}.\n\n{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    DYNALAR_SANDEVISTAN_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10. {vendor_tier} increases every 10 {vendor_tier}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10. {vendor_tier} increases every 10 {vendor_tier}",
    },
    MILITECH_APOGEE_SANDEVISTAN_desc = {
        en = "{vendor_tier} 5 {vendor_purchased} for $118000 {vendor_from} {vendor_any_ripperdoc} {vendor_reaching_lvl} 40.",
        fr = "{vendor_tier} 5 {vendor_purchased} for $118000 {vendor_from} {vendor_any_ripperdoc} {vendor_reaching_lvl} 40.",
    },
    MILITECH_FALCON_SANDEVISTAN_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 30. {vendor_rarity_increases} 10 {vendor_tier}\n\nBlack Steel In The Hour of Chaos {vendor_given_falcon}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 30. {vendor_rarity_increases} 10 {vendor_tier}\n\nBlack Steel In The Hour of Chaos {vendor_given_falcon}",
    },
    MILITECH_BERSERK_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 30.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 30.",
    },
    ["MILITECH_CANTO_MK.6_desc"] = {
        en = "Somewhat Damaged - {vendor_craftings} {vendor_MILITECH_CANTO_MK_6}",
        fr = "Somewhat Damaged - {vendor_craftings} {vendor_MILITECH_CANTO_MK_6}",
    },
    ["MILITECH_PARALINE_MK.1_desc"] = {
        en = "The Rescue - {vendor_auto_installed}",
        fr = "The Rescue - {vendor_auto_installed}",
    },
    MOORE_TECH_BERSERK_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_reaching_lvl} 10.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_reaching_lvl} 10.",
    },
    ["NETWATCH_NETDRIVER_MK.1_desc"] = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_reaching_lvl} 40.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_reaching_lvl} 40",
    },
    QIANT_WARP_DANCER_SANDEVISTAN_desc = {
        en = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_reaching_lvl} 20.",
        fr = "{vendor_purchased} {vendor_from} {vendor_Dogtown_Ripperdocs} {vendor_reaching_lvl} 20",
    },
    ["TETRATRONIC_RIPPLER_MK.1_desc"] = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}.",
    },
    ZETATECH_BERSERK_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 30",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_reaching_lvl} 30",
    },
    BIONIC_JOINTS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    DENSE_MARROW_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 10.",
    },
    EPIMORPHIC_SKELETON_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 30.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}, {vendor_lvl} 30.",
    },
    ["FEEN-X_desc"] = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}",
    },
    KINETIC_FRAME_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    PARA_BELLUM_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 20. {vendor_rarity_increases} 10 {vendor_tier}.",
    },
    RAM_RECOUP_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    RARA_AVIS_desc = {
        en = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
        fr = "{vendor_purchased} {vendor_Dogtown_Ripperdocs}.\n\n{vendor_looted} {vendor_Airdrops}.",
    },
    SCAR_COALESCER_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    SCARAB_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    SPRING_JOINTS_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc} {vendor_at_level} 10. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    TITANIUM_BONES_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 10 {vendor_tier}",
    },
    UNIVERSAL_BOOSTER_desc = {
        en = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 5 {vendor_tier}.",
        fr = "{vendor_purchased} {vendor_any_ripperdoc}. {vendor_rarity_increases} 5 {vendor_tier}.",
    },
    Agent_HEADGEAR = {
        en = "{vendor_Agent_HEADGEAR}",
        fr = "{vendor_Agent_HEADGEAR}",
    },
    ["JOHNNY'S_AVIATORS"] = {
        en = "{vendor_mission_reward}A Cool Metal Fire \n{vendor_auto_obtained}",
        fr = "{vendor_mission_reward}A Cool Metal Fire \n{vendor_auto_obtained}",
    },
    SAMURAI_JACKET = {
        en = "{vendor_mission_reward}\nChippin' In\n{vendor_given} Rogue {vendor_quest_start}",
        fr = "{vendor_mission_reward}\nChippin' In\n{vendor_given} Rogue {vendor_quest_start}",
    },
    ["JOHNNY'S_SHOES"] = {
        en = "{vendor_mission}\nGig: Family Heirloom \n{vendor_bootleg}",
        fr = "{vendor_mission}\nGig: Family Heirloom \n{vendor_bootleg}.",
    },
    ["JOHNNY'S_PANTS"] = {
        en = "{vendor_mission}\nGig: Psychofan\n{vendor_bedroom}",
        fr = "{vendor_mission}\nGig: Psychofan\n{vendor_bedroom}",
    },
    ["JOHNNY'S_TANK_TOP"] = {
        en = "{vendor_mission_reward}\nTapeworm\n{vendor_after} Search and Destroy.",
        fr = "{vendor_mission_reward}\nTapeworm\n{vendor_after} Search and Destroy.",
    },
    OFFICE_BLAZER = {
        en = "{vendor_mission_reward}\nThe Corpo-Rat \n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Corpo-Rat \n{vendor_auto_obtained}, {vendor_stash}",
    },
    OFFICE_SLACKS = {
        en = "{vendor_mission_reward}\nThe Corpo-Rat \n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Corpo-Rat \n{vendor_auto_obtained}, {vendor_stash}",
    },
    OFFICE_PUMPS = {
        en = "{vendor_mission_reward}\nThe Corpo-Rat \n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Corpo-Rat \n{vendor_auto_obtained}, {vendor_stash}",
    },
    VEST_WITH_PATCH = {
        en = "{vendor_mission}\nThe Nomad\n{vendor_mirror}",
        fr = "{vendor_mission}\nThe Nomad\n{vendor_mirror}",
    },
    VEST_WITHOUT_PATCH = {
        en = "{vendor_mission_reward}\nThe Nomad\n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Nomad\n{vendor_auto_obtained}, {vendor_stash}",
    },
    TATTERED_CROP_TOP = {
        en = "{vendor_mission_reward}\nThe Nomad\n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Nomad\n{vendor_auto_obtained}, {vendor_stash}",
    },
    NOMAD_PANTS = {
        en = "{vendor_mission_reward}\nThe Nomad\n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Nomad\n{vendor_auto_obtained}, {vendor_stash}",
    },
    NOMAD_SHOES = {
        en = "{vendor_mission_reward}\nThe Nomad\n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Nomad\n{vendor_auto_obtained}, {vendor_stash}",
    },
    TATTERED_CROP_TOP_street = {
        en = "{vendor_mission_reward}\nThe Streetkid\n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Streetkid\n{vendor_auto_obtained}, {vendor_stash}",
    },
    SREETWEAR_PANTS = {
        en = "{vendor_mission_reward}\nThe Streetkid\n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Streetkid\n{vendor_auto_obtained}, {vendor_stash}",
    },
    STREET_TONGUES = {
        en = "{vendor_mission_reward}\nThe Streetkid\n{vendor_auto_obtained}, {vendor_stash}",
        fr = "{vendor_mission_reward}\nThe Streetkid\n{vendor_auto_obtained}, {vendor_stash}",
    },
    FAVORITE_TOP_The_Rescue = {
        en = "{vendor_mission}\nThe Rescue \n{vendor_auto_obtained}",
        fr = "{vendor_mission}\nThe Rescue \n{vendor_auto_obtained}",
    },
    PANTS_The_Rescue = {
        en = "{vendor_mission}\nThe Rescue \n{vendor_auto_obtained}",
        fr = "{vendor_mission}\nThe Rescue \n{vendor_auto_obtained}",
    },
    SNEAKERS_The_Rescue = {
        en = "{vendor_mission}\nThe Rescue \n{vendor_auto_obtained}",
        fr = "{vendor_mission}\nThe Rescue \n{vendor_auto_obtained}",
    },
    yorinubo_COAT = {
        en = "{vendor_yorinobu}",
        fr = "{vendor_yorinobu}.",
    },
    yorinubo_SHIRT = {
        en = "{vendor_yorinobu}",
        fr = "{vendor_yorinobu}",
    },
    yorinubo_SLACKS = {
        en = "{vendor_yorinobu}",
        fr = "{vendor_yorinobu}",
    },
    maxTac_HELMET = {
        en = "{vendor_judy}",
        fr = "{vendor_judy}",
    },
    maxTac_JACKET = {
        en = "{vendor_judy}",
        fr = "{vendor_judy}",
    },
    maxTac_PANTS = {
        en = "{vendor_judy}",
        fr = "{vendor_judy}",
    },
    Agent_JACKET = {
        en = "{vendor_agent}",
        fr = "{vendor_agent}",
    },
    Agent_PANTS = {
        en = "{vendor_agent}",
        fr = "{vendor_agent}",
    },
    Agent_BOOTS = {
        en = "{vendor_agent}",
        fr = "{vendor_agent}",
    },
    the_Star_JACKET = {
        en = "{vendor_mission_reward}\nWe Gotta Live Together\n{vendor_given} Panam {vendor_the_star}",
        fr = "{vendor_mission_reward}\nWe Gotta Live Together\n{vendor_given} Panam {vendor_the_star}",
    },
    the_Star_TOP = {
        en = "{vendor_mission}\nAll Along the Watchtower\n{vendor_auto_equiped}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nAll Along the Watchtower\n{vendor_auto_equiped}\n\n{vendor_not_kept}",
    },
    the_Star_LEGGINGS = {
        en = "{vendor_mission}\nAll Along the Watchtower\n{vendor_auto_equiped}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nAll Along the Watchtower\n{vendor_auto_equiped}\n\n{vendor_not_kept}",
    },
    the_Star_SNEAKERS = {
        en = "{vendor_mission}\nAll Along the Watchtower\n{vendor_auto_equiped}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nAll Along the Watchtower\n{vendor_auto_equiped}\n\n{vendor_not_kept}",
    },
    the_Sun_AVIATORS = {
        en = "{vendor_mission}\nPath of Glory\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nPath of Glory\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
    },
    the_Sun_SHIRT = {
        en = "{vendor_mission}\nPath of Glory\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nPath of Glory\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
    },
    the_Sun_LEGGINGS = {
        en = "{vendor_mission}\nPath of Glory\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nPath of Glory\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
    },
    the_Sun_BOOTS = {
        en = "{vendor_mission}\nPath of Glory\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nPath of Glory\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
    },
    temperance_SHIRT = {
        en = "{vendor_mission}\nNew Dawn Fades\n{vendor_apart}\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nNew Dawn Fades\n{vendor_apart}\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
    },
    temperance_PANTS = {
        en = "{vendor_mission}\nNew Dawn Fades\n{vendor_apart}\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nNew Dawn Fades\n{vendor_apart}\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
    },
    temperance_BOOTS = {
        en = "{vendor_mission}\nNew Dawn Fades\n{vendor_apart}\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
        fr = "{vendor_mission}\nNew Dawn Fades\n{vendor_apart}\n{vendor_optional}, {vendor_looted}\n\n{vendor_not_kept}",
    },
    cop_BADGE = {
        en = "{vendor_cop_BADGE}",
        fr = "{vendor_cop_BADGE}",
    },
    cop_COAT = {
        en = "{vendor_cop_COAT}.",
        fr = "{vendor_cop_COAT}",
    },
    cop_PANTS = {
        en = "{vendor_cop_PANTS}.",
        fr = "{vendor_cop_PANTS}",
    },
    cop_BOOTS = {
        en = "{vendor_cop_BOOTS}",
        fr = "{vendor_cop_BOOTS}",
    },
    corporate_GLASSES = {
        en = "{vendor_corporate_GLASSES}",
        fr = "{vendor_corporate_GLASSES}",
    },
    corporate_BULLETPROOF = {
        en = "{vendor_corporate_BULLETPROOF}",
        fr = "{vendor_corporate_BULLETPROOF}",
    },
    corporate_SHIRT = {
        en = "{vendor_corporate_SHIRT}",
        fr = "{vendor_corporate_SHIRT}",
    },
    corporate_SLACKS = {
        en = "{vendor_corporate_SLACKS}",
        fr = "{vendor_corporate_SLACKS}",
    },
    corporate_PUMPS = {
        en = "{vendor_corporate_PUMPS}",
        fr = "{vendor_corporate_PUMPS}",
    },
    fixer_GLASSES = {
        en = "{vendor_fixer_GLASSES}",
        fr = "{vendor_fixer_GLASSES}",
    },
    fixer_JACKET = {
        en = "{vendor_fixer_JACKET}",
        fr = "{vendor_fixer_JACKET}",
    },
    fixer_BUSTIER = {
        en = "{vendor_fixer_BUStier}",
        fr = "{vendor_fixer_BUStier}",
    },
    fixer_SKIRT = {
        en = "{vendor_fixer_SKIRT}",
        fr = "{vendor_fixer_SKIRT}",
    },
    fixer_PUMPS = {
        en = "{vendor_fixer_PUMPS}",
        fr = "{vendor_fixer_PUMPS}",
    },
    media_CAP = {
        en = "{vendor_media_CAP}",
        fr = "{vendor_media_CAP}",
    },
    media_ARMORED = {
        en = "{vendor_media_ARMORED}",
        fr = "{vendor_media_ARMORED}",
    },
    media_VEST = {
        en = "{vendor_media_VEST}",
        fr = "{vendor_media_VEST}",
    },
    media_SHIRT = {
        en = "{vendor_media_SHIRT}",
        fr = "{vendor_media_SHIRT}",
    },
    media_PANTS = {
        en = "{vendor_media_PANTS}",
        fr = "{vendor_media_PANTS}",
    },
    media_TOES = {
        en = "{vendor_media_TOES}",
        fr = "{vendor_media_TOES}",
    },
    netrunner_INFOVISOR = {
        en = "{vendor_netrunner_INFOVISOR}",
        fr = "{vendor_netrunner_INFOVISOR}",
    },
    netrunner_SUIT = {
        en = "{vendor_netrunner_SUIT}",
        fr = "{vendor_netrunner_SUIT}",
    },
    netrunner_PANTS = {
        en = "{vendor_netrunner_PANTS}",
        fr = "{vendor_netrunner_PANTS}",
    },
    netrunner_BOOTS = {
        en = "{vendor_netrunner_BOOTS}",
        fr = "{vendor_netrunner_BOOTS}",
    },
    nomad_MASK = {
        en = "{vendor_nomad_MASK}",
        fr = "{vendor_nomad_MASK}",
    },
    nomad_JACKET = {
        en = "{vendor_nomad_JACKET}",
        fr = "{vendor_nomad_JACKET}",
    },
    nomad_SHIRT = {
        en = "{vendor_nomad_SHIRT}",
        fr = "{vendor_nomad_SHIRT}",
    },
    nomad_PANTS = {
        en = "{vendor_nomad_PANTS}",
        fr = "{vendor_nomad_PANTS}",
    },
    nomad_BOOTS = {
        en = "{vendor_nomad_BOOTS}",
        fr = "{vendor_nomad_BOOTS}",
    },
    rocker_AVIATORS = {
        en = "{vendor_rocker_AVIATORS}",
        fr = "{vendor_rocker_AVIATORS}",
    },
    rocker_FOLDTOP = {
        en = "{vendor_rocker_FOLDTOP}",
        fr = "{vendor_rocker_FOLDTOP}",
    },
    rocker_BRA = {
        en = "{vendor_rocker_BRA}",
        fr = "{vendor_rocker_BRA}",
    },
    rocker_PANTS = {
        en = "{vendor_rocker_PANTS}",
        fr = "{vendor_rocker_PANTS}",
    },
    rocker_BOOTS = {
        en = "{vendor_rocker_BOOTS}",
        fr = "{vendor_rocker_BOOTS}",
    },
    solo_SOFTWARE = {
        en = "{vendor_solo_SOFTWARE}",
        fr = "{vendor_solo_SOFTWARE}",
    },
    solo_JACKET = {
        en = "{vendor_solo_JACKET}",
        fr = "{vendor_solo_JACKET}",
    },
    solo_SHIRT = {
        en = "{vendor_solo_SHIRT}",
        fr = "{vendor_solo_SHIRT}",
    },
    solo_PANTS = {
        en = "{vendor_solo_PANTS}",
        fr = "{vendor_solo_PANTS}",
    },
    solo_BOOTS = {
        en = "{vendor_solo_BOOTS}",
        fr = "{vendor_solo_BOOTS}",
    },
    techie_CAP = {
        en = "{vendor_techie_CAP}",
        fr = "{vendor_techie_CAP}",
    },
    techie_OCUSET = {
        en = "{vendor_techie_OCUSET}",
        fr = "{vendor_techie_OCUSET}",
    },
    techie_HARNESS = {
        en = "{vendor_techie_HARNESS}",
        fr = "{vendor_techie_HARNESS}",
    },
    techie_SHIRT = {
        en = "{vendor_mission}\n{vendor_techie_SHIRT}",
        fr = "{vendor_mission}\n{vendor_techie_SHIRT}",
    },
    techie_PANTS = {
        en = "{vendor_techie_PANTS}",
        fr = "{vendor_techie_PANTS}",
    },
    techie_SHOES = {
        en = "{vendor_techie_SHOES}",
        fr = "{vendor_techie_SHOES}",
    },
}

M.vehicle_common_descriptions = {
    acquired_autofixer = {
        en = "Can be acquired from the AUTOFIXER netpage for",
        fr = "Peut être obtenu sur la page Internet d'AUTOFIXER pour un montant de",
    },
    optional_mission = {
        en = "Optional mission reward:",
        fr = "Récompense de mission facultative:",
    },
    mission_reward = {
        en = "Mission Reward:",
        fr = "Récompense de mission:",
    },
    dependent_mission_reward = {
        en = "Dependent Mission Reward:",
        fr = "Récompense pour mission dépendante:",
    },
    nomad = {
        en = "ONLY NOMAD",
        fr = "SEULEMENT NOMAD",
    },
    non_wraith = {
        en = "A non-Wraith version can be acquired from the AUTOFIXER netpage for",
        fr = "Une version non Wraith peut être obtenu sur la page Internet d'AUTOFIXER pour un montant de",
    },
    Free = {
        en = "FREE",
        fr = "GRATUIT",
    },
    Reward = {
        en = "Reward",
        fr = "Recompense",
    },
    just_another_story = {
        en = "after completing Just Another Story 7 times.",
        fr = "après avoir terminé Just Another Story 7 fois.",
    },
    Street_Cred = {
        en = "after reaching 48 Street Cred.",
        fr = "après avoir atteint 48 Street Cred.",
    },
    Tanishi_T400 = {
        en = "Given for free by Mr. Hands after first accessing Dogtown.",
        fr = "Offert gratuitement par M. Hands après le premier accès à Dogtown.",
    },
    Quartz_Bandit = {
        en = "The BandCan be obtained by two different ways depending on the choices made during Ghost Town. \n\n\ttIf V agrees with Panam to go after Nash: \n\t\tCan be acquired from the AUTOFIXER netpage for $69,000. \n\n\tIf V decides not to go after Nash: \n\t\tIt is obtained for free after receiving a message from Rogue Amendiares, who thanks V for their professionalism.",
        fr = "Le Bandit peut être obtenu de deux façons différentes, selon les choix faits pendant Ghost Town. \n\n\tSi V se met d'accord avec Panam pour poursuivre Nash : \n\t\tPeut être obtenu sur la page Internet d'AUTOFIXER pour un montant de 69 000 $. \n\n\tSi V décide de ne pas poursuivre Nash: \n\tIl s'obtient gratuitement après avoir reçu un message de Rogue Amendiares, qui remercie V pour son professionnalisme.",
    },
    ["nazaré_itsumade"] = {
        addionalen = "One Itsumade is rewarded at the end of The Highwayman. The bike is found in a garage in Northside, Watson; right next to the All Foods Plant. Putting the code '0214' in the keypad will give you access to the garage and the bike.",
        addionalfr = "Une Itsumade est récompensée à la fin de The Highwayman. La moto se trouve dans un garage à Northside, Watson; juste à côté de l'usine All Foods. En entrant le code '0214' dans le clavier vous accéderez au garage et à la moto.",
    },
    Jackies_Tuned_Arch = {
        addionalen = "There are two cosmetic variants of Jackie's ARCH, but only one can be obtained per playthrough. If V has the Corpo or Streetkid lifepaths,they can only obtain the standard version{but a Nomad V can potentially obtain a variant called 'Jackie's Tuned ARCH' — when V meets with Jackie outside the All Foods Plant during The Pickup, there is a Nomad-specific dialogue option available in which V can talk to Jackie about his motorcycle.",
        addionalfr = "Il existe deux variantes cosmétiques de l'ARCH de Jackie, mais il n'est possible d'en obtenir qu'une seule par partie. Si V a le profil Corpo ou Streetkid, il ne peut obtenir que la version standard, mais un V Nomade peut potentiellement obtenir une variante appelée 'Jackie's Tuned ARCH' lorsque V rencontre Jackie à l'extérieur de l'usine All Foods pendant le ramassage, il y a une option de dialogue spécifique aux Nomades dans laquelle V peut parler à Jackie de sa moto.",
    },
    malina_mobile = {
        addionalen = "During the BD shoot, one must pick the option to tell Malina to convince Tool that she is his sister. After a few days, Lina Malina will send you a message that you can pick it up in front of the Brainporium.",
        addionalfr = "Pendant le tournage de la BD, il faut choisir l'option de dire à Malina de convaincre Tool qu'elle est sa soeur. Après quelques jours, Lina Malina vous enverra un message vous indiquant que vous pouvez la récupérer devant le Brainporium.",
    },
    apollo_scorpion = {
        addionalen = "The Scorpion is rewarded at the end of Life During Wartime, regardless if you drove the bikes or not.",
        addionalfr = "Le Scorpion est récompensé à la fin de Life During Wartime, que vous ayez conduit les motos ou non.",
    },
    Type_66_Hoon = {
        addionalen = "In a Northside warehouse in the northeastern part of Watson, Johnny Silverhand will appear near a Quadra Type-66 'Hoon', a weaponized vehicle. Behind this car is a metal shelf that has collapsed, covering a small container. The key to the Quadra is inside this container.",
        addionalfr = "Dans un entrepôt de Northside, au nord-est de Watson, Johnny Silverhand apparaîtra près d'un Quadra Type-66 'Hoon', un véhicule armé. Derrière ce véhicule se trouve une étagère métallique qui s'est effondrée, recouvrant un petit conteneur. La clé du Quadra se trouve à l'intérieur de ce conteneur.",
    },
    Sport_R_7_Charon = {
        addionalen = "'Stolen' from the EBM Petrochem Stadium underground parking garage.",
        addionalfr = "'Volé' dans le parking souterrain du stade EBM Petrochem.",
    },
    Hella_Ec_D_I360 = {
        addionalen = "V automatically has access to this car after starting Act 1. Once in Act 2, the quest 'Human Nature' will lead the player to get the car in Megabuilding H10's garage. After getting on it, a cab will wreck the Hella, starting the quest 'Tune Up'. After completing that quest and waiting for a few in-game days, Human Nature will automatically get completed and V will be able to use Hella once more.",
        addionalfr = "V a automatiquement accès à cette voiture après avoir commencé l'Acte 1. Une fois dans l'Acte 2, la quête 'Human Nature' conduira le joueur à récupérer la voiture dans le garage du Mégabâtiment H10. Après être monté dessus, un taxi détruira la Hella, ce qui déclenchera la quête 'Tune Up'. Après avoir terminé cette quête et attendu quelques jours dans le jeu, Human Nature sera automatiquement terminée et V pourra à nouveau utiliser la Hella.",
    },
    Sport_R_7_sterling = {
        addionalen = "It is rewarded at the end of Hi Ho Silver Lining. \nAfter completing all of Mr. Hands's gigs in Pacifica and Dogtown, V is asked to return to Heavy Hearts Club for a reward. After talking with Mr. Hands outside the club, V will be rewarded with the Quadra Sport R-7 'Sterling'.",
        addionalfr = "Il est récompensé à la fin de Hi Ho Silver Lining. \nAprès avoir terminé tous les contrats de Mr. Hands à Pacifica et Dogtown, V est invité à retourner au Heavy Hearts Club pour une récompense. Après avoir parlé à M. Hands à l'extérieur du club, V sera récompensé par la Quadra Sport R-7 'Sterling'.",
    },
    Sport_R_7_vigilante = {
        addionalen = "Those that pre-ordered the Cyberpunk 2077: Phantom Liberty expansion can acquire the vehicle for free after having completed The Heist main quest",
        addionalfr = "Ceux qui ont précommandé l'extension Cyberpunk 2077 : Phantom Liberty peuvent acquérir le véhicule gratuitement après avoir terminé la quête principale The Heist.",
    },
    Caliburn_Murkmobile = {
        addionalen = "After completing Ghost Town and reaching 40 Street Cred, an undiscovered quest will appear some time after on your map, in the same tunnels where Nash's Raffen Shiv hideout was. The quest starts automatically once you visit the location, where you come across an odd sight: among the darkness and crags of the unfinished tunnel, in an old shipping container, is a jet black Rayfield Caliburn 'Murkmobile', along with several containers and amenities that imply someone set up shop here or at least intended to do so. A quick search in a nearby container reveals the story.",
        addionalfr = "Après avoir terminé Ghost Town et atteint 40 Street Cred, une quête non découverte apparaîtra quelque temps après sur votre carte, dans les mêmes tunnels où se trouvait la cachette du Raffen Shiv de Nash. La quête démarre automatiquement une fois que vous avez visité l'endroit, où vous tombez sur un spectacle étrange : dans l'obscurité et les rochers du tunnel inachevé, dans un vieux conteneur d'expédition, se trouve une « Murkmobile » Rayfield Caliburn noir de jais, ainsi que plusieurs conteneurs et équipements qui indiquent que quelqu'un s'est installé ici, ou du moins en avait l'intention. Une recherche rapide dans un conteneur voisin permet de découvrir l'histoire.",
    },
    Galena_Rattler = {
        addionalen = "These Boots Are Made for Walkin' is a Side Job in Cyberpunk 2077. It is only available to players who chose the Nomad Lifepath, and features V regaining their car from the prologue.",
        addionalfr = "These Boots Are Made for Walkin' est une quete secondaire dans Cyberpunk 2077. Il n'est disponible que pour les joueurs qui ont choisi le chemin de vie Nomade, et permet à V de récupérer sa voiture dans le prologue.",
    },
    Colby_Cx_410_Gran_Butte_GREEN = {
        addionalen = "Patch 2.0 - No longer appears on the map, but will start when near to the vehicle. The quest automatically initiates as you approach the Desert Film Set, located at Jeff's Dirt Track to the east-northeast of Rocky Ridge town in the region of the same name in the Badlands.",
        addionalfr = "Patch 2.0 - N'apparaît plus sur la carte, mais démarre à proximité du véhicule. La quête démarre automatiquement lorsque vous vous approchez du plateau de tournage du désert, situé à Jeff's Dirt Track à l'est-nord-est de la ville de Rocky Ridge dans la région du même nom dans les Badlands.",
    },
    Mackinaw_Beast = {
        addionalen = "Beast is rewarded at the end of 'The Beast In Me' if you follow Peter Sampson outside of the race.",
        addionalfr = "Beast est récompensée à la fin de « The Beast In Me » si vous suivez Peter Sampson en dehors de la course.",
    },
    Mackinaw_Saguaro = {
        addionalen = "The Saguaro is rewarded at the end of Every Grain of Sand, a quest accessible after completing all gigs for Dakota Smith.",
        addionalfr = "Le Saguaro est récompensé à la fin de Every Grain of Sand, une quête accessible après avoir terminé tous les contrats pour Dakota Smith.",
    },
    Mackinaw_Demiurge = {
        addionalen = "Given to V by Polyhistor after solving the FF:06:B5 mystery.",
        addionalfr = "Remis à V par Polyhistor après avoir résolu le mystère de FF:06:B5.",
    },
    ["Delamain_No.21"] = {
        addionalen = "Delamain No. 21 is rewarded at the end of 'Don't Lose Your Mind', no matter which decision you make.",
        addionalfr = "Delamain No. 21 est récompensé à la fin de 'Don't Lose Your Mind', quelle que soit la décision que vous prenez.",
    },
    Alvarado_Vato = {
        addionalen = "In lieu of betting money, Ruiz will stake his ride, the Villefort Alvarado 'Vato'. In turn, you'll need to stake $20,000. When Ruiz is defeated, he will concede the money and car as promised, but you have a few options:Take both the car and the money Take the car, but leave Ruiz the money Take the money, but leave Ruiz the car Decline both the money and car",
        addionalfr = "Au lieu de parier de l'argent, Ruiz misera sa monture, Villefort Alvarado 'Vato'.De votre côté, vous devrez miser 20 000 dollars.Lorsque Ruiz sera vaincu, il concédera l'argent et la voiture comme promis, mais vous avez plusieurs options : prendre la voiture et l'argent prendre la voiture, mais laisser l'argent à Ruiz prendre l'argent, mais laisser la voiture à Ruiz refuser l'argent et la voiture.",
    },
    Deleon_Vindicator = {
        addionalen = "Note that Just Another Story will not be available until you have completed the first night in Dogtown (Act 1 of the Phantom Liberty DLC).",
        addionalfr = "Notez que Just Another Story ne sera pas disponible tant que vous n'aurez pas terminé la première nuit à Dogtown (Acte 1 du DLC Phantom Liberty).",
    },
    Turbo_R = {
        addionalen = "It is rewarded at the end of Sex On Wheels, a quest which is accessible after completing Gig: Life's Work.",
        addionalfr = "Il est récompensé à la fin de Sex On Wheels, une quête accessible après avoir terminé Gig : Life's Work.",
    },
    Type_66_Cthulhu = {
        addionalen = "The Cthulhu can be obtained by two different ways depending on the choices made during The Beast In Me quest chain. \n\nIf V finishes the race or if Sampson is killed after V chases him:\n\tAfter a few days, Muamar Reyes will send V a message saying he is selling the car. It then {acquired_autofixer} $67,000.\n\nIf Sampson survives after V chases him: \n\tIt is obtained for free after receiving a message from Sampson a few days later. Sampson thanks V for convincing Claire to spare his life. See 'The Beast in Me' below for more details.",
        addionalfr = "Le Cthulhu peut être obtenu de deux manières différentes, en fonction des choix effectués au cours de la chaîne de quêtes Beast In Me. \n\nSi V termine la course ou si Sampson est tué après que V l'ait poursuivi : \n\tAprès quelques jours, Muamar Reyes enverra à V un message indiquant qu'il vend la voiture. Elle peut alors être achetée sur la page Internet d'AUTOFIXER pour 67 000 $.\n\nSi Sampson survit après que V l'ait poursuivi : \n\tLa voiture est obtenue gratuitement après avoir reçu un message de Sampson quelques jours plus tard. Sampson remercie V d'avoir convaincu Claire d'épargner sa vie.",
    },
    ["911_Turbo_Cabriolet_930"] = {
        addionalen = "Rewarded upon completion. Quest is initiated by purchasing the vehicle through the AUTOFIXER netpage.",
        addionalfr = "Récompensé à l'issue de la quête. La quête est initiée par l'achat du véhicule sur la page Internet d'AUTOFIXER.",
    },
    ["911_Turbo_930"] = {
        addionalen = "The 911 Turbo can be obtained during the Chippin' In quest, right after the fight against Jeremiah Grayson. You can either spare him so he gives you the keys to the car, or take them from his body if you decide to kill him. Afterwards, go to the ladder on the starboard of the ship and activate the button you'll find up there. One of the containers will be lifted down. Just go there, open the container doors and take the car.",
        addionalfr = "La 911 Turbo peut être obtenue pendant la quête Chippin' In, juste après le combat contre Jeremiah Grayson. Vous pouvez soit l'épargner pour qu'il vous donne les clés de la voiture, soit les prendre sur son corps si vous décidez de le tuer. Ensuite, allez à l'échelle à tribord du navire et activez le bouton que vous trouverez là-haut. L'un des conteneurs sera soulevé. Allez-y, ouvrez les portes du conteneur et prenez la voiture.",
    },
    Shion_Bonewrecker = {
        addionalen = "A red and silver version can be obtained if V decided to rat Panam Palmer out to Saul Bright.",
        addionalfr = "Une version rouge et argent peut être obtenue si V a décidé de dénoncer Panam Palmer à Saul Bright.",
    },
    Hellhound = {
        addionalen = "Unlike many vehicles added by Phantom Liberty, Can be purchased without needing to complete vehicle theft quests for Muamar Reyes.",
        addionalfr = "Contrairement à de nombreux véhicules ajoutés par Phantom Liberty, Peut être acheté sans qu'il soit nécessaire d'accomplir les quêtes de vol de véhicules pour Muamar Reyes.",
    },
    Outlaw_Weiler = {
        addionalen = "Awarded to V by Muamar Reyes.",
        addionalfr = "Décerné à V par Muamar Reye",
    },
    Emperor_620_Ragnar = {
        addionalen = "Prior to the introduction of AUTOFIXER, Dino Dinovic sold the car via a text message.",
        addionalfr = "Avant l'introduction d'AUTOFIXER, Dino Dinovic vendait la voiture par SMS.",
    },
    SEMIMARU_quest = {
        en = "Motorbreath",
        fr = "Motorbreath",
    },
    MURAMASA = {
        en = "Nitro (Youth Energy)",
        fr = "Nitro (Youth Energy)",
    },
    CALIBURN_MORDRED_quest = {
        en = "Freedom",
        fr = "Freedom",
    },
    CALIBURN_MORDRED = {
        addionalen = "Automatically obtained",
        addionalfr = "Obtenue automatiquement",
    },
    LEGATUS_450_AQUILA = {
        en = "Available for purchase on AUTOFIXER.",
        fr = "Disponible à l'achat sur AUTOFIXER.",
    },
}

M.vehicle_descriptions = {
    ["Vehicle.v_sport1_yaiba_semimaru_player"] = {
        en = "{dependent_mission_reward} {SEMIMARU_quest}",
        fr = "{dependent_mission_reward} {SEMIMARU_quest}",
        addionalen = "{CALIBURN_MORDRED}",
        addionalfr = "{CALIBURN_MORDRED}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_naked"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_naked_as"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_naked_as_nr"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_naked_as_ns"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_naked_as_ns_nr"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_naked_nr"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_naked_ns"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_naked_ns_nr"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_regular"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_regular_as"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_regular_as_nr"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_regular_as_ns"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_regular_as_ns_nr"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_regular_nr"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_regular_ns"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sportbike1_yaiba_muramasa_regular_ns_nr"] = {
        en = "{dependent_mission_reward} {MURAMASA}",
        fr = "{dependent_mission_reward} {MURAMASA}",
    },
    ["Vehicle.v_sport1_rayfield_caliburn_mordred_player"] = {
        en = "{dependent_mission_reward} {CALIBURN_MORDRED_quest}",
        fr = "{dependent_mission_reward} {CALIBURN_MORDRED_quest}",
        addionalen = "{CALIBURN_MORDRED}",
        addionalfr = "{CALIBURN_MORDRED}",
    },
    ["Vehicle.v_utility4_chevalier_legatus_player"] = {
        en = "{acquired_autofixer} $55,000",
        fr = "{acquired_autofixer} $55,000",
    },
    ["Vehicle.v_sportbike2_arch_player"] = {
        en = "{acquired_autofixer} $71,000.",
        fr = "{acquired_autofixer} $71,000.",
    },
    ["Vehicle.v_sportbike1_yaiba_kusanagi_player"] = {
        en = "{acquired_autofixer} $66,000.",
        fr = "{acquired_autofixer} $66,000.",
    },
    ["Vehicle.v_sportbike2_arch_tyger_player"] = {
        en = "{mission_reward} The Highwayman",
        fr = "{mission_reward} The Highwayman",
        addionalen = "{nazaré_itsumade}",
        addionalfr = "{nazaré_itsumade}",
    },
    ["Vehicle.v_sportbike2_arch_jackie_player"] = {
        en = "{optional_mission} Heroes",
        fr = "{optional_mission} Heroes",
    },
    ["Vehicle.v_sportbike2_arch_jackie_tuned_player"] = {
        en = "{nomad}",
        fr = "{nomad}",
        addionalen = "{Jackies_Tuned_Arch}",
        addionalfr = "{Jackies_Tuned_Arch}",
    },
    ["Vehicle.v_sportbike2_arch_linas_player"] = {
        en = "{dependent_mission_reward} Dazed and Confused",
        fr = "{dependent_mission_reward} Dazed and Confused",
        addionalen = "{malina_mobile}",
        addionalfr = "{malina_mobile}",
    },
    ["Vehicle.v_sportbike2_arch_player_03"] = {
        en = "{acquired_autofixer} $68,000.",
        fr = "{acquired_autofixer} $68,000.",
    },
    ["Vehicle.v_sportbike2_arch_player_02"] = {
        en = "{acquired_autofixer} $74,000.",
        fr = "{acquired_autofixer} $74,000.",
    },
    ["Vehicle.v_sportbike3_brennan_apollo_player"] = {
        en = "{acquired_autofixer} $30,000.",
        fr = "{acquired_autofixer} $30,000.",
    },
    ["Vehicle.v_sportbike3_brennan_apollo_nomad_player"] = {
        en = "{mission_reward} Life During Wartime",
        fr = "{mission_reward} Life During Wartime",
        addionalen = "{apollo_scorpion}",
        addionalfr = "{apollo_scorpion}",
    },
    ["Vehicle.v_sportbike3_brennan_apollo_player_02"] = {
        en = "{acquired_autofixer} $36,000.",
        fr = "{acquired_autofixer} $36,000.",
    },
    ["Vehicle.v_sportbike1_yaiba_kusanagi_player_03"] = {
        en = "{acquired_autofixer} $72,000.",
        fr = "{acquired_autofixer} $72,000.",
    },
    ["Vehicle.v_sportbike1_yaiba_kusanagi_player_02"] = {
        en = "{acquired_autofixer} $76,000.",
        fr = "{acquired_autofixer} $76,000.",
    },
    ["Vehicle.v_standard2_archer_quartz_base_player"] = {
        en = "{acquired_autofixer} $21,000.",
        fr = "{acquired_autofixer} $21,000.",
    },
    ["Vehicle.v_standard25_mahir_supron_gt_player"] = {
        en = "{acquired_autofixer} $26,000.",
        fr = "{acquired_autofixer} $26,000.",
    },
    ["Vehicle.v_standard2_mizutani_hozuki_gt_player"] = {
        en = "{acquired_autofixer} $29,000.",
        fr = "{acquired_autofixer} $29,000.",
    },
    ["Vehicle.v_sport2_mizutani_shion_base_player"] = {
        en = "{acquired_autofixer} $43,000.",
        fr = "{acquired_autofixer} $43,000.",
    },
    ["Vehicle.v_sport2_mizutani_shion_targa_player"] = {
        en = "{acquired_autofixer} $61,000.",
        fr = "{acquired_autofixer} $61,000.",
    },
    ["Vehicle.v_sport2_quadra_type66_gt_player"] = {
        en = "{acquired_autofixer} $50,000.",
        fr = "{acquired_autofixer} $50,000.",
    },
    ["Vehicle.v_sport2_villefort_deleon_sport_player"] = {
        en = "{acquired_autofixer} $33,000.",
        fr = "{acquired_autofixer} $33,000.",
    },
    ["Vehicle.v_standard2_thorton_colby_gt_player"] = {
        en = "{acquired_autofixer} $33,000.",
        fr = "{acquired_autofixer} $33,000.",
    },
    ["Vehicle.v_standard2_thorton_galena_nomad_player"] = {
        en = "{acquired_autofixer} $45,000.",
        fr = "{acquired_autofixer} $45,000.",
    },
    ["Vehicle.v_sport2_quadra_type66_nomad_tribute"] = {
        en = "{mission_reward} I'm in Love with My Car",
        fr = "{mission_reward} I'm in Love with My Car",
        addionalen = "{Type_66_Hoon}",
        addionalfr = "{Type_66_Hoon}",
    },
    ["Vehicle.v_sport1_quadra_sport_r7_netrunner"] = {
        en = "{mission_reward} Moving Heat",
        fr = "{mission_reward} Moving Heat",
        addionalen = "{Sport_R_7_Charon}",
        addionalfr = "{Sport_R_7_Charon}",
    },
    ["Vehicle.v_standard2_archer_hella_player"] = {
        en = "{mission_reward} The Ripperdoc ",
        fr = "{mission_reward} The Ripperdoc ",
        addionalen = "{Hella_Ec_D_I360}.",
        addionalfr = "{Hella_Ec_D_I360}",
    },
    ["Vehicle.v_standard2_archer_quartz_player"] = {
        en = "{acquired_autofixer} $31,000.",
        fr = "{acquired_autofixer} $31,000.",
    },
    ["Vehicle.v_standard2_archer_bandit_player"] = {
        en = "{Quartz_Bandit}",
        fr = "{Quartz_Bandit}",
    },
    ["Vehicle.v_standard2_archer_quartz_nomad_player"] = {
        en = "{acquired_autofixer} $90,000.",
        fr = "{acquired_autofixer} $90,000.",
    },
    ["Vehicle.v_standard2_archer_quartz_nomad_player_02"] = {
        en = "{non_wraith} $79,000.",
        fr = "{non_wraith} $79,000.",
    },
    ["Vehicle.v_sport1_quadra_sport_r7_mrhands"] = {
        en = "{mission_reward} Hi Ho Silver Lining",
        fr = "{mission_reward} Hi Ho Silver Lining",
        addionalen = "{Sport_R_7_sterling}",
        addionalfr = "{Sport_R_7_sterling}",
    },
    ["Vehicle.v_sport1_quadra_sport_r7_player"] = {
        en = "{acquired_autofixer} $81,000.",
        fr = "{acquired_autofixer} $81,000.",
    },
    ["Vehicle.v_sport1_quadra_sport_r7_player_02"] = {
        en = "{acquired_autofixer} $86,000.",
        fr = "{acquired_autofixer} $86,000.",
        addionalen = "{Sport_R_7_vigilante}",
        addionalfr = "{Sport_R_7_vigilante}",
    },
    ["Vehicle.v_sport2_quadra_type66_nomad_player_03"] = {
        en = "{acquired_autofixer} $99,000.",
        fr = "{acquired_autofixer} $99,000.",
    },
    ["Vehicle.v_sport1_rayfield_aerondight_player"] = {
        en = "{acquired_autofixer} $155,000.",
        fr = "{acquired_autofixer} $155,000.",
    },
    ["Vehicle.v_sport1_rayfield_caliburn_player"] = {
        en = "{acquired_autofixer} $135,000 at 50 Street Cred.",
        fr = "{acquired_autofixer} $135,000 en ayant 50 de Street Cred.",
    },
    ["Vehicle.v_sport1_rayfield_caliburn_02_player"] = {
        en = "{Free} (Easter Egg)",
        fr = "{Free} (Easter Egg)",
        addionalen = "{Caliburn_Murkmobile}",
        addionalfr = "{Caliburn_Murkmobile}",
    },
    ["Vehicle.v_standard2_thorton_galena_player"] = {
        en = "{acquired_autofixer} $26,000.",
        fr = "{acquired_autofixer} $26,000.",
    },
    ["Vehicle.v_standard2_thorton_colby_player"] = {
        en = "{acquired_autofixer} $18,000.",
        fr = "{acquired_autofixer} $18,000.",
    },
    ["Vehicle.v_standard2_thorton_galena_bobas_player"] = {
        en = "{nomad}\n{optional_mission} These Boots Are Made for Walkin'",
        fr = "{nomad}\n{optional_mission} These Boots Are Made for Walkin'",
        addionalen = "{Galena_Rattler}",
        addionalfr = "{Galena_Rattler}",
    },
    ["Vehicle.v_standard25_thorton_colby_nomad_player"] = {
        en = "{acquired_autofixer} $41,000.",
        fr = "{acquired_autofixer} $41,000.",
    },
    ["Vehicle.v_standard3_thorton_mackinaw_player"] = {
        en = "{acquired_autofixer} $33,000.",
        fr = "{acquired_autofixer} $33,000.",
    },
    ["Vehicle.v_standard25_thorton_colby_pickup_player"] = {
        en = "{mission_reward} Dressed to Kill",
        fr = "{mission_reward} Dressed to Kill",
        addionalen = "{Colby_Cx_410_Gran_Butte_GREEN}",
        addionalfr = "{Colby_Cx_410_Gran_Butte_GREEN}",
    },
    ["Vehicle.v_standard25_thorton_colby_nomad_player_missiles"] = {
        en = "{non_wraith} $56,000.",
        fr = "{non_wraith} $56,000.",
    },
    ["Vehicle.v_standard25_thorton_colby_pickup_02_player"] = {
        en = "{acquired_autofixer} $25,000.",
        fr = "{acquired_autofixer} $25,000.",
    },
    ["Vehicle.v_standard3_thorton_mackinaw_ncu_player"] = {
        en = "{dependent_mission_reward} The Beast in Me",
        fr = "{dependent_mission_reward} The Beast in Me",
        addionalen = "{Mackinaw_Beast}",
        addionalfr = "{Mackinaw_Beast}",
    },
    ["Vehicle.v_standard3_thorton_mackinaw_02_player"] = {
        en = "{mission_reward} Every Grain of Sand",
        fr = "{mission_reward} Every Grain of Sand",
        addionalen = "{Mackinaw_Saguaro}",
        addionalfr = "{Mackinaw_Saguaro}",
    },
    ["Vehicle.v_standard25_thorton_colby_pickup_kurtz_player"] = {
        en = "{acquired_autofixer} $29,000.",
        fr = "{acquired_autofixer} $29,000.",
    },
    ["Vehicle.v_standard2_thorton_galena_nomad_player_missiles"] = {
        en = "{acquired_autofixer} $60,000.",
        fr = "{acquired_autofixer} $60,000.",
    },
    ["Vehicle.v_standard25_thorton_merrimac_player"] = {
        en = "{acquired_autofixer} $43,000.",
        fr = "{acquired_autofixer} $43,000.",
    },
    ["Vehicle.v_utility4_thorton_mackinaw_bmf_player"] = {
        en = "{Reward}",
        fr = "{Reward}",
        addionalen = "{Mackinaw_Demiurge}",
        addionalfr = "{Mackinaw_Demiurge}",
    },
    ["Vehicle.v_standard25_villefort_columbus_player"] = {
        en = "{acquired_autofixer} $19,000.",
        fr = "{acquired_autofixer} $19,000.",
    },
    ["Vehicle.v_standard2_villefort_cortes_delamain_player"] = {
        en = "{mission_reward} Don't Lose Your Mind",
        fr = "{mission_reward} Don't Lose Your Mind",
        addionalen = "{Delamain_No.21}",
        addionalfr = "{Delamain_No.21}",
    },
    ["Vehicle.v_sport2_villefort_alvarado_valentinos_player"] = {
        en = "{optional_mission} Beat on the Brat: The Glen",
        fr = "{optional_mission} Beat on the Brat: The Glen",
        addionalen = "{Alvarado_Vato}",
        addionalfr = "{Alvarado_Vato}",
    },
    ["Vehicle.v_sport2_villefort_alvarado_player"] = {
        en = "{acquired_autofixer} $38,000.",
        fr = "{acquired_autofixer} $38,000.",
    },
    ["Vehicle.v_sport2_villefort_alvarado_hearse_player"] = {
        en = "{acquired_autofixer} $39,000.",
        fr = "{acquired_autofixer} $39,000.",
    },
    ["Vehicle.v_sport2_villefort_deleon_player"] = {
        en = "{acquired_autofixer} $36,000 {just_another_story}",
        fr = "{acquired_autofixer} $36,000 {just_another_story}",
        addionalen = "{Deleon_Vindicator}",
        addionalfr = "{Deleon_Vindicator}.",
    },
    ["Vehicle.v_standard2_villefort_cortes_player"] = {
        en = "{acquired_autofixer} $28,000.",
        fr = "{acquired_autofixer} $28,000.",
    },
    ["Vehicle.v_sport2_quadra_type66_02_player"] = {
        en = "{acquired_autofixer} $40,000.",
        fr = "{acquired_autofixer} $40,000.",
    },
    ["Vehicle.v_sport2_quadra_type66_nomad_player"] = {
        en = "{acquired_autofixer} $99,000.",
        fr = "{acquired_autofixer} $99,000.",
    },
    ["Vehicle.v_sport2_quadra_type66_avenger_player"] = {
        en = "{acquired_autofixer} $75,000 {Street_Cred}",
        fr = "{acquired_autofixer} $75,000 {Street_Cred}",
    },
    ["Vehicle.v_sport1_quadra_turbo_r_player"] = {
        en = "{mission_reward} Sex On Wheels",
        fr = "{mission_reward} Sex On Wheels",
        addionalen = "{Turbo_R}",
        addionalfr = "{Turbo_R}",
    },
    ["Vehicle.v_sport2_quadra_type66_nomad_ncu_player"] = {
        en = "{mission_reward} The Beast in Me",
        fr = "{mission_reward} The Beast in Me",
        addionalen = "{Type_66_Cthulhu}",
        addionalfr = "{Type_66_Cthulhu}",
    },
    ["Vehicle.v_sport2_quadra_type66_player"] = {
        en = "{acquired_autofixer} $52,000.",
        fr = "{acquired_autofixer} $52,000.",
    },
    ["Vehicle.v_sport1_quadra_turbo_player"] = {
        en = "{acquired_autofixer} $69,000.",
        fr = "{acquired_autofixer} $69,000.",
    },
    ["Vehicle.v_sport2_porsche_911turbo_cabrio_player"] = {
        en = "{mission_reward} Shape of a Pony",
        fr = "{mission_reward} Shape of a Pony",
        addionalen = "{911_Turbo_Cabriolet_930}",
        addionalfr = "{911_Turbo_Cabriolet_930}",
    },
    ["Vehicle.v_sport2_porsche_911turbo_player"] = {
        en = "{dependent_mission_reward} Chippin' In",
        fr = "{dependent_mission_reward} Chippin' In",
        addionalen = "{911_Turbo_930}",
        addionalfr = "{911_Turbo_930}",
    },
    ["Vehicle.v_sport2_mizutani_shion_nomad_02_player"] = {
        en = "{dependent_mission_reward} With a Little Help from My Friends",
        fr = "{dependent_mission_reward} With a Little Help from My Friends",
        addionalen = "{Shion_Bonewrecker}",
        addionalfr = "{Shion_Bonewrecker}",
    },
    ["Vehicle.v_sport2_mizutani_shion_nomad_player_missiles"] = {
        en = "{acquired_autofixer} $87,000.",
        fr = "{acquired_autofixer} $87,000.",
    },
    ["Vehicle.v_standard2_mizutani_hozuki_player"] = {
        en = "{acquired_autofixer} $37,000.",
        fr = "{acquired_autofixer} $37,000.",
    },
    ["Vehicle.v_sport2_mizutani_shion_nomad_player"] = {
        en = "{acquired_autofixer} $77,000.",
        fr = "{acquired_autofixer} $77,000.",
    },
    ["Vehicle.v_sport2_mizutani_shion_player"] = {
        en = "{acquired_autofixer} $57,000.",
        fr = "{acquired_autofixer} $57,000.",
    },
    ["Vehicle.v_standard3_militech_hellhound_player"] = {
        en = "{acquired_autofixer} $160,000.",
        fr = "{acquired_autofixer} $160,000.",
        addionalen = "{Hellhound}",
        addionalfr = "{Hellhound}",
    },
    ["Vehicle.v_standard3_makigai_tanishi_player"] = {
        en = "{acquired_autofixer} $35,000.",
        fr = "{acquired_autofixer} $35,000.",
    },
    ["Vehicle.v_standard3_makigai_tanishi_player_mr_hands"] = {
        en = "{mission_reward} {Tanishi_T400}",
        fr = "{mission_reward} {Tanishi_T400}",
    },
    ["Vehicle.v_standard2_makigai_maimai_player"] = {
        en = "{acquired_autofixer} $22,000.",
        fr = "{acquired_autofixer} $22,000.",
    },
    ["Vehicle.v_standard3_mahir_supron_kurtz_player"] = {
        en = "{acquired_autofixer} $94,000.",
        fr = "{acquired_autofixer} $94,000.",
    },
    ["Vehicle.v_standard25_mahir_supron_player"] = {
        en = "{acquired_autofixer} $16,000.",
        fr = "{acquired_autofixer} $16,000.",
    },
    ["Vehicle.v_sport1_herrera_riptide_player"] = {
        en = "{acquired_autofixer} $108,000.",
        fr = "{acquired_autofixer} $108,000.",
    },
    ["Vehicle.v_sport1_herrera_outlaw_heist_player"] = {
        en = "{mission_reward} Baby Let Me Take You",
        fr = "{mission_reward} Baby Let Me Take You",
        addionalen = "{Outlaw_Weiler}",
        addionalfr = "{Outlaw_Weiler}",
    },
    ["Vehicle.v_sport1_herrera_outlaw_player"] = {
        en = "{acquired_autofixer} ",
        fr = "{acquired_autofixer} ",
    },
    ["Vehicle.v_standard3_chevalier_emperor_player"] = {
        en = "{acquired_autofixer} $38,000.",
        fr = "{acquired_autofixer} $38,000.",
        addionalen = "{Emperor_620_Ragnar}",
        addionalfr = "{Emperor_620_Ragnar}",
    },
    ["Vehicle.v_standard2_chevalier_thrax_player"] = {
        en = "{acquired_autofixer} $34,000.",
        fr = "{acquired_autofixer} $34,000.",
    },
}

-- Resolve {placeholder} references inside descriptions using common_descriptions.
-- Mirrors the original loadTranslations() logic that lived in each consumer file.
local TEXT_FIELDS = { en = true, fr = true, addionalen = true, addionalfr = true }
local function resolve(target, common)
    for _, desc in pairs(target) do
        if type(desc) == "table" then
            for key, value in pairs(desc) do
                if TEXT_FIELDS[key] and type(value) == "string" then
                    for placeholder, replacement in pairs(common) do
                        local pattern = "{" .. placeholder .. "}"
                        value = value:gsub(pattern, replacement[key] or "")
                    end
                    desc[key] = value
                end
            end
        end
    end
end

resolve(M.descriptions, M.common_descriptions)
resolve(M.vehicle_descriptions, M.vehicle_common_descriptions)

return M
