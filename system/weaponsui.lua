local Weaponsui = {}

local hideOwnedItems = false
local hideUnownedItems = false

local selectedName = nil

-- local function loadTranslations()
--     local file = io.open("trad/Description.json", "r")
--     if not file then return {} end
    
--     local content = file:read("*a")
--     file:close()
    
--     local translationstests, _, err = json.decode(content)
--     if err then
--         print("❌ Erreur de décodage JSON :", err)
--         return {}
--     end
    
--     return translationstests
-- end
-- local translationstests = loadTranslations() or {}  
local function loadTranslations()
    local file = io.open("trad/Description.json", "r")
    if not file then return {} end

    local content = file:read("*a")
    file:close()

    local translationstests, _, err = json.decode(content)
    if err then
        print("❌ Erreur de décodage JSON :", err)
        return {}
    end

    -- Extraire les descriptions communes
    local common_descriptions = translationstests.common_descriptions

    -- Parcourir les entrées du JSON
    for _, desc in pairs(translationstests) do
        if type(desc) == "table" then
            for key, value in pairs(desc) do
                -- On ne traite que les champs texte "en" ou "trad"
                if (key == "en" or key == "trad") and type(value) == "string" then
                    -- Remplacer tous les placeholders présents dans value
                    for placeholder, replacement in pairs(common_descriptions) do
                        local pattern = "{" .. placeholder .. "}"
                        local replacement_value = replacement[key] or "❌missing"
                        value = value:gsub(pattern, replacement_value)
                    end
                    -- Sauvegarder la version modifiée
                    desc[key] = value
                end
            end
        end
    end

    return translationstests
end

local translationstests = loadTranslations() or {}


-- function Weaponsui.resolveTranslationPlaceholders(translations)
--     for key, entry in pairs(translations) do
--         for lang, value in pairs(entry) do
--             -- On remplace tous les tags du type @xxx
--             entry[lang] = string.gsub(value, "@(%w+)", function(refKey)
--                 local refEntry = translations["@" .. refKey]
--                 return refEntry and refEntry[lang] or "@" .. refKey
--             end)
--         end
--     end
-- end
-- Weaponsui.resolveTranslationPlaceholders(translationstests)

ATT.translations            = require("trad/Interface")
ATT.selectedLanguage        = "en"

local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
  end
  
local weapons = require("data/weapons") or {}  -- ✅ Vérifier si le fichier est bien chargé

local groupedWeapons = { 
    Handguns = {}, 
    Handguns_liberty = {}, 
    Handguns_quest_liberty = {}, 
    Handguns_quest = {}, 
    Revolvers = {}, 
    Revolvers_liberty = {}, 
    Revolvers_quest_liberty = {}, 
    Revolvers_quest = {},
    AssaultRifles = {}, 
    AssaultRifles_liberty = {}, 
    AssaultRifles_quest_liberty = {}, 
    AssaultRifles_quest = {},
    SniperRifles = {}, 
    SniperRifles_liberty = {}, 
    SniperRifles_quest_liberty = {}, 
    SniperRifles_quest = {},
    PrecisionRifles = {}, 
    PrecisionRifles_liberty = {}, 
    PrecisionRifles_quest = {},
    Shotguns = {}, 
    Shotguns_liberty = {}, 
    Shotguns_quest_liberty = {}, 
    Shotguns_quest = {},
    Smgs = {}, 
    Smgs_liberty = {}, 
    Smgs_quest_liberty = {}, 
    Smgs_quest = {},
    Hmgs = {}, 
    Hmgs_liberty = {}, 
    Hmgs_quest_liberty = {}, 
    Grenades = {}, 
    Grenades_quest = {},
    Axes = {}, 
    Axes_liberty = {}, 
    Axes_quest_liberty = {}, 
    Chainswords = {}, 
    Chainswords_liberty = {}, 
    Katanas = {}, 
    Katanas_quest = {},
    Knives = {}, 
    Knives_quest_liberty = {}, 
    Knives_quest = {},
    Machetes = {}, 
    Machetes_liberty = {}, 
    Machetes_quest_liberty = {}, 
    Swords = {}, 
    Hammers = {}, 
    Hammers_quest = {},
    OneHandedClubs = {}, 
    OneHandedClubs_quest_liberty = {}, 
    OneHandedClubs_quest = {},
    TwoHandedClubs = {}, 
    TwoHandedClubs_liberty = {}, 
    TwoHandedClubs_quest_liberty = {}, 
    TwoHandedClubs_quest = {}
}

for _, handgun in ipairs(weapons.handguns) do 
    local handgunData = {
        recordID = handgun[1],
        name = handgun[2],
        acquisitionID = handgun[3],
        vendorID = handgun[4]
    }

    local acquisitionData = translationstests[handgunData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[handgunData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Handguns[handgunData.name] then
        groupedWeapons.Handguns[handgunData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Handguns[handgunData.name].recordIDs, handgunData.recordID)
  end
  for _, handgun_liberty in ipairs(weapons.handguns_liberty) do 
    local handgunData_liberty = {
        recordID = handgun_liberty[1],
        name = handgun_liberty[2],
        acquisitionID = handgun_liberty[3],
        vendorID = handgun_liberty[4]
    }

    local acquisitionData = translationstests[handgunData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[handgunData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Handguns_liberty[handgunData_liberty.name] then
        groupedWeapons.Handguns_liberty[handgunData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Handguns_liberty[handgunData_liberty.name].recordIDs, handgunData_liberty.recordID)
  end
  for _, handgun_quest_liberty in ipairs(weapons.handguns_quest_liberty) do 
    local handgunData_quest_liberty = {
        recordID = handgun_quest_liberty[1],
        name = handgun_quest_liberty[2],
        rarity = handgun_quest_liberty[3], -- 🔥 AJOUTER rarity
        acquisitionID = handgun_quest_liberty[4],
        vendorID = handgun_quest_liberty[5]
    }

    local acquisitionData = translationstests[handgunData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[handgunData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Handguns_quest_liberty[handgunData_quest_liberty.name] then
        groupedWeapons.Handguns_quest_liberty[handgunData_quest_liberty.name] = {
            recordIDs = {},
            names = {},
            rarity = handgunData_quest_liberty.rarity or "", -- 🔥 STOCKER rarity
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Handguns_quest_liberty[handgunData_quest_liberty.name].recordIDs, handgunData_quest_liberty.recordID)
  end
  for _, handgun_quest in ipairs(weapons.handguns_quest) do 
    local handgunData_quest = {
        recordID = handgun_quest[1],
        name = handgun_quest[2],
        acquisitionID = handgun_quest[3],
        vendorID = handgun_quest[4]
    }

    local acquisitionData = translationstests[handgunData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[handgunData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Handguns_quest[handgunData_quest.name] then
        groupedWeapons.Handguns_quest[handgunData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Handguns_quest[handgunData_quest.name].recordIDs, handgunData_quest.recordID)
  end

  for _, revolver in ipairs(weapons.revolvers) do 
    local revolverData = {
        recordID = revolver[1],
        name = revolver[2],
        acquisitionID = revolver[3],
        vendorID = revolver[4]
    }

    local acquisitionData = translationstests[revolverData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[revolverData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Revolvers[revolverData.name] then
        groupedWeapons.Revolvers[revolverData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Revolvers[revolverData.name].recordIDs, revolverData.recordID)
  end
  for _, revolver_liberty in ipairs(weapons.revolvers_liberty) do 
    local revolverData_liberty = {
        recordID = revolver_liberty[1],
        name = revolver_liberty[2],
        acquisitionID = revolver_liberty[3],
        vendorID = revolver_liberty[4]
    }

    local acquisitionData = translationstests[revolverData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[revolverData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Revolvers_liberty[revolverData_liberty.name] then
        groupedWeapons.Revolvers_liberty[revolverData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Revolvers_liberty[revolverData_liberty.name].recordIDs, revolverData_liberty.recordID)
  end
  for _, revolver_quest_liberty in ipairs(weapons.revolvers_quest_liberty) do 
      local revolverData_quest_liberty = {
          recordID = revolver_quest_liberty[1],
          name = revolver_quest_liberty[2],
          acquisitionID = revolver_quest_liberty[3],
          vendorID = revolver_quest_liberty[4]
      }

      local acquisitionData = translationstests[revolverData_quest_liberty.acquisitionID] or { en = "", trad = "" }
      local vendorData = translationstests[revolverData_quest_liberty.vendorID] or { en = "", trad = "" }

      if not groupedWeapons.Revolvers_quest_liberty[revolverData_quest_liberty.name] then
          groupedWeapons.Revolvers_quest_liberty[revolverData_quest_liberty.name] = {
              recordIDs = {},
              acquisitionen = acquisitionData.en,
              acquisitiontrad = acquisitionData.trad,
              vendoren = vendorData.en,
              vendorentrad = vendorData.trad,
          }
      end

      table.insert(groupedWeapons.Revolvers_quest_liberty[revolverData_quest_liberty.name].recordIDs, revolverData_quest_liberty.recordID)
  end
  for _, revolver_quest in ipairs(weapons.revolvers_quest) do 
      local revolverData_quest = {
          recordID = revolver_quest[1],
          name = revolver_quest[2],
          acquisitionID = revolver_quest[3],
          vendorID = revolver_quest[4]
      }

      local acquisitionData = translationstests[revolverData_quest.acquisitionID] or { en = "", trad = "" }
      local vendorData = translationstests[revolverData_quest.vendorID] or { en = "", trad = "" }

      if not groupedWeapons.Revolvers_quest[revolverData_quest.name] then
          groupedWeapons.Revolvers_quest[revolverData_quest.name] = {
              recordIDs = {},
              acquisitionen = acquisitionData.en,
              acquisitiontrad = acquisitionData.trad,
              vendoren = vendorData.en,
              vendorentrad = vendorData.trad,
          }
      end

      table.insert(groupedWeapons.Revolvers_quest[revolverData_quest.name].recordIDs, revolverData_quest.recordID)
  end
  
--   for _, assault_rifle in ipairs(weapons.assault_rifles) do 
--     local assault_rifleData = {
--         recordID = assault_rifle[1],
--         name = assault_rifle[2],
--         rarity = assault_rifle[3], -- 🔥 AJOUTER rarity
--         acquisitionID = assault_rifle[4],
--         vendorID = assault_rifle[5],
--     }

--     local acquisitionData = translationstests[assault_rifleData.acquisitionID] or { en = "", trad = "" }
--     local vendorData = translationstests[assault_rifleData.vendorID] or { en = "", trad = "" }

--     -- 🔒 Initialisation du groupe si pas encore présent
--     if not groupedWeapons.AssaultRifles[assault_rifleData.name] then
--         -- 🔍 On va chercher les traductions pour la rareté si elles existent
--         local rarityData = translationstests[assault_rifleData.rarity] or { en = "", trad = "" }
    
--         groupedWeapons.AssaultRifles[assault_rifleData.name] = {
--             recordIDs = {},
--             names = {},
    
--             -- 🔥 on garde l'ID brut de la rareté
--             rarity = assault_rifleData.rarity or "",
    
--             -- ✅ on stocke aussi les traductions
--             rarityen = rarityData.en,
--             raritytrad = rarityData.trad,
    
--             acquisitionen = acquisitionData.en,
--             acquisitiontrad = acquisitionData.trad,
--             vendoren = vendorData.en,
--             vendorentrad = vendorData.trad,
--         }
--     end
    

--     -- 🔐 Ne pas écraser la rarity existante si elle est déjà définie
--     if assault_rifleData.rarity and groupedWeapons.AssaultRifles[assault_rifleData.name].rarity == "" then
--         groupedWeapons.AssaultRifles[assault_rifleData.name].rarity = assault_rifleData.rarity
--     end

--     table.insert(groupedWeapons.AssaultRifles[assault_rifleData.name].recordIDs, assault_rifleData.recordID)
-- end



  --
  --
  --MARCHE
--   for _, assault_rifle in ipairs(weapons.assault_rifles) do 
--     local assault_rifleData = {
--         recordID = assault_rifle[1],
--         name = assault_rifle[2],
--         rarity = assault_rifle[3], -- 🔥 AJOUTER rarity
--         acquisitionID = assault_rifle[4],
--         vendorID = assault_rifle[5],
--     }

--     local acquisitionData = translationstests[assault_rifleData.acquisitionID] or { en = "", trad = "" }
--     local vendorData = translationstests[assault_rifleData.vendorID] or { en = "", trad = "" }

--     if not groupedWeapons.AssaultRifles[assault_rifleData.name] then
--         groupedWeapons.AssaultRifles[assault_rifleData.name] = {
--             recordIDs = {},
--             names = {},
--             rarity = assault_rifleData.rarity or "", -- 🔥 STOCKER rarity
--             acquisitionen = acquisitionData.en,
--             acquisitiontrad = acquisitionData.trad,
--             vendoren = vendorData.en,
--             vendorentrad = vendorData.trad,
--         }
--     end

--     table.insert(groupedWeapons.AssaultRifles[assault_rifleData.name].recordIDs, assault_rifleData.recordID)
-- end

--
      for _, assault_rifle in ipairs(weapons.assault_rifles) do 
          local assault_rifleData = {
              recordID = assault_rifle[1],
              name = assault_rifle[2],
              acquisitionID = assault_rifle[3],
              vendorID = assault_rifle[4]
          }

          local acquisitionData = translationstests[assault_rifleData.acquisitionID] or { en = "", trad = "" }
          local vendorData = translationstests[assault_rifleData.vendorID] or { en = "", trad = "" }

          if not groupedWeapons.AssaultRifles[assault_rifleData.name] then
              groupedWeapons.AssaultRifles[assault_rifleData.name] = {
                  recordIDs = {},
                  names = {},
                  acquisitionen = acquisitionData.en,
                  acquisitiontrad = acquisitionData.trad,
                  vendoren = vendorData.en,
                  vendorentrad = vendorData.trad,
              }
          end

          table.insert(groupedWeapons.AssaultRifles[assault_rifleData.name].recordIDs, assault_rifleData.recordID)
      end
--
  for _, assault_rifle_liberty in ipairs(weapons.assault_rifles_liberty) do 
      local assault_rifleData_liberty = {
          recordID = assault_rifle_liberty[1],
          name = assault_rifle_liberty[2],
          acquisitionID = assault_rifle_liberty[3],
          vendorID = assault_rifle_liberty[4]
      }

      local acquisitionData = translationstests[assault_rifleData_liberty.acquisitionID] or { en = "", trad = "" }
      local vendorData = translationstests[assault_rifleData_liberty.vendorID] or { en = "", trad = "" }

      if not groupedWeapons.AssaultRifles_liberty[assault_rifleData_liberty.name] then
          groupedWeapons.AssaultRifles_liberty[assault_rifleData_liberty.name] = {
              recordIDs = {},
              acquisitionen = acquisitionData.en,
              acquisitiontrad = acquisitionData.trad,
              vendoren = vendorData.en,
              vendorentrad = vendorData.trad,
          }
      end

      table.insert(groupedWeapons.AssaultRifles_liberty[assault_rifleData_liberty.name].recordIDs, assault_rifleData_liberty.recordID)
  end
  for _, assault_rifle_quest_liberty in ipairs(weapons.assault_rifles_quest_liberty) do 
      local assault_rifleData_quest_liberty = {
          recordID = assault_rifle_quest_liberty[1],
          name = assault_rifle_quest_liberty[2],
          acquisitionID = assault_rifle_quest_liberty[3],
          vendorID = assault_rifle_quest_liberty[4]
      }

      local acquisitionData = translationstests[assault_rifleData_quest_liberty.acquisitionID] or { en = "", trad = "" }
      local vendorData = translationstests[assault_rifleData_quest_liberty.vendorID] or { en = "", trad = "" }

      if not groupedWeapons.AssaultRifles_quest_liberty[assault_rifleData_quest_liberty.name] then
          groupedWeapons.AssaultRifles_quest_liberty[assault_rifleData_quest_liberty.name] = {
              recordIDs = {},
              acquisitionen = acquisitionData.en,
              acquisitiontrad = acquisitionData.trad,
              vendoren = vendorData.en,
              vendorentrad = vendorData.trad,
          }
      end

      table.insert(groupedWeapons.AssaultRifles_quest_liberty[assault_rifleData_quest_liberty.name].recordIDs, assault_rifleData_quest_liberty.recordID)
  end
  for _, assault_rifle_quest in ipairs(weapons.assault_rifles_quest) do 
      local assault_rifleData_quest = {
          recordID = assault_rifle_quest[1],
          name = assault_rifle_quest[2],
          acquisitionID = assault_rifle_quest[3],
          vendorID = assault_rifle_quest[4]
      }

      local acquisitionData = translationstests[assault_rifleData_quest.acquisitionID] or { en = "", trad = "" }
      local vendorData = translationstests[assault_rifleData_quest.vendorID] or { en = "", trad = "" }

      if not groupedWeapons.AssaultRifles_quest[assault_rifleData_quest.name] then
          groupedWeapons.AssaultRifles_quest[assault_rifleData_quest.name] = {
              recordIDs = {},
              acquisitionen = acquisitionData.en,
              acquisitiontrad = acquisitionData.trad,
              vendoren = vendorData.en,
              vendorentrad = vendorData.trad,
          }
      end

      table.insert(groupedWeapons.AssaultRifles_quest[assault_rifleData_quest.name].recordIDs, assault_rifleData_quest.recordID)
  end

  for _, precision_rifle in ipairs(weapons.precision_rifles) do 
    local precision_rifleData = {
        recordID = precision_rifle[1],
        name = precision_rifle[2],
        acquisitionID = precision_rifle[3],
        vendorID = precision_rifle[4]
    }

    local acquisitionData = translationstests[precision_rifleData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[precision_rifleData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.PrecisionRifles[precision_rifleData.name] then
        groupedWeapons.PrecisionRifles[precision_rifleData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.PrecisionRifles[precision_rifleData.name].recordIDs, precision_rifleData.recordID)
  end
  for _, precision_rifle_liberty in ipairs(weapons.precision_rifles_liberty) do 
    local precision_rifleData_liberty = {
        recordID = precision_rifle_liberty[1],
        name = precision_rifle_liberty[2],
        acquisitionID = precision_rifle_liberty[3],
        vendorID = precision_rifle_liberty[4]
    }

    local acquisitionData = translationstests[precision_rifleData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[precision_rifleData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.PrecisionRifles_liberty[precision_rifleData_liberty.name] then
        groupedWeapons.PrecisionRifles_liberty[precision_rifleData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.PrecisionRifles_liberty[precision_rifleData_liberty.name].recordIDs, precision_rifleData_liberty.recordID)
  end
  for _, precision_rifle_quest in ipairs(weapons.precision_rifles_quest) do 
    local precision_rifleData_quest = {
        recordID = precision_rifle_quest[1],
        name = precision_rifle_quest[2],
        acquisitionID = precision_rifle_quest[3],
        vendorID = precision_rifle_quest[4]
    }

    local acquisitionData = translationstests[precision_rifleData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[precision_rifleData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.PrecisionRifles_quest[precision_rifleData_quest.name] then
        groupedWeapons.PrecisionRifles_quest[precision_rifleData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.PrecisionRifles_quest[precision_rifleData_quest.name].recordIDs, precision_rifleData_quest.recordID)
  end

  for _, sniper_rifle in ipairs(weapons.sniper_rifles) do 
    local sniper_rifleData = {
        recordID = sniper_rifle[1],
        name = sniper_rifle[2],
        acquisitionID = sniper_rifle[3],
        vendorID = sniper_rifle[4]
    }

    local acquisitionData = translationstests[sniper_rifleData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[sniper_rifleData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.SniperRifles[sniper_rifleData.name] then
        groupedWeapons.SniperRifles[sniper_rifleData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.SniperRifles[sniper_rifleData.name].recordIDs, sniper_rifleData.recordID)
  end
  for _, sniper_rifle_liberty in ipairs(weapons.sniper_rifles_liberty) do 
    local sniper_rifleData_liberty = {
        recordID = sniper_rifle_liberty[1],
        name = sniper_rifle_liberty[2],
        acquisitionID = sniper_rifle_liberty[3],
        vendorID = sniper_rifle_liberty[4]
    }

    local acquisitionData = translationstests[sniper_rifleData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[sniper_rifleData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.SniperRifles_liberty[sniper_rifleData_liberty.name] then
        groupedWeapons.SniperRifles_liberty[sniper_rifleData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.SniperRifles_liberty[sniper_rifleData_liberty.name].recordIDs, sniper_rifleData_liberty.recordID)
  end
  for _, sniper_rifle_quest_liberty in ipairs(weapons.sniper_rifles_quest_liberty) do 
    local sniper_rifleData_quest_liberty = {
        recordID = sniper_rifle_quest_liberty[1],
        name = sniper_rifle_quest_liberty[2],
        acquisitionID = sniper_rifle_quest_liberty[3],
        vendorID = sniper_rifle_quest_liberty[4]
    }

    local acquisitionData = translationstests[sniper_rifleData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[sniper_rifleData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.SniperRifles_quest_liberty[sniper_rifleData_quest_liberty.name] then
        groupedWeapons.SniperRifles_quest_liberty[sniper_rifleData_quest_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.SniperRifles_quest_liberty[sniper_rifleData_quest_liberty.name].recordIDs, sniper_rifleData_quest_liberty.recordID)
  end
  for _, sniper_rifle_quest in ipairs(weapons.sniper_rifles_quest) do 
    local sniper_rifleData_quest = {
        recordID = sniper_rifle_quest[1],
        name = sniper_rifle_quest[2],
        acquisitionID = sniper_rifle_quest[3],
        vendorID = sniper_rifle_quest[4]
    }

    local acquisitionData = translationstests[sniper_rifleData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[sniper_rifleData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.SniperRifles_quest[sniper_rifleData_quest.name] then
        groupedWeapons.SniperRifles_quest[sniper_rifleData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.SniperRifles_quest[sniper_rifleData_quest.name].recordIDs, sniper_rifleData_quest.recordID)
  end

  for _, shotgun in ipairs(weapons.shotguns) do 
    local shotgunData = {
        recordID = shotgun[1],
        name = shotgun[2],
        acquisitionID = shotgun[3],
        vendorID = shotgun[4]
    }

    local acquisitionData = translationstests[shotgunData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[shotgunData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Shotguns[shotgunData.name] then
        groupedWeapons.Shotguns[shotgunData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Shotguns[shotgunData.name].recordIDs, shotgunData.recordID)
  end
  for _, shotgun_liberty in ipairs(weapons.shotguns_liberty) do 
    local shotgunData_liberty = {
        recordID = shotgun_liberty[1],
        name = shotgun_liberty[2],
        acquisitionID = shotgun_liberty[3],
        vendorID = shotgun_liberty[4]
    }

    local acquisitionData = translationstests[shotgunData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[shotgunData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Shotguns_liberty[shotgunData_liberty.name] then
        groupedWeapons.Shotguns_liberty[shotgunData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Shotguns_liberty[shotgunData_liberty.name].recordIDs, shotgunData_liberty.recordID)
  end
  for _, shotgun_quest_liberty in ipairs(weapons.shotguns_quest_liberty) do 
    local shotgunData_quest_liberty = {
        recordID = shotgun_quest_liberty[1],
        name = shotgun_quest_liberty[2],
        acquisitionID = shotgun_quest_liberty[3],
        vendorID = shotgun_quest_liberty[4]
    }

    local acquisitionData = translationstests[shotgunData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[shotgunData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Shotguns_quest_liberty[shotgunData_quest_liberty.name] then
        groupedWeapons.Shotguns_quest_liberty[shotgunData_quest_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Shotguns_quest_liberty[shotgunData_quest_liberty.name].recordIDs, shotgunData_quest_liberty.recordID)
  end
  for _, shotgun_quest in ipairs(weapons.shotguns_quest) do 
    local shotgunData_quest = {
        recordID = shotgun_quest[1],
        name = shotgun_quest[2],
        acquisitionID = shotgun_quest[3],
        vendorID = shotgun_quest[4]
    }

    local acquisitionData = translationstests[shotgunData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[shotgunData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Shotguns_quest[shotgunData_quest.name] then
        groupedWeapons.Shotguns_quest[shotgunData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Shotguns_quest[shotgunData_quest.name].recordIDs, shotgunData_quest.recordID)
  end

  for _, smg in ipairs(weapons.smgs) do 
    local smgData = {
        recordID = smg[1],
        name = smg[2],
        acquisitionID = smg[3],
        vendorID = smg[4]
    }

    local acquisitionData = translationstests[smgData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[smgData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Smgs[smgData.name] then
        groupedWeapons.Smgs[smgData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Smgs[smgData.name].recordIDs, smgData.recordID)
  end
  for _, smg_liberty in ipairs(weapons.smgs_liberty) do 
    local smgData_liberty = {
        recordID = smg_liberty[1],
        name = smg_liberty[2],
        acquisitionID = smg_liberty[3],
        vendorID = smg_liberty[4]
    }

    local acquisitionData = translationstests[smgData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[smgData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Smgs_liberty[smgData_liberty.name] then
        groupedWeapons.Smgs_liberty[smgData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Smgs_liberty[smgData_liberty.name].recordIDs, smgData_liberty.recordID)
  end
  for _, smg_quest_liberty in ipairs(weapons.smgs_quest_liberty) do 
    local smgData_quest_liberty = {
        recordID = smg_quest_liberty[1],
        name = smg_quest_liberty[2],
        acquisitionID = smg_quest_liberty[3],
        vendorID = smg_quest_liberty[4]
    }

    local acquisitionData = translationstests[smgData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[smgData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Smgs_quest_liberty[smgData_quest_liberty.name] then
        groupedWeapons.Smgs_quest_liberty[smgData_quest_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Smgs_quest_liberty[smgData_quest_liberty.name].recordIDs, smgData_quest_liberty.recordID)
  end
  for _, smg_quest in ipairs(weapons.smgs_quest) do 
    local smgData_quest = {
        recordID = smg_quest[1],
        name = smg_quest[2],
        acquisitionID = smg_quest[3],
        vendorID = smg_quest[4]
    }

    local acquisitionData = translationstests[smgData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[smgData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Smgs_quest[smgData_quest.name] then
        groupedWeapons.Smgs_quest[smgData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Smgs_quest[smgData_quest.name].recordIDs, smgData_quest.recordID)
  end

  for _, hmg in ipairs(weapons.hmgs) do 
    local hmgData = {
        recordID = hmg[1],
        name = hmg[2],
        acquisitionID = hmg[3],
        vendorID = hmg[4]
    }

    local acquisitionData = translationstests[hmgData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[hmgData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Hmgs[hmgData.name] then
        groupedWeapons.Hmgs[hmgData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Hmgs[hmgData.name].recordIDs, hmgData.recordID)
  end
  for _, hmg_liberty in ipairs(weapons.hmgs_liberty) do 
    local hmgData_liberty = {
        recordID = hmg_liberty[1],
        name = hmg_liberty[2],
        acquisitionID = hmg_liberty[3],
        vendorID = hmg_liberty[4]
    }

    local acquisitionData = translationstests[hmgData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[hmgData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Hmgs_liberty[hmgData_liberty.name] then
        groupedWeapons.Hmgs_liberty[hmgData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Hmgs_liberty[hmgData_liberty.name].recordIDs, hmgData_liberty.recordID)
  end
  for _, hmg_quest_liberty in ipairs(weapons.hmgs_quest_liberty) do 
    local hmgData_quest_liberty = {
        recordID = hmg_quest_liberty[1],
        name = hmg_quest_liberty[2],
        acquisitionID = hmg_quest_liberty[3],
        vendorID = hmg_quest_liberty[4]
    }

    local acquisitionData = translationstests[hmgData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[hmgData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Hmgs_quest_liberty[hmgData_quest_liberty.name] then
        groupedWeapons.Hmgs_quest_liberty[hmgData_quest_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Hmgs_quest_liberty[hmgData_quest_liberty.name].recordIDs, hmgData_quest_liberty.recordID)
  end

  for _, grenade in ipairs(weapons.grenades) do 
    local grenadeData = {
        recordID = grenade[1],
        name = grenade[2],
        acquisitionID = grenade[3],
        vendorID = grenade[4]
    }

    local acquisitionData = translationstests[grenadeData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[grenadeData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Grenades[grenadeData.name] then
        groupedWeapons.Grenades[grenadeData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Grenades[grenadeData.name].recordIDs, grenadeData.recordID)
  end
  for _, grenade_quest in ipairs(weapons.grenades_quest) do 
    local grenadeData_quest = {
        recordID = grenade_quest[1],
        name = grenade_quest[2],
        acquisitionID = grenade_quest[3],
        vendorID = grenade_quest[4]
    }

    local acquisitionData = translationstests[grenadeData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[grenadeData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Grenades_quest[grenadeData_quest.name] then
        groupedWeapons.Grenades_quest[grenadeData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Grenades_quest[grenadeData_quest.name].recordIDs, grenadeData_quest.recordID)
  end

  for _, axe in ipairs(weapons.axes) do 
    local axeData = {
        recordID = axe[1],
        name = axe[2],
        acquisitionID = axe[3],
        vendorID = axe[4]
    }

    local acquisitionData = translationstests[axeData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[axeData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Axes[axeData.name] then
        groupedWeapons.Axes[axeData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Axes[axeData.name].recordIDs, axeData.recordID)
  end
  for _, axe_liberty in ipairs(weapons.axes_liberty) do 
    local axeData_liberty = {
        recordID = axe_liberty[1],
        name = axe_liberty[2],
        acquisitionID = axe_liberty[3],
        vendorID = axe_liberty[4]
    }

    local acquisitionData = translationstests[axeData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[axeData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Axes_liberty[axeData_liberty.name] then
        groupedWeapons.Axes_liberty[axeData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Axes_liberty[axeData_liberty.name].recordIDs, axeData_liberty.recordID)
  end
  for _, axe_quest_liberty in ipairs(weapons.axes_quest_liberty) do 
    local axeData_quest_liberty = {
        recordID = axe_quest_liberty[1],
        name = axe_quest_liberty[2],
        acquisitionID = axe_quest_liberty[3],
        vendorID = axe_quest_liberty[4]
    }

    local acquisitionData = translationstests[axeData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[axeData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Axes_quest_liberty[axeData_quest_liberty.name] then
        groupedWeapons.Axes_quest_liberty[axeData_quest_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Axes_quest_liberty[axeData_quest_liberty.name].recordIDs, axeData_quest_liberty.recordID)
  end

  for _, chainsword in ipairs(weapons.chainswords) do 
    local chainswordData = {
        recordID = chainsword[1],
        name = chainsword[2],
        acquisitionID = chainsword[3],
        vendorID = chainsword[4]
    }

    local acquisitionData = translationstests[chainswordData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[chainswordData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Chainswords[chainswordData.name] then
        groupedWeapons.Chainswords[chainswordData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Chainswords[chainswordData.name].recordIDs, chainswordData.recordID)
  end
  for _, chainsword_liberty in ipairs(weapons.chainswords_liberty) do 
    local chainswordData_liberty = {
        recordID = chainsword_liberty[1],
        name = chainsword_liberty[2],
        acquisitionID = chainsword_liberty[3],
        vendorID = chainsword_liberty[4]
    }

    local acquisitionData = translationstests[chainswordData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[chainswordData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Chainswords_liberty[chainswordData_liberty.name] then
        groupedWeapons.Chainswords_liberty[chainswordData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Chainswords_liberty[chainswordData_liberty.name].recordIDs, chainswordData_liberty.recordID)
  end

  for _, katana in ipairs(weapons.katanas) do 
    local katanaData = {
        recordID = katana[1],
        name = katana[2],
        acquisitionID = katana[3],
        vendorID = katana[4]
    }

    local acquisitionData = translationstests[katanaData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[katanaData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Katanas[katanaData.name] then
        groupedWeapons.Katanas[katanaData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Katanas[katanaData.name].recordIDs, katanaData.recordID)
  end
  for _, katana_quest in ipairs(weapons.katanas_quest) do 
    local katanaData_quest = {
        recordID = katana_quest[1],
        name = katana_quest[2],
        acquisitionID = katana_quest[3],
        vendorID = katana_quest[4]
    }

    local acquisitionData = translationstests[katanaData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[katanaData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Katanas_quest[katanaData_quest.name] then
        groupedWeapons.Katanas_quest[katanaData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Katanas_quest[katanaData_quest.name].recordIDs, katanaData_quest.recordID)
  end

  for _, knive in ipairs(weapons.knives) do 
    local kniveData = {
        recordID = knive[1],
        name = knive[2],
        acquisitionID = knive[3],
        vendorID = knive[4]
    }

    local acquisitionData = translationstests[kniveData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[kniveData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Knives[kniveData.name] then
        groupedWeapons.Knives[kniveData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Knives[kniveData.name].recordIDs, kniveData.recordID)
  end
  for _, knive_quest_liberty in ipairs(weapons.knives_quest_liberty) do 
    local kniveData_quest_liberty = {
        recordID = knive_quest_liberty[1],
        name = knive_quest_liberty[2],
        acquisitionID = knive_quest_liberty[3],
        vendorID = knive_quest_liberty[4]
    }

    local acquisitionData = translationstests[kniveData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[kniveData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Knives_quest_liberty[kniveData_quest_liberty.name] then
        groupedWeapons.Knives_quest_liberty[kniveData_quest_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Knives_quest_liberty[kniveData_quest_liberty.name].recordIDs, kniveData_quest_liberty.recordID)
  end
  for _, knive_quest in ipairs(weapons.knives_quest) do 
    local kniveData_quest = {
        recordID = knive_quest[1],
        name = knive_quest[2],
        acquisitionID = knive_quest[3],
        vendorID = knive_quest[4]
    }

    local acquisitionData = translationstests[kniveData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[kniveData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Knives_quest[kniveData_quest.name] then
        groupedWeapons.Knives_quest[kniveData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Knives_quest[kniveData_quest.name].recordIDs, kniveData_quest.recordID)
  end

  for _, machete in ipairs(weapons.machetes) do 
    local macheteData = {
        recordID = machete[1],
        name = machete[2],
        acquisitionID = machete[3],
        vendorID = machete[4]
    }

    local acquisitionData = translationstests[macheteData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[macheteData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Machetes[macheteData.name] then
        groupedWeapons.Machetes[macheteData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Machetes[macheteData.name].recordIDs, macheteData.recordID)
  end
  for _, machete_liberty in ipairs(weapons.machetes_liberty) do 
    local macheteData_liberty = {
        recordID = machete_liberty[1],
        name = machete_liberty[2],
        acquisitionID = machete_liberty[3],
        vendorID = machete_liberty[4]
    }

    local acquisitionData = translationstests[macheteData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[macheteData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Machetes_liberty[macheteData_liberty.name] then
        groupedWeapons.Machetes_liberty[macheteData_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Machetes_liberty[macheteData_liberty.name].recordIDs, macheteData_liberty.recordID)
  end
  for _, machete_quest_liberty in ipairs(weapons.machetes_quest_liberty) do 
    local macheteData_quest_liberty = {
        recordID = machete_quest_liberty[1],
        name = machete_quest_liberty[2],
        acquisitionID = machete_quest_liberty[3],
        vendorID = machete_quest_liberty[4]
    }

    local acquisitionData = translationstests[macheteData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[macheteData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Machetes_quest_liberty[macheteData_quest_liberty.name] then
        groupedWeapons.Machetes_quest_liberty[macheteData_quest_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Machetes_quest_liberty[macheteData_quest_liberty.name].recordIDs, macheteData_quest_liberty.recordID)
  end

  for _, sword in ipairs(weapons.swords) do 
    local swordData = {
        recordID = sword[1],
        name = sword[2],
        acquisitionID = sword[3],
        vendorID = sword[4]
    }

    local acquisitionData = translationstests[swordData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[swordData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Swords[swordData.name] then
        groupedWeapons.Swords[swordData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Swords[swordData.name].recordIDs, swordData.recordID)
  end

  for _, hammer in ipairs(weapons.hammers) do 
    local hammerData = {
        recordID = hammer[1],
        name = hammer[2],
        acquisitionID = hammer[3],
        vendorID = hammer[4]
    }

    local acquisitionData = translationstests[hammerData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[hammerData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Hammers[hammerData.name] then
        groupedWeapons.Hammers[hammerData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Hammers[hammerData.name].recordIDs, hammerData.recordID)
  end
  for _, hammer_quest in ipairs(weapons.hammers_quest) do 
    local hammerData_quest = {
        recordID = hammer_quest[1],
        name = hammer_quest[2],
        acquisitionID = hammer_quest[3],
        vendorID = hammer_quest[4]
    }

    local acquisitionData = translationstests[hammerData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[hammerData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.Hammers_quest[hammerData_quest.name] then
        groupedWeapons.Hammers_quest[hammerData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.Hammers_quest[hammerData_quest.name].recordIDs, hammerData_quest.recordID)
  end

  for _, onehandedclub in ipairs(weapons.one_handed_clubs) do 
    local onehandedclubData = {
        recordID = onehandedclub[1],
        name = onehandedclub[2],
        acquisitionID = onehandedclub[3],
        vendorID = onehandedclub[4]
    }

    local acquisitionData = translationstests[onehandedclubData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[onehandedclubData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.OneHandedClubs[onehandedclubData.name] then
        groupedWeapons.OneHandedClubs[onehandedclubData.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.OneHandedClubs[onehandedclubData.name].recordIDs, onehandedclubData.recordID)
  end
  for _, onehandedclub_quest_liberty in ipairs(weapons.one_handed_clubs_quest_liberty) do 
    local onehandedclubData_quest_liberty = {
        recordID = onehandedclub_quest_liberty[1],
        name = onehandedclub_quest_liberty[2],
        acquisitionID = onehandedclub_quest_liberty[3],
        vendorID = onehandedclub_quest_liberty[4]
    }

    local acquisitionData = translationstests[onehandedclubData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[onehandedclubData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.OneHandedClubs_quest_liberty[onehandedclubData_quest_liberty.name] then
        groupedWeapons.OneHandedClubs_quest_liberty[onehandedclubData_quest_liberty.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.OneHandedClubs_quest_liberty[onehandedclubData_quest_liberty.name].recordIDs, onehandedclubData_quest_liberty.recordID)
  end
  for _, onehandedclub_quest in ipairs(weapons.one_handed_clubs_quest) do 
    local onehandedclubData_quest = {
        recordID = onehandedclub_quest[1],
        name = onehandedclub_quest[2],
        acquisitionID = onehandedclub_quest[3],
        vendorID = onehandedclub_quest[4]
    }

    local acquisitionData = translationstests[onehandedclubData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[onehandedclubData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.OneHandedClubs_quest[onehandedclubData_quest.name] then
        groupedWeapons.OneHandedClubs_quest[onehandedclubData_quest.name] = {
            recordIDs = {},
            acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.OneHandedClubs_quest[onehandedclubData_quest.name].recordIDs, onehandedclubData_quest.recordID)
  end

  for _, twohandedclub in ipairs(weapons.two_handed_clubs) do 
    local twohandedclubData = {
        recordID = twohandedclub[1],
        name = twohandedclub[2],
        acquisitionID = twohandedclub[3],
        vendorID = twohandedclub[4]
    }

    local acquisitionData = translationstests[twohandedclubData.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[twohandedclubData.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.TwoHandedClubs[twohandedclubData.name] then
        groupedWeapons.TwoHandedClubs[twohandedclubData.name] = {
            recordIDs = {},
            acquisititwon = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.TwoHandedClubs[twohandedclubData.name].recordIDs, twohandedclubData.recordID)
  end
  for _, twohandedclub_liberty in ipairs(weapons.two_handed_clubs_liberty) do 
    local twohandedclubData_liberty = {
        recordID = twohandedclub_liberty[1],
        name = twohandedclub_liberty[2],
        acquisitionID = twohandedclub_liberty[3],
        vendorID = twohandedclub_liberty[4]
    }

    local acquisitionData = translationstests[twohandedclubData_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[twohandedclubData_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.TwoHandedClubs_liberty[twohandedclubData_liberty.name] then
        groupedWeapons.TwoHandedClubs_liberty[twohandedclubData_liberty.name] = {
            recordIDs = {},
            acquisititwon = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.TwoHandedClubs_liberty[twohandedclubData_liberty.name].recordIDs, twohandedclubData_liberty.recordID)
  end
  for _, twohandedclub_quest_liberty in ipairs(weapons.two_handed_clubs_quest_liberty) do 
    local twohandedclubData_quest_liberty = {
        recordID = twohandedclub_quest_liberty[1],
        name = twohandedclub_quest_liberty[2],
        acquisitionID = twohandedclub_quest_liberty[3],
        vendorID = twohandedclub_quest_liberty[4]
    }

    local acquisitionData = translationstests[twohandedclubData_quest_liberty.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[twohandedclubData_quest_liberty.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.TwoHandedClubs_quest_liberty[twohandedclubData_quest_liberty.name] then
        groupedWeapons.TwoHandedClubs_quest_liberty[twohandedclubData_quest_liberty.name] = {
            recordIDs = {},
            acquisititwon = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.TwoHandedClubs_quest_liberty[twohandedclubData_quest_liberty.name].recordIDs, twohandedclubData_quest_liberty.recordID)
  end
  for _, twohandedclub_quest in ipairs(weapons.two_handed_clubs_quest) do 
    local twohandedclubData_quest = {
        recordID = twohandedclub_quest[1],
        name = twohandedclub_quest[2],
        acquisitionID = twohandedclub_quest[3],
        vendorID = twohandedclub_quest[4]
    }

    local acquisitionData = translationstests[twohandedclubData_quest.acquisitionID] or { en = "", trad = "" }
    local vendorData = translationstests[twohandedclubData_quest.vendorID] or { en = "", trad = "" }

    if not groupedWeapons.TwoHandedClubs_quest[twohandedclubData_quest.name] then
        groupedWeapons.TwoHandedClubs_quest[twohandedclubData_quest.name] = {
            recordIDs = {},
            acquisititwon = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad,
            vendoren = vendorData.en,
            vendorentrad = vendorData.trad,
        }
    end

    table.insert(groupedWeapons.TwoHandedClubs_quest[twohandedclubData_quest.name].recordIDs, twohandedclubData_quest.recordID)
end

-- Weaponsui.knownWeaponIDs = {}
-- function Weaponsui.BuildWeaponIndex()
--     for _, weaponGroup in pairs(groupedWeapons) do
--         for name, data in pairs(weaponGroup) do
--             for _, recordID in ipairs(data.recordIDs or {}) do
--                 Weaponsui.knownWeaponIDs[recordID] = name
--             end
--         end
--     end
-- end

-- Weaponsui.BuildWeaponIndex()
Weaponsui.inventoryCache = {}
-- Weaponsui.oldInventoryCache = {}
-- Weaponsui.toast = nil
-- Weaponsui.initialized = false

-- function Weaponsui.UpdateInventoryCache()
--   local transactionSystem = Game.GetTransactionSystem()
--   local player = GetPlayer()
--   local newItems = {}
--     Weaponsui.inventoryCache = Weaponsui.inventoryCache or {}
--   -- On ne copie pas tout l'inventaire, on vérifie seulement les nouveaux items
--   local function checkAndAddItems(entity)
--     local success, items = transactionSystem:GetItemList(entity)
--     if success and items then
--       for _, item in ipairs(items) do
--         local recordID = item:GetID().id.value
--         -- Si l'item n'était pas dans le cache précédent, c'est un nouvel item
--         if not Weaponsui.inventoryCache[recordID] and Weaponsui.knownWeaponIDs[recordID] then
--           table.insert(newItems, recordID)
--         end
--         -- On met à jour le cache courant
--         Weaponsui.inventoryCache[recordID] = true
--       end
--     end
--   end

--   -- On garde une copie du cache précédent
--     --   Weaponsui.oldInventoryCache = Weaponsui.inventoryCache or {}
--     --   Weaponsui.inventoryCache = {}

--   checkAndAddItems(player)
--   local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
--   checkAndAddItems(stash)

--   -- Ne notifier qu'une seule fois au démarrage
--   if not Weaponsui.initialized then
--     Weaponsui.initialized = true
--     return
--   end

--   if #newItems > 0 then
--     Weaponsui.NotifyNewItems(newItems)
--   end
-- end
-- function Weaponsui.UpdateInventoryCache()
--     Weaponsui.inventoryCache = {}
--     local transactionSystem = Game.GetTransactionSystem()
--     local player = GetPlayer()

--     if not transactionSystem or not player then
--         print("❌ ERREUR : Impossible d'obtenir `Game.GetTransactionSystem()` ou `GetPlayer()`.")
--         return
--     end

--     -- 🔍 Vérifie les items du joueur
--     local success, playerItems = transactionSystem:GetItemList(player)
--     if success and playerItems then
--         for _, item in ipairs(playerItems) do
--             local itemRecordID = item:GetID().id.value
--             Weaponsui.inventoryCache[itemRecordID] = true
--         end
--     end

--     -- 🔍 Vérifie les items du coffre
--     local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
--     if stash then
--         local stashSuccess, stashItems = transactionSystem:GetItemList(stash)
--         if stashSuccess and stashItems then
--             for _, item in ipairs(stashItems) do
--                 local itemRecordID = item:GetID().id.value
--                 Weaponsui.inventoryCache[itemRecordID] = true
--             end
--         end
--     end
-- end
function Weaponsui.UpdateInventoryCache()
    Weaponsui.inventoryCache = {}
    local transactionSystem = Game.GetTransactionSystem()
    local player = GetPlayer()

    if not transactionSystem or not player then
        print("❌ ERREUR : Impossible d'obtenir `Game.GetTransactionSystem()` ou `GetPlayer()`.")
        return
    end

    -- 🔍 Vérifie les items du joueur
    local success, playerItems = transactionSystem:GetItemList(player)
    if success and playerItems then
        for _, item in ipairs(playerItems) do
            local itemRecordID = item:GetID().id.value
            Weaponsui.inventoryCache[itemRecordID] = true
        end
    end

    -- 🔍 Vérifie les items du coffre
    local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
    if stash then
        local stashSuccess, stashItems = transactionSystem:GetItemList(stash)
        if stashSuccess and stashItems then
            for _, item in ipairs(stashItems) do
                local itemRecordID = item:GetID().id.value
                Weaponsui.inventoryCache[itemRecordID] = true
            end
        end
    end
end

-- function Weaponsui.UpdateInventoryCache()
--     Weaponsui.oldInventoryCache = Weaponsui.inventoryCache or {}
--     Weaponsui.inventoryCache = {}

--     local transactionSystem = Game.GetTransactionSystem()
--     local player = GetPlayer()

--     local newItems = {} 

--     local function checkAndAddItems(entity)
--         local success, items = transactionSystem:GetItemList(entity)
--         if success and items then
--             for _, item in ipairs(items) do
--                 local recordID = item:GetID().id.value
--                 Weaponsui.inventoryCache[recordID] = true

--                 if not Weaponsui.oldInventoryCache[recordID] and Weaponsui.knownWeaponIDs[recordID] then
--                     table.insert(newItems, recordID)
--                 end
--             end
--         end
--     end

--     checkAndAddItems(player)
--     local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
--     checkAndAddItems(stash)

--     if not Weaponsui.initialized then
--         Weaponsui.initialized = true
--         return
--     end

--     if #newItems > 0 then
--         Weaponsui.NotifyNewItems(newItems)
--     end
-- end

-- function Weaponsui.NotifyNewItems(recordIDs)
--     if ATT.enableNotifications then return end

--     local notified = {}

--     local newlyDiscoveredNames = {}

--     for _, recordID in ipairs(recordIDs) do
--         local name = Weaponsui.knownWeaponIDs[recordID]
--         if name then
--             newlyDiscoveredNames[name] = true
--         end
--     end

--     for name, _ in pairs(newlyDiscoveredNames) do
--         local found = false
--         local group = groupedWeapons 
--         for _, data in pairs(group) do
--             if data[name] then
--                 for _, id in ipairs(data[name].recordIDs) do
--                     if Weaponsui.oldInventoryCache[id] then
--                         found = true 
--                         break
--                     end
--                 end
--             end
--             if found then break end
--         end

--         if not found then
--             ATT.GameHUD.ShowMessage(T("ATT_Collected_Item") .. ":\n" .. name)
--         end
--     end
-- end

function Weaponsui.CheckInStashAndInventory(recordID)
    return Weaponsui.inventoryCache[recordID] or false
    
end

function Weaponsui.displayWeaponGroup(name, group)
  
  
    local width, _ = ImGui.GetContentRegionAvail()

    for weaponName, data in pairs(group) do
        local inInventory = false
        for _, recordID in ipairs(data.recordIDs or {}) do
            if Weaponsui.CheckInStashAndInventory(recordID) then
                inInventory = true
                break
            end
        end
        if ATT.hideOwnedItems and inInventory then
            goto continue  
        end
        if ATT.hideUnownedItems and not inInventory then
            goto continue  
        end

        if inInventory then
            ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.0, 1.0)
        else
            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.0, 0.0, 1.0)
        end

        if ImGui.Selectable(weaponName, Weaponsui.selectedName == weaponName) then
            Weaponsui.selectedName = weaponName
        end

        ImGui.PopStyleColor()
        ::continue::
    end
end
function Weaponsui.CountOwnedWeapons(group)
    Weaponsui.ownedCount = 0
    Weaponsui.totalCount = 0
  
    for _, data in pairs(group or {}) do
        Weaponsui.totalCount = Weaponsui.totalCount + 1
        for _, recordID in ipairs(data.recordIDs) do
            if Weaponsui.CheckInStashAndInventory(recordID) then
                Weaponsui.ownedCount = Weaponsui.ownedCount + 1
                break
            end
        end
    end
  
    return Weaponsui.ownedCount, Weaponsui.totalCount
end

function Weaponsui.count()
    Weaponsui.ownedHandguns, Weaponsui.totalHandguns = Weaponsui.CountOwnedWeapons(groupedWeapons.Handguns)
    Weaponsui.ownedHandguns_quest, Weaponsui.totalHandguns_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.Handguns_quest)
    
    Weaponsui.ownedRevolvers, Weaponsui.totalRevolvers = Weaponsui.CountOwnedWeapons(groupedWeapons.Revolvers)
    Weaponsui.ownedRevolvers_quest, Weaponsui.totalRevolvers_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.Revolvers_quest)
    
    Weaponsui.ownedAssaultRifles, Weaponsui.totalAssaultRifles = Weaponsui.CountOwnedWeapons(groupedWeapons.AssaultRifles)
    Weaponsui.ownedAssaultRifles_quest, Weaponsui.totalAssaultRifles_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.AssaultRifles_quest)
    
    Weaponsui.ownedPrecisionRifles, Weaponsui.totalPrecisionRifles = Weaponsui.CountOwnedWeapons(groupedWeapons.PrecisionRifles)
    Weaponsui.ownedPrecisionRifles_quest, Weaponsui.totalPrecisionRifles_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.PrecisionRifles_quest)
    
    Weaponsui.ownedSniperRifles, Weaponsui.totalSniperRifles = Weaponsui.CountOwnedWeapons(groupedWeapons.SniperRifles)
    Weaponsui.ownedSniperRifles_quest, Weaponsui.totalSniperRifles_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.SniperRifles_quest)
    
    Weaponsui.ownedShotguns, Weaponsui.totalShotguns = Weaponsui.CountOwnedWeapons(groupedWeapons.Shotguns)
    Weaponsui.ownedShotguns_quest, Weaponsui.totalShotguns_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.Shotguns_quest)
    
    Weaponsui.ownedSmgs, Weaponsui.totalSmgs = Weaponsui.CountOwnedWeapons(groupedWeapons.Smgs)
    Weaponsui.ownedSmgs_quest, Weaponsui.totalSmgs_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.Smgs_quest)
    
    Weaponsui.ownedHmgs, Weaponsui.totalHmgs = Weaponsui.CountOwnedWeapons(groupedWeapons.Hmgs)
    
    Weaponsui.ownedGrenades, Weaponsui.totalGrenades = Weaponsui.CountOwnedWeapons(groupedWeapons.Grenades)
    Weaponsui.ownedGrenades_quest, Weaponsui.totalGrenades_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.Grenades_quest)

    Weaponsui.ownedTotalHandguns = (Weaponsui.ownedHandguns or 0) + (Weaponsui.ownedHandguns_quest or 0)
    Weaponsui.totalHandguns = (Weaponsui.totalHandguns or 0) + (Weaponsui.totalHandguns_quest or 0)
    
    Weaponsui.ownedTotalRevolvers = (Weaponsui.ownedRevolvers or 0) + (Weaponsui.ownedRevolvers_quest or 0)
    Weaponsui.totalRevolvers = (Weaponsui.totalRevolvers or 0) + (Weaponsui.totalRevolvers_quest or 0)
    
    Weaponsui.ownedTotalAssaultRifles = (Weaponsui.ownedAssaultRifles or 0) + (Weaponsui.ownedAssaultRifles_quest or 0)
    Weaponsui.totalAssaultRifles = (Weaponsui.totalAssaultRifles or 0) + (Weaponsui.totalAssaultRifles_quest or 0)
    
    Weaponsui.ownedTotalPrecisionRifles = (Weaponsui.ownedPrecisionRifles or 0) + (Weaponsui.ownedPrecisionRifles_quest or 0)
    Weaponsui.totalPrecisionRifles = (Weaponsui.totalPrecisionRifles or 0) + (Weaponsui.totalPrecisionRifles_quest or 0)
    
    Weaponsui.ownedTotalSniperRifles = (Weaponsui.ownedSniperRifles or 0) + (Weaponsui.ownedSniperRifles_quest or 0)
    Weaponsui.totalSniperRifles = (Weaponsui.totalSniperRifles or 0) + (Weaponsui.totalSniperRifles_quest or 0)
    
    Weaponsui.ownedTotalShotguns = (Weaponsui.ownedShotguns or 0) + (Weaponsui.ownedShotguns_quest or 0)
    Weaponsui.totalShotguns = (Weaponsui.totalShotguns or 0) + (Weaponsui.totalShotguns_quest or 0)
    
    Weaponsui.ownedTotalSmgs = (Weaponsui.ownedSmgs or 0) + (Weaponsui.ownedSmgs_quest or 0)
    Weaponsui.totalSmgs = (Weaponsui.totalSmgs or 0) + (Weaponsui.totalSmgs_quest or 0)
    
    Weaponsui.ownedTotalHmgs = Weaponsui.ownedHmgs or 0
    Weaponsui.totalHmgs = Weaponsui.totalHmgs or 0
    
    Weaponsui.ownedTotalGrenades = (Weaponsui.ownedGrenades or 0) + (Weaponsui.ownedGrenades_quest or 0)
    Weaponsui.totalGrenades = (Weaponsui.totalGrenades or 0) + (Weaponsui.totalGrenades_quest or 0)
    
    Weaponsui.ownedTotalRanged = Weaponsui.ownedTotalHandguns +
                                 Weaponsui.ownedTotalRevolvers +
                                 Weaponsui.ownedTotalAssaultRifles +
                                 Weaponsui.ownedTotalPrecisionRifles +
                                 Weaponsui.ownedTotalSniperRifles +
                                 Weaponsui.ownedTotalShotguns +
                                 Weaponsui.ownedTotalSmgs +
                                 Weaponsui.ownedTotalHmgs +
                                 Weaponsui.ownedTotalGrenades

    Weaponsui.totalTotalRanged = Weaponsui.totalHandguns +
                                 Weaponsui.totalRevolvers +
                                 Weaponsui.totalAssaultRifles +
                                 Weaponsui.totalPrecisionRifles +
                                 Weaponsui.totalSniperRifles +
                                 Weaponsui.totalShotguns +
                                 Weaponsui.totalSmgs +
                                 Weaponsui.totalHmgs +
                                 Weaponsui.totalGrenades

    Weaponsui.ownedAxes, Weaponsui.totalAxes = Weaponsui.CountOwnedWeapons(groupedWeapons.Axes)
    
    Weaponsui.ownedChainswords, Weaponsui.totalChainswords = Weaponsui.CountOwnedWeapons(groupedWeapons.Chainswords)
    
    Weaponsui.ownedKatanas, Weaponsui.totalKatanas = Weaponsui.CountOwnedWeapons(groupedWeapons.Katanas)
    Weaponsui.ownedKatanas_quest, Weaponsui.totalKatanas_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.Katanas_quest)
    
    Weaponsui.ownedKnives, Weaponsui.totalKnives = Weaponsui.CountOwnedWeapons(groupedWeapons.Knives)
    Weaponsui.ownedKnives_quest, Weaponsui.totalKnives_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.Knives_quest)
    
    Weaponsui.ownedMachetes, Weaponsui.totalMachetes = Weaponsui.CountOwnedWeapons(groupedWeapons.Machetes)
    
    Weaponsui.ownedSwords, Weaponsui.totalSwords = Weaponsui.CountOwnedWeapons(groupedWeapons.Swords)
    
    Weaponsui.ownedHammers, Weaponsui.totalHammers = Weaponsui.CountOwnedWeapons(groupedWeapons.Hammers)
    Weaponsui.ownedHammers_quest, Weaponsui.totalHammers_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.Hammers_quest)
    
    Weaponsui.ownedOneHandedClubs, Weaponsui.totalOneHandedClubs = Weaponsui.CountOwnedWeapons(groupedWeapons.OneHandedClubs)
    Weaponsui.ownedOneHandedClubs_quest, Weaponsui.totalOneHandedClubs_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.OneHandedClubs_quest)
    
    Weaponsui.ownedTwoHandedClubs, Weaponsui.totalTwoHandedClubs = Weaponsui.CountOwnedWeapons(groupedWeapons.TwoHandedClubs)
    Weaponsui.ownedTwoHandedClubs_quest, Weaponsui.totalTwoHandedClubs_quest = Weaponsui.CountOwnedWeapons(groupedWeapons.TwoHandedClubs_quest)
    
    Weaponsui.ownedTotalAxes = Weaponsui.ownedAxes or 0
    Weaponsui.totalAxes = Weaponsui.totalAxes or 0
    
    Weaponsui.ownedTotalChainswords = Weaponsui.ownedChainswords or 0
    Weaponsui.totalChainswords = Weaponsui.totalChainswords or 0
    
    Weaponsui.ownedTotalKatanas = (Weaponsui.ownedKatanas or 0) + (Weaponsui.ownedKatanas_quest or 0)
    Weaponsui.totalKatanas = (Weaponsui.totalKatanas or 0) + (Weaponsui.totalKatanas_quest or 0)
    
    Weaponsui.ownedTotalKnives = (Weaponsui.ownedKnives or 0) + (Weaponsui.ownedKnives_quest or 0)
    Weaponsui.totalKnives = (Weaponsui.totalKnives or 0) + (Weaponsui.totalKnives_quest or 0)
    
    Weaponsui.ownedTotalMachetes = Weaponsui.ownedMachetes or 0
    Weaponsui.totalMachetes = Weaponsui.totalMachetes or 0
   
    Weaponsui.ownedTotalSwords = Weaponsui.ownedSwords or 0
    Weaponsui.totalSwords = Weaponsui.totalSwords or 0
    
    Weaponsui.ownedTotalHammers = (Weaponsui.ownedHammers or 0) + (Weaponsui.ownedHammers_quest or 0)
    Weaponsui.totalHammers = (Weaponsui.totalHammers or 0) + (Weaponsui.totalHammers_quest or 0)
    
    Weaponsui.ownedTotalOneHandedClubs = (Weaponsui.ownedOneHandedClubs or 0) + (Weaponsui.ownedOneHandedClubs_quest or 0)
    Weaponsui.totalOneHandedClubs = (Weaponsui.totalOneHandedClubs or 0) + (Weaponsui.totalOneHandedClubs_quest or 0)
    
    Weaponsui.ownedTotalTwoHandedClubs = (Weaponsui.ownedTwoHandedClubs or 0) + (Weaponsui.ownedTwoHandedClubs_quest or 0)
    Weaponsui.totalTwoHandedClubs = (Weaponsui.totalTwoHandedClubs or 0) + (Weaponsui.totalTwoHandedClubs_quest or 0)
    
    Weaponsui.ownedTotalMelee = Weaponsui.ownedTotalAxes +
                                Weaponsui.ownedTotalChainswords +
                                Weaponsui.ownedTotalKatanas +
                                Weaponsui.ownedTotalKnives +
                                Weaponsui.ownedTotalMachetes +
                                Weaponsui.ownedTotalSwords +
                                Weaponsui.ownedTotalHammers +
                                Weaponsui.ownedTotalOneHandedClubs +
                                Weaponsui.ownedTotalTwoHandedClubs

    Weaponsui.totalTotalMelee = Weaponsui.totalAxes +
                                Weaponsui.totalChainswords +
                                Weaponsui.totalKatanas +
                                Weaponsui.totalKnives +
                                Weaponsui.totalMachetes +
                                Weaponsui.totalSwords +
                                Weaponsui.totalHammers +
                                Weaponsui.totalOneHandedClubs +
                                Weaponsui.totalTwoHandedClubs
   

    Weaponsui.ownedTotalWeapons = Weaponsui.ownedTotalRanged + Weaponsui.ownedTotalMelee
    Weaponsui.totalTotalWeapons = Weaponsui.totalTotalRanged + Weaponsui.totalTotalMelee

    return --Weaponsui.ownedTotalRanged, Weaponsui.totalTotalRanged,
            --Weaponsui.ownedTotalMelee, Weaponsui.totalTotalMelee,
            Weaponsui.ownedTotalWeapons, Weaponsui.totalTotalWeapons
end
function Weaponsui.countliberty()
    Weaponsui.ownedHandguns_liberty, Weaponsui.totalHandguns_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Handguns_liberty)
    Weaponsui.ownedHandguns_quest_liberty, Weaponsui.totalHandguns_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Handguns_quest_liberty)
    
    Weaponsui.ownedRevolvers_liberty, Weaponsui.totalRevolvers_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Revolvers_liberty)
    Weaponsui.ownedRevolvers_quest_liberty, Weaponsui.totalRevolvers_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Revolvers_quest_liberty)
    
    Weaponsui.ownedAssaultRifles_rifles_liberty, Weaponsui.totalAssaultRifles_rifles_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.AssaultRifles_liberty)
    Weaponsui.ownedAssaultRifles_quest_liberty, Weaponsui.totalAssaultRifles_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.AssaultRifles_quest_liberty)
    
    Weaponsui.ownedPrecisionRifles_liberty, Weaponsui.totalPrecisionRifles_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.PrecisionRifles_liberty)
    
    Weaponsui.ownedSniperRifles_liberty, Weaponsui.totalSniperRifles_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.SniperRifles_liberty)
    Weaponsui.ownedSniperRifles_quest_liberty, Weaponsui.totalSniperRifles_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.SniperRifles_quest_liberty)
    
    Weaponsui.ownedShotguns_liberty, Weaponsui.totalShotguns_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Shotguns_liberty)
    Weaponsui.ownedShotguns_quest_liberty, Weaponsui.totalShotguns_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Shotguns_quest_liberty)
    
    Weaponsui.ownedSmgs_liberty, Weaponsui.totalSmgs_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Smgs_liberty)
    Weaponsui.ownedSmgs_quest_liberty, Weaponsui.totalSmgs_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Smgs_quest_liberty)
    
    Weaponsui.ownedHmgs_liberty, Weaponsui.totalHmgs_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Hmgs_liberty)
    Weaponsui.ownedHmgs_quest_liberty, Weaponsui.totalHmgs_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Hmgs_quest_liberty)
    
    Weaponsui.ownedTotalHandguns_liberty = (Weaponsui.ownedHandguns_liberty or 0) + (Weaponsui.ownedHandguns_quest_liberty or 0)
    Weaponsui.totalHandguns_liberty = (Weaponsui.totalHandguns_liberty or 0) + (Weaponsui.totalHandguns_quest_liberty or 0)
    
    Weaponsui.ownedTotalRevolvers_liberty = (Weaponsui.ownedRevolvers_liberty or 0) + (Weaponsui.ownedRevolvers_quest_liberty or 0)
    Weaponsui.totalRevolvers_liberty = (Weaponsui.totalRevolvers_liberty or 0) + (Weaponsui.totalRevolvers_quest_liberty or 0)
    
    Weaponsui.ownedTotalAssaultRifles_liberty = (Weaponsui.ownedAssaultRifles_rifles_liberty or 0) + (Weaponsui.ownedAssaultRifles_quest_liberty or 0)
    Weaponsui.totalAssaultRifles_liberty = (Weaponsui.totalAssaultRifles_rifles_liberty or 0) + (Weaponsui.totalAssaultRifles_quest_liberty or 0)
    
    Weaponsui.ownedTotalPrecisionRifles_liberty = Weaponsui.ownedPrecisionRifles_liberty or 0
    Weaponsui.totalPrecisionRifles_liberty = Weaponsui.totalPrecisionRifles_liberty or 0
    
    Weaponsui.ownedTotalSniperRifles_liberty = (Weaponsui.ownedSniperRifles_liberty or 0) + (Weaponsui.ownedSniperRifles_quest_liberty or 0)
    Weaponsui.totalSniperRifles_liberty = (Weaponsui.totalSniperRifles_liberty or 0) + (Weaponsui.totalSniperRifles_quest_liberty or 0)
    
    Weaponsui.ownedTotalShotguns_liberty = (Weaponsui.ownedShotguns_liberty or 0) + (Weaponsui.ownedShotguns_quest_liberty or 0)
    Weaponsui.totalShotguns_liberty = (Weaponsui.totalShotguns_liberty or 0) + (Weaponsui.totalShotguns_quest_liberty or 0)
    
    Weaponsui.ownedTotalSmgs_liberty = (Weaponsui.ownedSmgs_liberty or 0) + (Weaponsui.ownedSmgs_quest_liberty or 0)
    Weaponsui.totalSmgs_liberty = (Weaponsui.totalSmgs_liberty or 0) + (Weaponsui.totalSmgs_quest_liberty or 0)
    
    Weaponsui.ownedTotalHmgs_liberty = (Weaponsui.ownedHmgs_liberty or 0) + (Weaponsui.ownedHmgs_quest_liberty or 0)
    Weaponsui.totalHmgs_liberty = (Weaponsui.totalHmgs_liberty or 0) + (Weaponsui.totalHmgs_quest_liberty or 0)
    

    Weaponsui.ownedTotalRangedliberty = Weaponsui.ownedTotalHandguns_liberty +
                                        Weaponsui.ownedTotalRevolvers_liberty +
                                        Weaponsui.ownedTotalAssaultRifles_liberty +
                                        Weaponsui.ownedTotalPrecisionRifles_liberty +
                                        Weaponsui.ownedTotalSniperRifles_liberty +
                                        Weaponsui.ownedTotalShotguns_liberty +
                                        Weaponsui.ownedTotalSmgs_liberty +
                                        Weaponsui.ownedTotalHmgs_liberty

    Weaponsui.totalTotalRangedliberty = Weaponsui.totalHandguns_liberty +
                                        Weaponsui.totalRevolvers_liberty +
                                        Weaponsui.totalAssaultRifles_liberty +
                                        Weaponsui.totalPrecisionRifles_liberty +
                                        Weaponsui.totalSniperRifles_liberty +
                                        Weaponsui.totalShotguns_liberty +
                                        Weaponsui.totalSmgs_liberty +
                                        Weaponsui.totalHmgs_liberty


    Weaponsui.ownedAxes_liberty, Weaponsui.totalAxes_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Axes_liberty)
    Weaponsui.ownedAxes_quest_liberty, Weaponsui.totalAxes_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Axes_quest_liberty)
    
    Weaponsui.ownedChainswords_liberty, Weaponsui.totalChainswords_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Chainswords_liberty)
    
    Weaponsui.ownedKnives_quest_liberty, Weaponsui.totalKnives_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Knives_quest_liberty)
    
    Weaponsui.ownedMachetes_liberty, Weaponsui.totalMachetes_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Machetes_liberty)
    Weaponsui.ownedMachetes_quest_liberty, Weaponsui.totalMachetes_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.Machetes_quest_liberty)
    
    Weaponsui.ownedOneHandedClubs_quest_liberty, Weaponsui.totalOneHandedClubs_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.OneHandedClubs_quest_liberty)
    
    Weaponsui.ownedTwoHandedClubs_liberty, Weaponsui.totalTwoHandedClubs_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.TwoHandedClubs_liberty)
    Weaponsui.ownedTwoHandedClubs_quest_liberty, Weaponsui.totalTwoHandedClubs_quest_liberty = Weaponsui.CountOwnedWeapons(groupedWeapons.TwoHandedClubs_quest_liberty)
    
    Weaponsui.ownedTotalAxes_liberty = (Weaponsui.ownedAxes_liberty or 0) + (Weaponsui.ownedAxes_quest_liberty or 0)
    Weaponsui.totalAxes_liberty = (Weaponsui.totalAxes_liberty or 0) + (Weaponsui.totalAxes_quest_liberty or 0)
    
    Weaponsui.ownedTotalChainswords_liberty = Weaponsui.ownedChainswords_liberty or 0
    Weaponsui.totalChainswords_liberty = Weaponsui.totalChainswords_liberty or 0
    
    Weaponsui.ownedTotalKnives_liberty = Weaponsui.ownedKnives_quest_liberty or 0
    Weaponsui.totalKnives_liberty = Weaponsui.totalKnives_quest_liberty or 0
    
    Weaponsui.ownedTotalMachetes_liberty = (Weaponsui.ownedMachetes_liberty or 0) + (Weaponsui.ownedMachetes_quest_liberty or 0)
    Weaponsui.totalMachetes_liberty = (Weaponsui.totalMachetes_liberty or 0) + (Weaponsui.totalMachetes_quest_liberty or 0)
   
    Weaponsui.ownedTotalOneHandedClubs_liberty = Weaponsui.ownedOneHandedClubs_quest_liberty or 0
    Weaponsui.totalOneHandedClubs_liberty = Weaponsui.totalOneHandedClubs_quest_liberty or 0
    
    Weaponsui.ownedTotalTwoHandedClubs_liberty = (Weaponsui.ownedTwoHandedClubs_liberty or 0) + (Weaponsui.ownedTwoHandedClubs_quest_liberty or 0)
    Weaponsui.totalTwoHandedClubs_liberty = (Weaponsui.totalTwoHandedClubs_liberty or 0) + (Weaponsui.totalTwoHandedClubs_quest_liberty or 0)
    
    
    Weaponsui.ownedTotalMeleeliberty = Weaponsui.ownedTotalAxes_liberty +
                                 Weaponsui.ownedTotalChainswords_liberty +
                                 Weaponsui.ownedTotalKnives_liberty +
                                 Weaponsui.ownedTotalMachetes_liberty +
                                 Weaponsui.ownedTotalOneHandedClubs_liberty +
                                 Weaponsui.ownedTotalTwoHandedClubs_liberty

    Weaponsui.totalTotalMeleeliberty = Weaponsui.totalAxes_liberty +
                             Weaponsui.totalChainswords_liberty +
                             Weaponsui.totalKnives_liberty +
                             Weaponsui.totalMachetes_liberty +
                             Weaponsui.totalOneHandedClubs_liberty +
                             Weaponsui.totalTwoHandedClubs_liberty

    Weaponsui.ownedTotalWeaponsliberty = Weaponsui.ownedTotalRangedliberty + Weaponsui.ownedTotalMeleeliberty
    Weaponsui.totalTotalWeaponsliberty = Weaponsui.totalTotalRangedliberty + Weaponsui.totalTotalMeleeliberty
    return --Weaponsui.ownedTotalRanged, Weaponsui.totalTotalRanged,
            --Weaponsui.ownedTotalMelee, Weaponsui.totalTotalMelee,
            Weaponsui.ownedTotalWeaponsliberty, Weaponsui.totalTotalWeaponsliberty
end
function Weaponsui.uiweapons()
  if ImGui.CollapsingHeader(string.format(T("ATT_WEAPONS") .."(%d/%d)",Weaponsui.ownedTotalWeapons or 0, Weaponsui.totalTotalWeapons or 0)) then
    ImGui.Indent(20)
      if ImGui.CollapsingHeader(string.format(T("ATT_RANGED_WEAPONS") .."(%d/%d)",Weaponsui.ownedTotalRanged or 0, Weaponsui.totalTotalRanged or 0)) then
          ImGui.Indent(20)
            -- if ImGui.Button(string.format(T("Pistols") .."(%d/%d)",Weaponsui.ownedHandguns or 0 + Weaponsui.ownedHandguns_quest or 0, Weaponsui.totalHandguns or 0 + Weaponsui.totalHandguns_quest or 0)) then
            if ImGui.Button(string.format(T("ATT_PISTOLS") .."(%d/%d)",Weaponsui.ownedTotalHandguns or 0, Weaponsui.totalHandguns or 0), -1, 0) then
              setActive("Weaponsui", "showhandguns")
            end
            if ImGui.Button(string.format(T("ATT_REVOLVERS") .."(%d/%d)",Weaponsui.ownedTotalRevolvers or 0, Weaponsui.totalRevolvers or 0), -1, 0) then
              setActive("Weaponsui", "showrevolvers")
            end
            if ImGui.Button(string.format(T("ATT_ASSAULT_RIFLES") .."(%d/%d)",Weaponsui.ownedTotalAssaultRifles or 0, Weaponsui.totalAssaultRifles or 0), -1, 0) then
              setActive("Weaponsui", "showassault_rifles")
            end
            if ImGui.Button(string.format(T("ATT_PRECISION_RIFLES") .."(%d/%d)",Weaponsui.ownedTotalPrecisionRifles or 0, Weaponsui.totalPrecisionRifles or 0), -1, 0) then
              setActive("Weaponsui", "showPrecisionRifles")
            end
            if ImGui.Button(string.format(T("ATT_SNIPER_RIFLES") .."(%d/%d)",Weaponsui.ownedTotalSniperRifles or 0, Weaponsui.totalSniperRifles or 0), -1, 0) then
              setActive("Weaponsui", "showSniperRifles")
            end
            if ImGui.Button(string.format(T("ATT_SHOTGUNS") .."(%d/%d)",Weaponsui.ownedTotalShotguns or 0, Weaponsui.totalShotguns or 0), -1, 0) then
              setActive("Weaponsui", "showShotguns")
            end
            if ImGui.Button(string.format(T("ATT_SMG") .."(%d/%d)",Weaponsui.ownedTotalSmgs or 0, Weaponsui.totalSmgs or 0), -1, 0) then
              setActive("Weaponsui", "showSmgs")
            end
            if ImGui.Button(string.format(T("ATT_HMG") .."(%d/%d)",Weaponsui.ownedTotalHmgs or 0, Weaponsui.totalHmgs or 0), -1, 0) then
              setActive("Weaponsui", "showHmgs")
            end
            if ImGui.Button(string.format(T("ATT_GRENADES") .."(%d/%d)",Weaponsui.ownedTotalGrenades or 0, Weaponsui.totalGrenades or 0), -1, 0) then
              setActive("Weaponsui", "showGrenades")
            end
          ImGui.Unindent(20)
      end
    ImGui.Unindent(20)        ImGui.Indent(20)
    if ImGui.CollapsingHeader(string.format(T("ATT_MELEE_WEAPONS") .."(%d/%d)",Weaponsui.ownedTotalMelee or 0, Weaponsui.totalTotalMelee or 0)) then
        ImGui.Indent(20)
          if ImGui.Button(string.format(T("ATT_TWO_HANDLE") .."(%d/%d)",Weaponsui.ownedTotalTwoHandedClubs or 0, Weaponsui.totalTwoHandedClubs or 0), -1, 0) then
              setActive("Weaponsui", "showTwoHandedClubs")
          end
          if ImGui.Button(string.format(T("ATT_ONE_HANDLE") .."(%d/%d)",Weaponsui.ownedTotalOneHandedClubs or 0, Weaponsui.totalOneHandedClubs or 0), -1, 0) then
              setActive("Weaponsui", "showOneHandedClubs")
          end
          if ImGui.Button(string.format(T("ATT_HAMMERS") .."(%d/%d)",Weaponsui.ownedTotalHammers or 0, Weaponsui.totalHammers or 0), -1, 0) then
              setActive("Weaponsui", "showHammers")
          end
          if ImGui.Button(string.format(T("ATT_SWORDS") .."(%d/%d)",Weaponsui.ownedTotalSwords or 0, Weaponsui.totalSwords or 0), -1, 0) then
              setActive("Weaponsui", "showSwords")
          end
          if ImGui.Button(string.format(T("ATT_MACHETES") .."(%d/%d)",Weaponsui.ownedTotalMachetes or 0, Weaponsui.totalMachetes or 0), -1, 0) then
              setActive("Weaponsui", "showMachetes")
          end
          if ImGui.Button(string.format(T("ATT_KNIVES") .."(%d/%d)",Weaponsui.ownedTotalKnives or 0, Weaponsui.totalKnives or 0), -1, 0) then
              setActive("Weaponsui", "showKnives")
          end
          if ImGui.Button(string.format(T("ATT_KATANAS") .."(%d/%d)",Weaponsui.ownedTotalKatanas or 0, Weaponsui.totalKatanas or 0), -1, 0) then
              setActive("Weaponsui", "showKatanas")
          end
          if ImGui.Button(string.format(T("ATT_CHAINSWORDS") .."(%d/%d)",Weaponsui.ownedTotalChainswords or 0, Weaponsui.totalChainswords or 0), -1, 0) then
              setActive("Weaponsui", "showChainswords")
          end
          if ImGui.Button(string.format(T("ATT_AXES") .."(%d/%d)",Weaponsui.ownedTotalAxes or 0, Weaponsui.totalAxes or 0), -1, 0) then
              setActive("Weaponsui", "showAxes")
          end
        ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
  end
end
function Weaponsui.uiweaponsliberty()
    if ImGui.CollapsingHeader(string.format(T("ATT_WEAPONS") .."(%d/%d)",Weaponsui.ownedTotalWeaponsliberty or 0, Weaponsui.totalTotalWeaponsliberty or 0)) then
        ImGui.Indent(20)
          if ImGui.CollapsingHeader(string.format(T("ATT_RANGED_WEAPONS") .."(%d/%d)",Weaponsui.ownedTotalRangedliberty or 0, Weaponsui.totalTotalRangedliberty or 0)) then
              ImGui.Indent(20)
                    -- ImGui.PushStyleVar(ImGuiStyleVar.ButtonTextAlign, 0.0, 0.5) -- alignement gauche
                if ImGui.Button(string.format(T("ATT_PISTOLS") .."(%d/%d)",Weaponsui.ownedTotalHandguns_liberty or 0, Weaponsui.totalHandguns_liberty or 0), -1, 0) then
                    setActive("Weaponsui", "showhandguns")
                end
                -- ImGui.PopStyleVar()

                if ImGui.Button(string.format(T("ATT_REVOLVERS") .."(%d/%d)",Weaponsui.ownedTotalRevolvers_liberty or 0, Weaponsui.totalRevolvers_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showrevolvers")
                end
                if ImGui.Button(string.format(T("ATT_ASSAULT_RIFLES") .."(%d/%d)",Weaponsui.ownedTotalAssaultRifles_liberty or 0, Weaponsui.totalAssaultRifles_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showassault_rifles")
                end
                if ImGui.Button(string.format(T("ATT_PRECISION_RIFLES") .."(%d/%d)",Weaponsui.ownedTotalPrecisionRifles_liberty or 0, Weaponsui.totalPrecisionRifles_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showPrecisionRifles")
                end
                if ImGui.Button(string.format(T("ATT_SNIPER_RIFLES") .."(%d/%d)",Weaponsui.ownedTotalSniperRifles_liberty or 0, Weaponsui.totalSniperRifles_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showSniperRifles")
                end
                if ImGui.Button(string.format(T("ATT_SHOTGUNS") .."(%d/%d)",Weaponsui.ownedTotalShotguns_liberty or 0, Weaponsui.totalShotguns_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showShotguns")
                end
                if ImGui.Button(string.format(T("ATT_SMG") .."(%d/%d)",Weaponsui.ownedTotalSmgs_liberty or 0, Weaponsui.totalSmgs_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showSmgs")
                end
                if ImGui.Button(string.format(T("ATT_HMG") .."(%d/%d)",Weaponsui.ownedTotalHmgs_liberty or 0, Weaponsui.totalHmgs_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showHmgs")
                end
                
              ImGui.Unindent(20)
          end
        ImGui.Unindent(20)
        ImGui.Indent(20)
          if ImGui.CollapsingHeader(string.format(T("ATT_MELEE_WEAPONS") .."(%d/%d)",Weaponsui.ownedTotalMeleeliberty or 0, Weaponsui.totalTotalMeleeliberty or 0)) then
            ImGui.Indent(20)
              if ImGui.Button(string.format(T("ATT_TWO_HANDLE") .."(%d/%d)",Weaponsui.ownedTotalTwoHandedClubs_liberty or 0, Weaponsui.totalTwoHandedClubs_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showTwoHandedClubs")
              end
              if ImGui.Button(string.format(T("ATT_ONE_HANDLE") .."(%d/%d)",Weaponsui.ownedTotalOneHandedClubs_liberty or 0, Weaponsui.totalOneHandedClubs_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showOneHandedClubs")
              end
              if ImGui.Button(string.format(T("ATT_MACHETES") .."(%d/%d)",Weaponsui.ownedTotalMachetes_liberty or 0, Weaponsui.totalMachetes_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showMachetes")
              end
              if ImGui.Button(string.format(T("ATT_KNIVES") .."(%d/%d)",Weaponsui.ownedTotalKnives_liberty or 0, Weaponsui.totalKnives_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showKnives")
              end
              if ImGui.Button(string.format(T("ATT_CHAINSWORDS") .."(%d/%d)",Weaponsui.ownedTotalChainswords_liberty or 0, Weaponsui.totalChainswords_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showChainswords")
              end
              if ImGui.Button(string.format(T("ATT_AXES") .."(%d/%d)",Weaponsui.ownedTotalAxes_liberty or 0, Weaponsui.totalAxes_liberty or 0), -1, 0) then
                  setActive("Weaponsui", "showAxes")
              end
            ImGui.Unindent(20)
          end
        ImGui.Unindent(20)
      end
end

Weaponsui.groupedWeapons = groupedWeapons
Weaponsui.hideOwnedItems = hideOwnedItems
Weaponsui.hideUnownedItems = hideUnownedItems


return Weaponsui
