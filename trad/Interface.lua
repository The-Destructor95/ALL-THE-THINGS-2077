--!!!!!!!!!DONT TRANSLATE THE ENGLISH VERSION, ONLY TRAD!!!!!!!!! 
--!!!!!!!!!DONT TRANSLATE THE ENGLISH VERSION, ONLY TRAD!!!!!!!!! 
--!!!!!!!!!DONT TRANSLATE THE ENGLISH VERSION, ONLY TRAD!!!!!!!!! 
--!!!!!!!!!DONT TRANSLATE THE ENGLISH VERSION, ONLY TRAD!!!!!!!!! 
--!!!!!!!!!DONT TRANSLATE THE ENGLISH VERSION, ONLY TRAD!!!!!!!!! 
--!!!!!!!!!DONT TRANSLATE THE ENGLISH VERSION, ONLY TRAD!!!!!!!!! 
--!!!!!!!!!DONT TRANSLATE THE ENGLISH VERSION, ONLY TRAD!!!!!!!!! 
--!!!!!!!!!DONT TRANSLATE THE ENGLISH VERSION, ONLY TRAD!!!!!!!!! 

--CHANGELOG
---========================================================
--                  VERSION 2.2
---========================================================
--2.2
--ADD NEW TEXT 
--just add them as shown below
--
--en
    --Page Principale
        --misc
           --ATT_CRAFTING_COMPONENTS = "Crafting Components",
           --ATT_BUFF = "Buff",
           --ATT_MEDICATION = "Medication",
           --ATT_ALCOHOL = "Alcohol",
           --ATT_DRINK = "Drink",
           --ATT_FOOD = "Food",
    --Page settings
        --General
            --ATT_UNOWNED_ITEMS = "hide items not obtained",
--trad (change to your language)
    --Page Principale
        --misc
            --ATT_CRAFTING_COMPONENTS = "Composants de fabrication",
            --ATT_BUFF = "Améliorations",
            --ATT_MEDICATION = "Médicaments",
            --ATT_ALCOHOL = "Alcool",
            --ATT_DRINK = "Boisson",
            --ATT_FOOD = "Alimentation",
     --Page settings
        --General
            --ATT_UNOWNED_ITEMS = "masquer les items non obtenues",
--remove this text
--en
--Page Principale
    --Global
        -- ATT_FILTERS_TEXT = "Filters allow you to filter the items you want to see.\n\nYou can choose between 3 filters:\n- All : All items are displayed\n- Obtained : Only the items you have obtained are displayed\n- Not obtained : Only the items you have not yet obtained are displayed",
--trad
--Page Principale
    --Global
        --ATT_FILTERS_TEXT = "Les filtres vous permettent de filtrer les objets que vous souhaitez voir.\n\nVous pouvez choisir entre 3 filtres :\n- Tout : Tous les objets sont affichés\n- Obtenu : Seuls les objets que vous avez obtenus sont affichés\n- Non obtenu : Seuls les objets que vous n'avez pas encore obtenus sont afficher",

---========================================================
--                  VERSION 2.1
---========================================================
--2.1
--ADD NEW TEXT 
--just add them as shown below
--
 --en
    --Page Principale
      --Global
	    --ATT_NOTIFICATION = "Notification",
        --ATT_NOTIFICATION_DISABLE = "Disable notification",
        --ATT_Collected_Item = "Item acquired",
        --ATT_Collected_vehicules = "Vehicle acquired",
   
 --trad (change to your language)
    --Page Principale
      --Global
        --ATT_NOTIFICATION = "Notification",
        --ATT_NOTIFICATION_DISABLE = "Desactiver la notification",
        --ATT_Collected_Item = "Item obtenu",
        --ATT_Collected_vehicules = "Véhicule obtenu",

--
local translations = {
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
        
    trad = {
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
    
            --Left menu
               --CollapsingHeader
                ATT_VEHICLES = "Vehicules",
                ATT_CLOTHES = "Vêtements",
                ATT_WEAPONS = "Armes",
                ATT_RANGED_WEAPONS = "Armes a distance",
                ATT_MELEE_WEAPONS = "Armes de melee",
                ATT_CYBERWARE = "Materiel Cyber",
                ATT_QUICKHACKS = "Piratage rapide",
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
    
    return translations
    
    