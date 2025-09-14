local Modsui = {}
local selectedName = nil
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
ATT.translations            = require("trad/Interface")
ATT.selectedLanguage        = "en"
local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
end

local mods = require("data/mods")
local groupedMods = {
      ARSMGLMGMOD = {},
      BLADEMOD = {},
      BLUNTWEAPONMOD = {},
      MELEEWEAPONMOD = {},
      MUZZLEASSAULTRIFLESMG = {},
      MUZZLEHANDGUN = {},
      PISTOLREVOLVERMOD = {},
      POWERWEAPONMOD = {},
      POWERWEAPONMOD_liberty = {},
      SCOPEGENERICLONG = {},
      SCOPEGENERICSHORT = {},
      SCOPETECHSNIPER = {},
      SHOTGUNMOD = {},
      SILENCER = {},
      SMARTWEAPONMOD = {},
      SMARTWEAPONMOD_liberty = {},
      SNIPERPRECRIFLEMOD = {},
      TECHWEAPONMOD = {},
      TECHWEAPONMOD_liberty = {},
      THROWABLEWEAPONMOD = {},
      WEAPONMOD = {}


}
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


  for _, ARSMGLMGMOD in ipairs(mods.ARSMGLMGMODS) do
    local ARSMGLMGMODData = {
      recordID = ARSMGLMGMOD[1],
      name = ARSMGLMGMOD[2],
      acquisitionID = ARSMGLMGMOD[3]
     }
    local acquisitionData = translationstests[ARSMGLMGMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.ARSMGLMGMOD[ARSMGLMGMODData.name] then
        groupedMods.ARSMGLMGMOD[ARSMGLMGMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.ARSMGLMGMOD[ARSMGLMGMODData.name].recordIDs, ARSMGLMGMODData.recordID)
  end
  for _, BLADEMOD in ipairs(mods.BLADEMODS) do
    local BLADEMODData = {
      recordID = BLADEMOD[1],
      name = BLADEMOD[2],
      acquisitionID = BLADEMOD[3]
     }
    local acquisitionData = translationstests[BLADEMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.BLADEMOD[BLADEMODData.name] then
        groupedMods.BLADEMOD[BLADEMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.BLADEMOD[BLADEMODData.name].recordIDs, BLADEMODData.recordID)
  end
  for _, BLUNTWEAPONMOD in ipairs(mods.BLUNTWEAPONMODS) do
    local BLUNTWEAPONMODData = {
      recordID = BLUNTWEAPONMOD[1],
      name = BLUNTWEAPONMOD[2],
      acquisitionID = BLUNTWEAPONMOD[3]
     }
    local acquisitionData = translationstests[BLUNTWEAPONMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
    
    if not groupedMods.BLUNTWEAPONMOD[BLUNTWEAPONMODData.name] then
        groupedMods.BLUNTWEAPONMOD[BLUNTWEAPONMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.BLUNTWEAPONMOD[BLUNTWEAPONMODData.name].recordIDs, BLUNTWEAPONMODData.recordID)
  end
  for _, MELEEWEAPONMOD in ipairs(mods.MELEEWEAPONMODS) do
    local MELEEWEAPONMODData = {
      recordID = MELEEWEAPONMOD[1],
      name = MELEEWEAPONMOD[2],
      acquisitionID = MELEEWEAPONMOD[3]
     }
    local acquisitionData = translationstests[MELEEWEAPONMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     
    if not groupedMods.MELEEWEAPONMOD[MELEEWEAPONMODData.name] then
        groupedMods.MELEEWEAPONMOD[MELEEWEAPONMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.MELEEWEAPONMOD[MELEEWEAPONMODData.name].recordIDs, MELEEWEAPONMODData.recordID)
  end
  for _, MUZZLEASSAULTRIFLESMG in ipairs(mods.MUZZLEASSAULTRIFLESMGS) do
    local MUZZLEASSAULTRIFLESMGData = {
      recordID = MUZZLEASSAULTRIFLESMG[1],
      name = MUZZLEASSAULTRIFLESMG[2],
      acquisitionID = MUZZLEASSAULTRIFLESMG[3]
     }
    local acquisitionData = translationstests[MUZZLEASSAULTRIFLESMGData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.MUZZLEASSAULTRIFLESMG[MUZZLEASSAULTRIFLESMGData.name] then
        groupedMods.MUZZLEASSAULTRIFLESMG[MUZZLEASSAULTRIFLESMGData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.MUZZLEASSAULTRIFLESMG[MUZZLEASSAULTRIFLESMGData.name].recordIDs, MUZZLEASSAULTRIFLESMGData.recordID)
  end
  for _, MUZZLEHANDGUN in ipairs(mods.MUZZLEHANDGUNS) do
    local MUZZLEHANDGUNData = {
      recordID = MUZZLEHANDGUN[1],
      name = MUZZLEHANDGUN[2],
      acquisitionID = MUZZLEHANDGUN[3]
     }
    local acquisitionData = translationstests[MUZZLEHANDGUNData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.MUZZLEHANDGUN[MUZZLEHANDGUNData.name] then
        groupedMods.MUZZLEHANDGUN[MUZZLEHANDGUNData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.MUZZLEHANDGUN[MUZZLEHANDGUNData.name].recordIDs, MUZZLEHANDGUNData.recordID)
  end
  for _, PISTOLREVOLVERMOD in ipairs(mods.PISTOLREVOLVERMODS) do
    local PISTOLREVOLVERMODData = {
      recordID = PISTOLREVOLVERMOD[1],
      name = PISTOLREVOLVERMOD[2],
      acquisitionID = PISTOLREVOLVERMOD[3]
     }
    local acquisitionData = translationstests[PISTOLREVOLVERMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.PISTOLREVOLVERMOD[PISTOLREVOLVERMODData.name] then
        groupedMods.PISTOLREVOLVERMOD[PISTOLREVOLVERMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.PISTOLREVOLVERMOD[PISTOLREVOLVERMODData.name].recordIDs, PISTOLREVOLVERMODData.recordID)
  end
  for _, POWERWEAPONMOD in ipairs(mods.POWERWEAPONMODS) do
    local POWERWEAPONMODData = {
      recordID = POWERWEAPONMOD[1],
      name = POWERWEAPONMOD[2],
      acquisitionID = POWERWEAPONMOD[3]
     }
    local acquisitionData = translationstests[POWERWEAPONMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     
    if not groupedMods.POWERWEAPONMOD[POWERWEAPONMODData.name] then
        groupedMods.POWERWEAPONMOD[POWERWEAPONMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad  }
    end
    table.insert(groupedMods.POWERWEAPONMOD[POWERWEAPONMODData.name].recordIDs, POWERWEAPONMODData.recordID)
  end
  for _, POWERWEAPONMOD_liberty in ipairs(mods.POWERWEAPONMODS_liberty) do
    local POWERWEAPONMODData_liberty = {
      recordID = POWERWEAPONMOD_liberty[1],
      name = POWERWEAPONMOD_liberty[2],
      acquisitionID = POWERWEAPONMOD_liberty[3]
     }
    local acquisitionData = translationstests[POWERWEAPONMODData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     
    if not groupedMods.POWERWEAPONMOD_liberty[POWERWEAPONMODData_liberty.name] then
        groupedMods.POWERWEAPONMOD_liberty[POWERWEAPONMODData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad  }
    end
    table.insert(groupedMods.POWERWEAPONMOD_liberty[POWERWEAPONMODData_liberty.name].recordIDs, POWERWEAPONMODData_liberty.recordID)
  end
  for _, SCOPEGENERICLONG in ipairs(mods.SCOPEGENERICLONGS) do
    local SCOPEGENERICLONGData = {
      recordID = SCOPEGENERICLONG[1],
      name = SCOPEGENERICLONG[2],
      acquisitionID = SCOPEGENERICLONG[3]
     }
    local acquisitionData = translationstests[SCOPEGENERICLONGData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.SCOPEGENERICLONG[SCOPEGENERICLONGData.name] then
        groupedMods.SCOPEGENERICLONG[SCOPEGENERICLONGData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.SCOPEGENERICLONG[SCOPEGENERICLONGData.name].recordIDs, SCOPEGENERICLONGData.recordID)
  end
  for _, SCOPEGENERICSHORT in ipairs(mods.SCOPEGENERICSHORTS) do
    local SCOPEGENERICSHORTData = {
      recordID = SCOPEGENERICSHORT[1],
      name = SCOPEGENERICSHORT[2],
      acquisitionID = SCOPEGENERICSHORT[3]
     }
    local acquisitionData = translationstests[SCOPEGENERICSHORTData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.SCOPEGENERICSHORT[SCOPEGENERICSHORTData.name] then
        groupedMods.SCOPEGENERICSHORT[SCOPEGENERICSHORTData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.SCOPEGENERICSHORT[SCOPEGENERICSHORTData.name].recordIDs, SCOPEGENERICSHORTData.recordID)
  end
  for _, SCOPETECHSNIPER in ipairs(mods.SCOPETECHSNIPERS) do
    local SCOPETECHSNIPERData = {
      recordID = SCOPETECHSNIPER[1],
      name = SCOPETECHSNIPER[2],
      acquisitionID = SCOPETECHSNIPER[3]
     }
    local acquisitionData = translationstests[SCOPETECHSNIPERData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.SCOPETECHSNIPER[SCOPETECHSNIPERData.name] then
        groupedMods.SCOPETECHSNIPER[SCOPETECHSNIPERData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.SCOPETECHSNIPER[SCOPETECHSNIPERData.name].recordIDs, SCOPETECHSNIPERData.recordID)
  end
  for _, SHOTGUNMOD in ipairs(mods.SHOTGUNMODS) do
    local SHOTGUNMODData = {
      recordID = SHOTGUNMOD[1],
      name = SHOTGUNMOD[2],
      acquisitionID = SHOTGUNMOD[3]
     }
    local acquisitionData = translationstests[SHOTGUNMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.SHOTGUNMOD[SHOTGUNMODData.name] then
        groupedMods.SHOTGUNMOD[SHOTGUNMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad  }
    end
    table.insert(groupedMods.SHOTGUNMOD[SHOTGUNMODData.name].recordIDs, SHOTGUNMODData.recordID)
  end
  for _, SILENCER in ipairs(mods.SILENCERS) do
    local SILENCERData = {
      recordID = SILENCER[1],
      name = SILENCER[2],
      acquisitionID = SILENCER[3]
     }
    local acquisitionData = translationstests[SILENCERData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.SILENCER[SILENCERData.name] then
        groupedMods.SILENCER[SILENCERData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.SILENCER[SILENCERData.name].recordIDs, SILENCERData.recordID)
  end
  for _, SMARTWEAPONMOD in ipairs(mods.SMARTWEAPONMODS) do
    local SMARTWEAPONMODData = {
      recordID = SMARTWEAPONMOD[1],
      name = SMARTWEAPONMOD[2],
      acquisitionID = SMARTWEAPONMOD[3]
     }
    local acquisitionData = translationstests[SMARTWEAPONMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.SMARTWEAPONMOD[SMARTWEAPONMODData.name] then
        groupedMods.SMARTWEAPONMOD[SMARTWEAPONMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.SMARTWEAPONMOD[SMARTWEAPONMODData.name].recordIDs, SMARTWEAPONMODData.recordID)
  end
  for _, SMARTWEAPONMOD_liberty in ipairs(mods.SMARTWEAPONMODS_liberty) do
    local SMARTWEAPONMODData_liberty = {
      recordID = SMARTWEAPONMOD_liberty[1],
      name = SMARTWEAPONMOD_liberty[2],
      acquisitionID = SMARTWEAPONMOD_liberty[3]
     }
    local acquisitionData = translationstests[SMARTWEAPONMODData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.SMARTWEAPONMOD_liberty[SMARTWEAPONMODData_liberty.name] then
        groupedMods.SMARTWEAPONMOD_liberty[SMARTWEAPONMODData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.SMARTWEAPONMOD_liberty[SMARTWEAPONMODData_liberty.name].recordIDs, SMARTWEAPONMODData_liberty.recordID)
  end
  for _, SNIPERPRECRIFLEMOD in ipairs(mods.SNIPERPRECRIFLEMODS) do
    local SNIPERPRECRIFLEMODData = {
      recordID = SNIPERPRECRIFLEMOD[1],
      name = SNIPERPRECRIFLEMOD[2],
      acquisitionID = SNIPERPRECRIFLEMOD[3]
     }
    local acquisitionData = translationstests[SNIPERPRECRIFLEMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.SNIPERPRECRIFLEMOD[SNIPERPRECRIFLEMODData.name] then
        groupedMods.SNIPERPRECRIFLEMOD[SNIPERPRECRIFLEMODData.name] = { recordIDs = {},  acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.SNIPERPRECRIFLEMOD[SNIPERPRECRIFLEMODData.name].recordIDs, SNIPERPRECRIFLEMODData.recordID)
  end
  for _, TECHWEAPONMOD in ipairs(mods.TECHWEAPONMODS) do
    local TECHWEAPONMODData = {
      recordID = TECHWEAPONMOD[1],
      name = TECHWEAPONMOD[2],
      acquisitionID = TECHWEAPONMOD[3]
     }
    local acquisitionData = translationstests[TECHWEAPONMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.TECHWEAPONMOD[TECHWEAPONMODData.name] then
        groupedMods.TECHWEAPONMOD[TECHWEAPONMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.TECHWEAPONMOD[TECHWEAPONMODData.name].recordIDs, TECHWEAPONMODData.recordID)
  end
  for _, TECHWEAPONMOD_liberty in ipairs(mods.TECHWEAPONMODS_liberty) do
    local TECHWEAPONMODData_liberty = {
      recordID = TECHWEAPONMOD_liberty[1],
      name = TECHWEAPONMOD_liberty[2],
      acquisitionID = TECHWEAPONMOD_liberty[3]
     }
    local acquisitionData = translationstests[TECHWEAPONMODData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.TECHWEAPONMOD_liberty[TECHWEAPONMODData_liberty.name] then
        groupedMods.TECHWEAPONMOD_liberty[TECHWEAPONMODData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.TECHWEAPONMOD_liberty[TECHWEAPONMODData_liberty.name].recordIDs, TECHWEAPONMODData_liberty.recordID)
  end
  for _, THROWABLEWEAPONMOD in ipairs(mods.THROWABLEWEAPONMODS) do
    local THROWABLEWEAPONMODData = {
      recordID = THROWABLEWEAPONMOD[1],
      name = THROWABLEWEAPONMOD[2],
      acquisitionID = THROWABLEWEAPONMOD[3]
     }
    local acquisitionData = translationstests[THROWABLEWEAPONMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.THROWABLEWEAPONMOD[THROWABLEWEAPONMODData.name] then
        groupedMods.THROWABLEWEAPONMOD[THROWABLEWEAPONMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.THROWABLEWEAPONMOD[THROWABLEWEAPONMODData.name].recordIDs, THROWABLEWEAPONMODData.recordID)
  end
  for _, WEAPONMOD in ipairs(mods.WEAPONMODS) do
    local WEAPONMODData = {
      recordID = WEAPONMOD[1],
      name = WEAPONMOD[2],
      acquisitionID = WEAPONMOD[3]
     }
    local acquisitionData = translationstests[WEAPONMODData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedMods.WEAPONMOD[WEAPONMODData.name] then
        groupedMods.WEAPONMOD[WEAPONMODData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedMods.WEAPONMOD[WEAPONMODData.name].recordIDs, WEAPONMODData.recordID)
  end
  
  -- Modsui.knownModsIDs = {}

  -- function Modsui.BuildModIndex()
  --     for _, modGroup in pairs(groupedMods) do
  --         for name, data in pairs(modGroup) do
  --             for _, recordID in ipairs(data.recordIDs or {}) do
  --                 Modsui.knownModsIDs[recordID] = name
  --             end
  --         end
  --     end
  -- end
  -- Modsui.BuildModIndex()
    Modsui.inventoryCache = {}
    -- Modsui.oldInventoryCache = {}
    -- Modsui.toast = nil
    -- Modsui.initialized = false
function Modsui.UpdateInventoryCache()
        Modsui.inventoryCache = {}
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
                Modsui.inventoryCache[itemRecordID] = true
            end
        end
    
        -- 🔍 Vérifie les items du coffre
        local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
        if stash then
            local stashSuccess, stashItems = transactionSystem:GetItemList(stash)
            if stashSuccess and stashItems then
                for _, item in ipairs(stashItems) do
                    local itemRecordID = item:GetID().id.value
                    Modsui.inventoryCache[itemRecordID] = true
                end
            end
        end
    end
  --   function Modsui.UpdateInventoryCache()
  --     Modsui.oldInventoryCache = Modsui.inventoryCache or {}
  --     Modsui.inventoryCache = {}
  
  --     local transactionSystem = Game.GetTransactionSystem()
  --     local player = GetPlayer()
  
  --     local newItems = {} 
  
  --     local function checkAndAddItems(entity)
  --         local success, items = transactionSystem:GetItemList(entity)
  --         if success and items then
  --             for _, item in ipairs(items) do
  --                 local recordID = item:GetID().id.value
  --                 Modsui.inventoryCache[recordID] = true
  
  --                 if not Modsui.oldInventoryCache[recordID] and Modsui.knownModsIDs[recordID] then
  --                     table.insert(newItems, recordID)
  --                 end
  --             end
  --         end
  --     end
  
  --     checkAndAddItems(player)
  --     local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
  --     checkAndAddItems(stash)
  
  --     if not Modsui.initialized then
  --         Modsui.initialized = true
  --         return
  --     end
  
  --     if #newItems > 0 then
  --         Modsui.NotifyNewItems(newItems)
  --     end
  -- end

--   function Modsui.NotifyNewItems(recordIDs)
--     if ATT.enableNotifications then return end
--       local notified = {}
--       local newlyDiscoveredNames = {}

--           for _, recordID in ipairs(recordIDs) do
--               local name = Modsui.knownModsIDs[recordID]
--               if name then
--                 newlyDiscoveredNames[name] = true
--               end
--           end

--           for name, _ in pairs(newlyDiscoveredNames) do
--             local found = false
--             local group = groupedMods 
--             for _, data in pairs(group) do
--                 if data[name] then
--                     for _, id in ipairs(data[name].recordIDs) do
--                         if Modsui.oldInventoryCache[id] then
--                             found = true 
--                             break
--                         end
--                     end
--                 end
--                 if found then break end
--             end
    
--             if not found then
--                 ATT.GameHUD.ShowMessage(T("ATT_Collected_Item") .. ":\n" .. name)
--             end
--         end

-- end
    function Modsui.CheckInStashAndInventory(recordID)
        return Modsui.inventoryCache[recordID] or false
    end
    
    function Modsui.displayWeaponGroup(name, group)
        local width, _ = ImGui.GetContentRegionAvail() 
    
        for weaponName, data in pairs(group or {}) do  
            local inInventory = false
            for _, recordID in ipairs(data.recordIDs) do
                if Modsui.CheckInStashAndInventory(recordID) then
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
    
            if ImGui.Selectable(weaponName, Modsui.selectedName == weaponName) then
                Modsui.selectedName = weaponName
            end
    
            ImGui.PopStyleColor()
          ::continue::  

        end
    
    end
    function Modsui.CountOwnedWeapons(group)
      Modsui.ownedCount = 0
      Modsui.totalCount = 0
    
      for _, data in pairs(group or {}) do
          Modsui.totalCount = Modsui.totalCount + 1
          for _, recordID in ipairs(data.recordIDs) do
              if Modsui.CheckInStashAndInventory(recordID) then
                  Modsui.ownedCount = Modsui.ownedCount + 1
                  break
              end
          end
      end
    
      return Modsui.ownedCount, Modsui.totalCount
end
function Modsui.count()
  Modsui.ownedARSMGLMGMOD, Modsui.totalARSMGLMGMOD = Modsui.CountOwnedWeapons(groupedMods.ARSMGLMGMOD)
  Modsui.ownedBLADEMOD, Modsui.totalBLADEMOD = Modsui.CountOwnedWeapons(groupedMods.BLADEMOD)
  Modsui.ownedBLUNTWEAPONMOD, Modsui.totalBLUNTWEAPONMOD = Modsui.CountOwnedWeapons(groupedMods.BLUNTWEAPONMOD)
  Modsui.ownedMELEEWEAPONMOD, Modsui.totalMELEEWEAPONMOD = Modsui.CountOwnedWeapons(groupedMods.MELEEWEAPONMOD)
  Modsui.ownedMUZZLEASSAULTRIFLESMG, Modsui.totalMUZZLEASSAULTRIFLESMG = Modsui.CountOwnedWeapons(groupedMods.MUZZLEASSAULTRIFLESMG)
  Modsui.ownedMUZZLEHANDGUN, Modsui.totalMUZZLEHANDGUN = Modsui.CountOwnedWeapons(groupedMods.MUZZLEHANDGUN)
  Modsui.ownedPISTOLREVOLVERMOD, Modsui.totalPISTOLREVOLVERMOD = Modsui.CountOwnedWeapons(groupedMods.PISTOLREVOLVERMOD)
  Modsui.ownedPOWERWEAPONMOD, Modsui.totalPOWERWEAPONMOD = Modsui.CountOwnedWeapons(groupedMods.POWERWEAPONMOD)
  Modsui.ownedSCOPEGENERICLONG, Modsui.totalSCOPEGENERICLONG = Modsui.CountOwnedWeapons(groupedMods.SCOPEGENERICLONG)
  Modsui.ownedSCOPEGENERICSHORT, Modsui.totalSCOPEGENERICSHORT = Modsui.CountOwnedWeapons(groupedMods.SCOPEGENERICSHORT)
  Modsui.ownedSCOPETECHSNIPER, Modsui.totalSCOPETECHSNIPER  = Modsui.CountOwnedWeapons(groupedMods.SCOPETECHSNIPER)
  Modsui.ownedSHOTGUNMOD, Modsui.totalSHOTGUNMOD = Modsui.CountOwnedWeapons(groupedMods.SHOTGUNMOD)
  Modsui.ownedSILENCER, Modsui.totalSILENCER = Modsui.CountOwnedWeapons(groupedMods.SILENCER)
  Modsui.ownedSMARTWEAPONMOD, Modsui.totalSMARTWEAPONMOD = Modsui.CountOwnedWeapons(groupedMods.SMARTWEAPONMOD)
  Modsui.ownedSNIPERPRECRIFLEMOD, Modsui.totalSNIPERPRECRIFLEMOD = Modsui.CountOwnedWeapons(groupedMods.SNIPERPRECRIFLEMOD)
  Modsui.ownedTECHWEAPONMOD, Modsui.totalTECHWEAPONMOD = Modsui.CountOwnedWeapons(groupedMods.TECHWEAPONMOD)
  Modsui.ownedTHROWABLEWEAPONMOD, Modsui.totalTHROWABLEWEAPONMOD = Modsui.CountOwnedWeapons(groupedMods.THROWABLEWEAPONMOD)
  Modsui.ownedWEAPONMOD, Modsui.totalWEAPONMOD = Modsui.CountOwnedWeapons(groupedMods.WEAPONMOD)
   
  
  Modsui.ownedTotalARSMGLMGMOD = Modsui.ownedARSMGLMGMOD or 0
  Modsui.ownedTotalBLADEMOD = Modsui.ownedBLADEMOD or 0
  Modsui.ownedTotalBLUNTWEAPONMOD = Modsui.ownedBLUNTWEAPONMOD or 0
  Modsui.ownedTotalMELEEWEAPONMOD = Modsui.ownedMELEEWEAPONMOD or 0
  Modsui.ownedTotalMUZZLEASSAULTRIFLESMG = Modsui.ownedMUZZLEASSAULTRIFLESMG or 0
  Modsui.ownedTotalMUZZLEHANDGUN = Modsui.ownedMUZZLEHANDGUN or 0
  Modsui.ownedTotalPISTOLREVOLVERMOD = Modsui.ownedPISTOLREVOLVERMOD or 0
  Modsui.ownedTotalPOWERWEAPONMOD = Modsui.ownedPOWERWEAPONMOD or 0
  Modsui.ownedTotalSCOPEGENERICLONG = Modsui.ownedSCOPEGENERICLONG or 0
  Modsui.ownedTotalSCOPEGENERICSHORT = Modsui.ownedSCOPEGENERICSHORT or 0
  Modsui.ownedTotalSCOPETECHSNIPER = Modsui.ownedSCOPETECHSNIPER or 0
  Modsui.ownedTotalSHOTGUNMOD = Modsui.ownedSHOTGUNMOD or 0
  Modsui.ownedTotalSILENCER = Modsui.ownedSILENCER or 0
  Modsui.ownedTotalSMARTWEAPONMOD = Modsui.ownedSMARTWEAPONMOD or 0
  Modsui.ownedTotalSNIPERPRECRIFLEMOD = Modsui.ownedSNIPERPRECRIFLEMOD or 0
  Modsui.ownedTotalTECHWEAPONMOD = Modsui.ownedTECHWEAPONMOD or 0
  Modsui.ownedTotalTHROWABLEWEAPONMOD = Modsui.ownedTHROWABLEWEAPONMOD or 0
  Modsui.ownedTotalWEAPONMOD = Modsui.ownedWEAPONMOD or 0
  Modsui.totalARSMGLMGMOD = Modsui.totalARSMGLMGMOD or 0  
  Modsui.totalBLADEMOD = Modsui.totalBLADEMOD or 0  
  Modsui.totalBLUNTWEAPONMOD = Modsui.totalBLUNTWEAPONMOD or 0  
  Modsui.totalMELEEWEAPONMOD = Modsui.totalMELEEWEAPONMOD or 0  
  Modsui.totalMUZZLEASSAULTRIFLESMG = Modsui.totalMUZZLEASSAULTRIFLESMG or 0  
  Modsui.totalMUZZLEHANDGUN = Modsui.totalMUZZLEHANDGUN or 0  
  Modsui.totalPISTOLREVOLVERMOD = Modsui.totalPISTOLREVOLVERMOD or 0  
  Modsui.totalPOWERWEAPONMOD = Modsui.totalPOWERWEAPONMOD or 0  
  Modsui.totalSCOPEGENERICLONG = Modsui.totalSCOPEGENERICLONG or 0  
  Modsui.totalSCOPEGENERICSHORT = Modsui.totalSCOPEGENERICSHORT or 0  
  Modsui.totalSCOPETECHSNIPER = Modsui.totalSCOPETECHSNIPER or 0  
  Modsui.totalSHOTGUNMOD = Modsui.totalSHOTGUNMOD or 0  
  Modsui.totalSILENCER = Modsui.totalSILENCER or 0  
  Modsui.totalSMARTWEAPONMOD = Modsui.totalSMARTWEAPONMOD or 0  
  Modsui.totalSNIPERPRECRIFLEMOD = Modsui.totalSNIPERPRECRIFLEMOD or 0  
  Modsui.totalTECHWEAPONMOD = Modsui.totalTECHWEAPONMOD or 0  
  Modsui.totalTHROWABLEWEAPONMOD = Modsui.totalTHROWABLEWEAPONMOD or 0  
  Modsui.totalWEAPONMOD = Modsui.totalWEAPONMOD or 0  
  

  
  Modsui.ownedTotalmod_ranged_weapon =
  Modsui.ownedTotalWEAPONMOD +
  Modsui.ownedTotalARSMGLMGMOD +
  Modsui.ownedTotalPISTOLREVOLVERMOD +
  Modsui.ownedTotalPOWERWEAPONMOD +
  Modsui.ownedTotalSHOTGUNMOD +
  Modsui.ownedTotalSMARTWEAPONMOD +
  Modsui.ownedTotalSNIPERPRECRIFLEMOD +
  Modsui.ownedTotalTECHWEAPONMOD
  
  Modsui.ownedTotalmelee_throwable_weapon =
  Modsui.ownedTotalBLADEMOD +
  Modsui.ownedTotalBLUNTWEAPONMOD +
  Modsui.ownedTotalMELEEWEAPONMOD +
  Modsui.ownedTotalTHROWABLEWEAPONMOD
  
  Modsui.ownedTotalmuzzles =
  Modsui.ownedTotalMUZZLEASSAULTRIFLESMG +
  Modsui.ownedTotalMUZZLEHANDGUN
  
  Modsui.totalmod_ranged_weapon =
  Modsui.totalWEAPONMOD +
  Modsui.totalARSMGLMGMOD +
  Modsui.totalPISTOLREVOLVERMOD +
  Modsui.totalPOWERWEAPONMOD +
  Modsui.totalSHOTGUNMOD +
  Modsui.totalSMARTWEAPONMOD +
  Modsui.totalSNIPERPRECRIFLEMOD +
  Modsui.totalTECHWEAPONMOD
  
  Modsui.totalmelee_throwable_weapon =
  Modsui.totalBLADEMOD +
  Modsui.totalBLUNTWEAPONMOD +
  Modsui.totalMELEEWEAPONMOD +
  Modsui.totalTHROWABLEWEAPONMOD
  
  Modsui.totalmuzzles =
  Modsui.totalMUZZLEASSAULTRIFLESMG +
  Modsui.totalMUZZLEHANDGUN
  
  Modsui.ownedTotalModsui =  
  Modsui.ownedTotalmod_ranged_weapon +
  Modsui.ownedTotalmelee_throwable_weapon +
  Modsui.ownedTotalmuzzles +
  Modsui.ownedTotalSCOPEGENERICLONG +
  Modsui.ownedTotalSCOPEGENERICSHORT +
  Modsui.ownedTotalSCOPETECHSNIPER +
  Modsui.ownedTotalSILENCER
  
  Modsui.totalTotalModsui =
  Modsui.totalmod_ranged_weapon +
  Modsui.totalmelee_throwable_weapon +
  Modsui.totalmuzzles +
  Modsui.totalSCOPEGENERICLONG +
  Modsui.totalSCOPEGENERICSHORT +
  Modsui.totalSCOPETECHSNIPER +
  Modsui.totalSILENCER 
  return Modsui.ownedTotalModsui, Modsui.totalTotalModsui
end
function Modsui.countmodliberty()
  Modsui.ownedPOWERWEAPONMODliberty, Modsui.totalPOWERWEAPONMODliberty = Modsui.CountOwnedWeapons(groupedMods.POWERWEAPONMOD_liberty)
  Modsui.ownedSMARTWEAPONMODliberty, Modsui.totalSMARTWEAPONMODliberty = Modsui.CountOwnedWeapons(groupedMods.SMARTWEAPONMOD_liberty)
  Modsui.ownedTECHWEAPONMODliberty, Modsui.totalTECHWEAPONMODliberty = Modsui.CountOwnedWeapons(groupedMods.TECHWEAPONMOD_liberty)
   
  
  Modsui.ownedTotalPOWERWEAPONMODliberty = Modsui.ownedPOWERWEAPONMODliberty or 0
  Modsui.ownedTotalSMARTWEAPONMODliberty = Modsui.ownedSMARTWEAPONMODliberty or 0
  Modsui.ownedTotalTECHWEAPONMODliberty = Modsui.ownedTECHWEAPONMODliberty or 0

  Modsui.totalPOWERWEAPONMODliberty = Modsui.totalPOWERWEAPONMODliberty or 0  
  Modsui.totalSMARTWEAPONMODliberty = Modsui.totalSMARTWEAPONMODliberty or 0  
  Modsui.totalTECHWEAPONMODliberty = Modsui.totalTECHWEAPONMODliberty or 0  
  

  
  Modsui.ownedTotalmod_ranged_weaponliberty =
  Modsui.ownedTotalPOWERWEAPONMODliberty +
  Modsui.ownedTotalSMARTWEAPONMODliberty +
  Modsui.ownedTotalTECHWEAPONMODliberty
  
  Modsui.totalmod_ranged_weaponliberty =
  Modsui.totalPOWERWEAPONMODliberty +
  Modsui.totalSMARTWEAPONMODliberty +
  Modsui.totalTECHWEAPONMODliberty
  
  Modsui.ownedTotalModsuiliberty =  
  Modsui.ownedTotalmod_ranged_weaponliberty
  
  Modsui.totalTotalModsuiliberty =
  Modsui.totalmod_ranged_weaponliberty 

  return Modsui.ownedTotalModsuiliberty, Modsui.totalTotalModsuiliberty
end
function Modsui.uiMod()
  if ImGui.CollapsingHeader(string.format(T("ATT_MOD") .."(%d/%d)",Modsui.ownedTotalModsui or 0, Modsui.totalTotalModsui or 0)) then
    ImGui.Indent(20)
    if ImGui.Button(string.format(T("ATT_SCOPESHORTMOD") .." (%d/%d)",Modsui.ownedTotalSCOPEGENERICSHORT or 0, Modsui.totalSCOPEGENERICSHORT or 0), -1, 0) then
              setActive("Modsui", "showSCOPEGENERICSHORT")
    end
    if ImGui.Button(string.format(T("ATT_SCOPELONGMOD") .." (%d/%d)",Modsui.ownedTotalSCOPEGENERICLONG or 0, Modsui.totalSCOPEGENERICLONG or 0), -1, 0) then
              setActive("Modsui", "showSCOPEGENERICLONG")
    end
    if ImGui.Button(string.format(T("ATT_SCOPESNIPEMOD") .." (%d/%d)",Modsui.ownedTotalSCOPETECHSNIPER or 0, Modsui.totalSCOPETECHSNIPER or 0), -1, 0) then
              setActive("Modsui", "showSCOPETECHSNIPER")
    end
    if ImGui.Button(string.format(T("ATT_SILENCERMOD") .." (%d/%d)",Modsui.ownedTotalSILENCER or 0, Modsui.totalSILENCER or 0), -1, 0) then
              setActive("Modsui", "showSILENCER")
    end
    if ImGui.CollapsingHeader(string.format(T("ATT_RANGED_WEAPONS") .." (%d/%d)",Modsui.ownedTotalmod_ranged_weapon or 0, Modsui.totalmod_ranged_weapon or 0)) then
    ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_RANGEDMOD") .." (%d/%d)",Modsui.ownedTotalWEAPONMOD or 0, Modsui.totalWEAPONMOD or 0), -1, 0) then
              setActive("Modsui", "showWEAPONMOD")
      end
      if ImGui.Button(string.format(T("ATT_POWERMOD") .." (%d/%d)",Modsui.ownedTotalPOWERWEAPONMOD or 0, Modsui.totalPOWERWEAPONMOD or 0), -1, 0)  then
              setActive("Modsui", "showPOWERWEAPONMOD")
      end
      if ImGui.Button(string.format(T("ATT_TECHMOD") .." (%d/%d)",Modsui.ownedTotalTECHWEAPONMOD or 0, Modsui.totalTECHWEAPONMOD or 0), -1, 0) then
              setActive("Modsui", "showTECHWEAPONMOD")
      end
      if ImGui.Button(string.format(T("ATT_SMARTMOD") .."(%d/%d)",Modsui.ownedTotalSMARTWEAPONMOD or 0, Modsui.totalSMARTWEAPONMOD or 0), -1, 0) then
              setActive("Modsui", "showSMARTWEAPONMOD")
      end
      if ImGui.Button(string.format(T("ATT_ARSMGLMGMOD") .." (%d/%d)",Modsui.ownedTotalARSMGLMGMOD or 0, Modsui.totalARSMGLMGMOD or 0), -1, 0) then
              setActive("Modsui", "showARSMGLMGMOD")
      end
      if ImGui.Button(string.format(T("ATT_PISTREVMOD") .." (%d/%d)",Modsui.ownedTotalPISTOLREVOLVERMOD or 0, Modsui.totalPISTOLREVOLVERMOD or 0), -1, 0) then
              setActive("Modsui", "showPISTOLREVOLVERMOD")
      end
      if ImGui.Button(string.format(T("ATT_SNIPEPRECMOD") .." (%d/%d)",Modsui.ownedTotalSNIPERPRECRIFLEMOD or 0, Modsui.totalSNIPERPRECRIFLEMOD or 0), -1, 0) then
              setActive("Modsui", "showSNIPERPRECRIFLEMOD")
      end
      if ImGui.Button(string.format(T("ATT_SHOTGUNMOD") .." (%d/%d)",Modsui.ownedTotalSHOTGUNMOD or 0, Modsui.totalSHOTGUNMOD or 0), -1, 0) then
              setActive("Modsui", "showSHOTGUNMOD")
       
      end
      ImGui.Unindent(20)
    end
    if ImGui.CollapsingHeader(string.format(T("ATT_THROWABLE") .." (%d/%d)",Modsui.ownedTotalmelee_throwable_weapon or 0, Modsui.totalmelee_throwable_weapon or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_MELEEMOD") .." (%d/%d)",Modsui.ownedTotalMELEEWEAPONMOD or 0, Modsui.totalMELEEWEAPONMOD or 0), -1, 0) then
              setActive("Modsui", "showMELEEWEAPONMOD")
      end
      if ImGui.Button(string.format(T("ATT_BLADEMOD") .." (%d/%d)",Modsui.ownedTotalBLADEMOD or 0, Modsui.totalBLADEMOD or 0), -1, 0) then
              setActive("Modsui", "showBLADEMOD")
      end
      if ImGui.Button(string.format(T("ATT_BLUNTMOD") .." (%d/%d)",Modsui.ownedTotalBLUNTWEAPONMOD or 0, Modsui.totalBLUNTWEAPONMOD or 0), -1, 0) then
              setActive("Modsui", "showBLUNTWEAPONMOD")
      end
      if ImGui.Button(string.format(T("ATT_THROWABLEMOD") .." (%d/%d)",Modsui.ownedTotalTHROWABLEWEAPONMOD or 0, Modsui.totalTHROWABLEWEAPONMOD or 0), -1, 0) then
              setActive("Modsui", "showTHROWABLEWEAPONMOD")
      end
      ImGui.Unindent(20)
    end
    
    if ImGui.CollapsingHeader(string.format(T("ATT_MUZZLES") .." (%d/%d)",Modsui.ownedTotalmuzzles or 0, Modsui.totalmuzzles or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_MUZZLES_AR_SMG") .." (%d/%d)",Modsui.ownedTotalMUZZLEASSAULTRIFLESMG or 0, Modsui.totalMUZZLEASSAULTRIFLESMG or 0), -1, 0) then
              setActive("Modsui", "showMUZZLEASSAULTRIFLESMG")
      end
      if ImGui.Button(string.format(T("ATT_MUZZLE_HANDGUN") .." (%d/%d)",Modsui.ownedTotalMUZZLEHANDGUN or 0, Modsui.totalMUZZLEHANDGUN or 0), -1, 0) then
              setActive("Modsui", "showMUZZLEHANDGUN")
      end
      ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
  end
end

function Modsui.uiModliberty()
  if ImGui.CollapsingHeader(string.format(T("ATT_MOD") .."(%d/%d)",Modsui.ownedTotalModsuiliberty or 0, Modsui.totalTotalModsuiliberty or 0)) then
    ImGui.Indent(20)
    if ImGui.CollapsingHeader(string.format(T("ATT_RANGED_WEAPONS") .." (%d/%d)",Modsui.ownedTotalmod_ranged_weaponliberty or 0, Modsui.totalmod_ranged_weaponliberty or 0)) then
    ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_POWERMOD") .." (%d/%d)",Modsui.ownedTotalPOWERWEAPONMODliberty or 0, Modsui.totalPOWERWEAPONMODliberty or 0), -1, 0) then
              setActive("Modsui", "showPOWERWEAPONMOD")
      end
      if ImGui.Button(string.format(T("ATT_TECHMOD") .." (%d/%d)",Modsui.ownedTotalTECHWEAPONMODliberty or 0, Modsui.totalTECHWEAPONMODliberty or 0), -1, 0) then
              setActive("Modsui", "showTECHWEAPONMOD")
      end
      if ImGui.Button(string.format(T("ATT_SMARTMOD") .."(%d/%d)",Modsui.ownedTotalSMARTWEAPONMODliberty or 0, Modsui.totalSMARTWEAPONMODliberty or 0), -1, 0) then
              setActive("Modsui", "showSMARTWEAPONMOD")
      end
      ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
  end
end

Modsui.groupedMods = groupedMods

return Modsui