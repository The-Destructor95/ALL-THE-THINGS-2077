local Cyberwaresui = {}

local selectedName = nil
local showOnlyWeapons = false
local showOnlyVehicles = false
local showOnlyCyberwares = false
local showOnlyMisc = false
local searchName = ""
local searchType = ""
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

-- local translationstests = loadTranslations() or {}  -- ✅ Sécurisation

local cyberwares = require("data/cyberwares")
local groupedCyberwares = {
        Arms = {},
        Arms_liberty = {},
        circulatorySystems = {},
        circulatorySystems_liberty = {},
        FacesCY = {},
        FacesCY_liberty = {},
        FrontalCortexs = {},
        FrontalCortexs_liberty = {},
        HandsCY = {},
        HandsCY_liberty = {},
        IntegumentarSystems = {},
        IntegumentarSystems_liberty = {},
        LegsCY = {},
        LegsCY_liberty = {},
        NervousSystems = {},
        NervousSystems_liberty = {},
        OperatingSystems = {},
        OperatingSystems_liberty = {},
        Skeletons = {},
        Skeletons_liberty = {}
}
  for _, arm in ipairs(cyberwares.arms) do
    local armData = {
      recordID = arm[1],
      name = arm[2],
      acquisitionID = arm[3]
     }
    local acquisitionData = translationstests[armData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.Arms[armData.name] then
          groupedCyberwares.Arms[armData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
          acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.Arms[armData.name].recordIDs, armData.recordID)
  end
  for _, arm_liberty in ipairs(cyberwares.arms_liberty) do
    local armData_liberty = {
      recordID = arm_liberty[1],
      name = arm_liberty[2],
      acquisitionID = arm_liberty[3]
     }
    local acquisitionData = translationstests[armData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.Arms_liberty[armData_liberty.name] then
          groupedCyberwares.Arms_liberty[armData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
          acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.Arms_liberty[armData_liberty.name].recordIDs, armData_liberty.recordID)
  end
  for _, circulatorysystem in ipairs(cyberwares.circulatory_systems) do
    local circulatorysystemData = {
      recordID = circulatorysystem[1],
      name = circulatorysystem[2],
      acquisitionID = circulatorysystem[3]
     }
    local acquisitionData = translationstests[circulatorysystemData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.circulatorySystems[circulatorysystemData.name] then
          groupedCyberwares.circulatorySystems[circulatorysystemData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.circulatorySystems[circulatorysystemData.name].recordIDs, circulatorysystemData.recordID)
  end
  for _, circulatorysystem_liberty in ipairs(cyberwares.circulatory_systems_liberty) do
    local circulatorysystemData_liberty = {
      recordID = circulatorysystem_liberty[1],
      name = circulatorysystem_liberty[2],
      acquisitionID = circulatorysystem_liberty[3]
     }
    local acquisitionData = translationstests[circulatorysystemData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.circulatorySystems_liberty[circulatorysystemData_liberty.name] then
          groupedCyberwares.circulatorySystems_liberty[circulatorysystemData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.circulatorySystems_liberty[circulatorysystemData_liberty.name].recordIDs, circulatorysystemData_liberty.recordID)
  end
  for _, faceCY in ipairs(cyberwares.facesCY) do
    local faceCYData = {
      recordID = faceCY[1],
      name = faceCY[2],
      acquisitionID = faceCY[3]
     }
    local acquisitionData = translationstests[faceCYData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.FacesCY[faceCYData.name] then
          groupedCyberwares.FacesCY[faceCYData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad}
      end
      table.insert(groupedCyberwares.FacesCY[faceCYData.name].recordIDs, faceCYData.recordID)
  end
  for _, faceCY_liberty in ipairs(cyberwares.facesCY_liberty) do
    local faceCYData_liberty = {
      recordID = faceCY_liberty[1],
      name = faceCY_liberty[2],
      acquisitionID = faceCY_liberty[3]
     }
    local acquisitionData = translationstests[faceCYData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.FacesCY_liberty[faceCYData_liberty.name] then
          groupedCyberwares.FacesCY_liberty[faceCYData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad}
      end
      table.insert(groupedCyberwares.FacesCY_liberty[faceCYData_liberty.name].recordIDs, faceCYData_liberty.recordID)
  end
  for _, frontalcortex in ipairs(cyberwares.frontal_cortexs) do
    local frontalcortexData = {
      recordID = frontalcortex[1],
      name = frontalcortex[2],
      acquisitionID = frontalcortex[3]
     }
    local acquisitionData = translationstests[frontalcortexData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.FrontalCortexs[frontalcortexData.name] then
          groupedCyberwares.FrontalCortexs[frontalcortexData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.FrontalCortexs[frontalcortexData.name].recordIDs, frontalcortexData.recordID)
  end
  for _, frontalcortex_liberty in ipairs(cyberwares.frontal_cortexs_liberty) do
    local frontalcortexData_liberty = {
      recordID = frontalcortex_liberty[1],
      name = frontalcortex_liberty[2],
      acquisitionID = frontalcortex_liberty[3]
     }
    local acquisitionData = translationstests[frontalcortexData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.FrontalCortexs_liberty[frontalcortexData_liberty.name] then
          groupedCyberwares.FrontalCortexs_liberty[frontalcortexData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.FrontalCortexs_liberty[frontalcortexData_liberty.name].recordIDs, frontalcortexData_liberty.recordID)
  end
  for _, handCY in ipairs(cyberwares.handsCY) do
    local handCYData = {
      recordID = handCY[1],
      name = handCY[2],
      acquisitionID = handCY[3]
     }
    local acquisitionData = translationstests[handCYData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.HandsCY[handCYData.name] then
          groupedCyberwares.HandsCY[handCYData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.HandsCY[handCYData.name].recordIDs, handCYData.recordID)
  end
  for _, handCY_liberty in ipairs(cyberwares.handsCY_liberty) do
    local handCYData_liberty = {
      recordID = handCY_liberty[1],
      name = handCY_liberty[2],
      acquisitionID = handCY_liberty[3]
     }
    local acquisitionData = translationstests[handCYData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.HandsCY_liberty[handCYData_liberty.name] then
          groupedCyberwares.HandsCY_liberty[handCYData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.HandsCY_liberty[handCYData_liberty.name].recordIDs, handCYData_liberty.recordID)
  end
  for _, integumentarysystem in ipairs(cyberwares.integumentary_systems) do
    local integumentarysystemData = {
      recordID = integumentarysystem[1],
      name = integumentarysystem[2],
      acquisitionID = integumentarysystem[3]
     }
    local acquisitionData = translationstests[integumentarysystemData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.IntegumentarSystems[integumentarysystemData.name] then
          groupedCyberwares.IntegumentarSystems[integumentarysystemData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.IntegumentarSystems[integumentarysystemData.name].recordIDs, integumentarysystemData.recordID)
  end
  for _, integumentarysystem_liberty in ipairs(cyberwares.integumentary_systems_liberty) do
    local integumentarysystemData_liberty = {
      recordID = integumentarysystem_liberty[1],
      name = integumentarysystem_liberty[2],
      acquisitionID = integumentarysystem_liberty[3]
     }
    local acquisitionData = translationstests[integumentarysystemData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.IntegumentarSystems_liberty[integumentarysystemData_liberty.name] then
          groupedCyberwares.IntegumentarSystems_liberty[integumentarysystemData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.IntegumentarSystems_liberty[integumentarysystemData_liberty.name].recordIDs, integumentarysystemData_liberty.recordID)
  end
  for _, legCY in ipairs(cyberwares.legsCY) do
    local legCYData = {
      recordID = legCY[1],
      name = legCY[2],
      acquisitionID = legCY[3]
     }
    local acquisitionData = translationstests[legCYData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.LegsCY[legCYData.name] then
          groupedCyberwares.LegsCY[legCYData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad}
      end
      table.insert(groupedCyberwares.LegsCY[legCYData.name].recordIDs, legCYData.recordID)
  end
  for _, legCY_liberty in ipairs(cyberwares.legsCY_liberty) do
    local legCYData_liberty = {
      recordID = legCY_liberty[1],
      name = legCY_liberty[2],
      acquisitionID = legCY_liberty[3]
     }
    local acquisitionData = translationstests[legCYData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.LegsCY_liberty[legCYData_liberty.name] then
          groupedCyberwares.LegsCY_liberty[legCYData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad}
      end
      table.insert(groupedCyberwares.LegsCY_liberty[legCYData_liberty.name].recordIDs, legCYData_liberty.recordID)
  end
  for _, nervoussystem in ipairs(cyberwares.nervous_systems) do
    local nervoussystemData = {
      recordID = nervoussystem[1],
      name = nervoussystem[2],
      acquisitionID = nervoussystem[3]
     }
    local acquisitionData = translationstests[nervoussystemData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.NervousSystems[nervoussystemData.name] then
          groupedCyberwares.NervousSystems[nervoussystemData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.NervousSystems[nervoussystemData.name].recordIDs, nervoussystemData.recordID)
  end
  for _, nervoussystem_liberty in ipairs(cyberwares.nervous_systems_liberty) do
    local nervoussystemData_liberty = {
      recordID = nervoussystem_liberty[1],
      name = nervoussystem_liberty[2],
      acquisitionID = nervoussystem_liberty[3]
     }
    local acquisitionData = translationstests[nervoussystemData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.NervousSystems_liberty[nervoussystemData_liberty.name] then
          groupedCyberwares.NervousSystems_liberty[nervoussystemData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.NervousSystems_liberty[nervoussystemData_liberty.name].recordIDs, nervoussystemData_liberty.recordID)
  end
  for _, operatingsystem in ipairs(cyberwares.operating_systems) do
    local operatingsystemData = {
      recordID = operatingsystem[1],
      name = operatingsystem[2],
      acquisitionID = operatingsystem[3]
     }
    local acquisitionData = translationstests[operatingsystemData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.OperatingSystems[operatingsystemData.name] then
          groupedCyberwares.OperatingSystems[operatingsystemData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.OperatingSystems[operatingsystemData.name].recordIDs, operatingsystemData.recordID)
  end
  for _, operatingsystem_liberty in ipairs(cyberwares.operating_systems_liberty) do
    local operatingsystemData_liberty = {
      recordID = operatingsystem_liberty[1],
      name = operatingsystem_liberty[2],
      acquisitionID = operatingsystem_liberty[3]
     }
    local acquisitionData = translationstests[operatingsystemData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.OperatingSystems_liberty[operatingsystemData_liberty.name] then
          groupedCyberwares.OperatingSystems_liberty[operatingsystemData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.OperatingSystems_liberty[operatingsystemData_liberty.name].recordIDs, operatingsystemData_liberty.recordID)
  end
  for _, skeleton in ipairs(cyberwares.skeletons) do
    local skeletonData = {
      recordID = skeleton[1],
      name = skeleton[2],
      acquisitionID = skeleton[3]
     }
    local acquisitionData = translationstests[skeletonData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.Skeletons[skeletonData.name] then
          groupedCyberwares.Skeletons[skeletonData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.Skeletons[skeletonData.name].recordIDs, skeletonData.recordID)
  end
  for _, skeleton_liberty in ipairs(cyberwares.skeletons_liberty) do
    local skeletonData_liberty = {
      recordID = skeleton_liberty[1],
      name = skeleton_liberty[2],
      acquisitionID = skeleton_liberty[3]
     }
    local acquisitionData = translationstests[skeletonData_liberty.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
      if not groupedCyberwares.Skeletons_liberty[skeletonData_liberty.name] then
          groupedCyberwares.Skeletons_liberty[skeletonData_liberty.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
      end
      table.insert(groupedCyberwares.Skeletons_liberty[skeletonData_liberty.name].recordIDs, skeletonData_liberty.recordID)
  end

  -- Cyberwaresui.knownCyberwareIDs = {}

  -- function Cyberwaresui.BuildCyberwareIndex()
  --     for _, CyberwareGroup in pairs(groupedCyberwares) do
  --         for name, data in pairs(CyberwareGroup) do
  --             for _, recordID in ipairs(data.recordIDs or {}) do
  --                 Cyberwaresui.knownCyberwareIDs[recordID] = name
  --             end
  --         end
  --     end
  -- end
  
  -- Cyberwaresui.BuildCyberwareIndex()
  Cyberwaresui.inventoryCache = {}
  -- Cyberwaresui.oldInventoryCache = {}
  -- Cyberwaresui.toast = nil
  -- Cyberwaresui.initialized = false
function Cyberwaresui.UpdateInventoryCache()
    Cyberwaresui.inventoryCache = {}
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
            Cyberwaresui.inventoryCache[itemRecordID] = true
        end
    end

    -- 🔍 Vérifie les items du coffre
    local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
    if stash then
        local stashSuccess, stashItems = transactionSystem:GetItemList(stash)
        if stashSuccess and stashItems then
            for _, item in ipairs(stashItems) do
                local itemRecordID = item:GetID().id.value
                Cyberwaresui.inventoryCache[itemRecordID] = true
            end
        end
    end
end
--   function Cyberwaresui.UpdateInventoryCache()
--   Cyberwaresui.oldInventoryCache = Cyberwaresui.inventoryCache or {}
--   Cyberwaresui.inventoryCache = {}

--   local transactionSystem = Game.GetTransactionSystem()
--   local player = GetPlayer()

--   local newItems = {}

--   local function checkAndAddItems(entity)
--       local success, items = transactionSystem:GetItemList(entity)
--       if success and items then
--           for _, item in ipairs(items) do
--               local recordID = item:GetID().id.value
--               Cyberwaresui.inventoryCache[recordID] = true

--               if not Cyberwaresui.oldInventoryCache[recordID] and Cyberwaresui.knownCyberwareIDs[recordID] then
--                   table.insert(newItems, recordID)
--               end
--           end
--       end
--   end

--   checkAndAddItems(player)
--   local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
--   checkAndAddItems(stash)

--   if not Cyberwaresui.initialized then
--       Cyberwaresui.initialized = true
--       return
--   end

--   if #newItems > 0 then
--       Cyberwaresui.NotifyNewItems(newItems)
--   end
-- end

-- function Cyberwaresui.NotifyNewItems(recordIDs)
--   if ATT.enableNotifications then return end

--   local notified = {}

--   local newlyDiscoveredNames = {}

--   for _, recordID in ipairs(recordIDs) do
--       local name = Cyberwaresui.knownCyberwareIDs[recordID]
--       if name then
--           newlyDiscoveredNames[name] = true
--       end
--   end

--   for name, _ in pairs(newlyDiscoveredNames) do
--       local found = false
--       local group = groupedCyberwares -- raccourci
--       for _, data in pairs(group) do
--           if data[name] then
--               for _, id in ipairs(data[name].recordIDs) do
--                   if Cyberwaresui.oldInventoryCache[id] then
--                       found = true 
--                       break
--                   end
--               end
--           end
--           if found then break end
--       end

--       if not found then
--           ATT.GameHUD.ShowMessage(T("ATT_Collected_Item") .. ":\n" .. name)
--       end
--   end
-- end



function Cyberwaresui.CheckInStashAndInventory(recordID)
    return Cyberwaresui.inventoryCache[recordID] or false
end

-- 📌 Affichage des groupes d'armes
function Cyberwaresui.displayWeaponGroup(name, group)
    local width, _ = ImGui.GetContentRegionAvail() 
    

    for weaponName, data in pairs(group or {}) do  
        local inInventory = false
        for _, recordID in ipairs(data.recordIDs) do
            if Cyberwaresui.CheckInStashAndInventory(recordID) then
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
            ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.0, 1.0)  -- ✅ Vert si possédé
        else
            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.0, 0.0, 1.0)  -- ❌ Rouge si non possédé
        end

        if ImGui.Selectable(weaponName, Cyberwaresui.selectedName == weaponName) then
            Cyberwaresui.selectedName = weaponName
        end

        ImGui.PopStyleColor()
        ::continue::  
    end

   
end
function Cyberwaresui.CountOwnedWeapons(group)
  Cyberwaresui.ownedCount = 0
  Cyberwaresui.totalCount = 0

  for _, data in pairs(group or {}) do
      Cyberwaresui.totalCount = Cyberwaresui.totalCount + 1
      for _, recordID in ipairs(data.recordIDs) do
          if Cyberwaresui.CheckInStashAndInventory(recordID) then
              Cyberwaresui.ownedCount = Cyberwaresui.ownedCount + 1
              break
          end
      end
  end

  return Cyberwaresui.ownedCount, Cyberwaresui.totalCount
end
function Cyberwaresui.count()
  Cyberwaresui.ownedArms, Cyberwaresui.totalArms = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.Arms)
  
  Cyberwaresui.ownedcirculatorySystems, Cyberwaresui.totalcirculatorySystems = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.circulatorySystems)
  
  Cyberwaresui.ownedFacesCY, Cyberwaresui.totalFacesCY = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.FacesCY)
  
  Cyberwaresui.ownedFrontalCortexs, Cyberwaresui.totalFrontalCortexs = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.FrontalCortexs)
  
  Cyberwaresui.ownedHandsCY, Cyberwaresui.totalHandsCY = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.HandsCY)
  
  Cyberwaresui.ownedIntegumentarSystems, Cyberwaresui.totalIntegumentarSystems = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.IntegumentarSystems)
  
  Cyberwaresui.ownedLegsCY, Cyberwaresui.totalLegsCY = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.LegsCY)
  
  Cyberwaresui.ownedNervousSystems, Cyberwaresui.totalNervousSystems = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.NervousSystems)
  
  Cyberwaresui.ownedOperatingSystems, Cyberwaresui.totalOperatingSystems = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.OperatingSystems)
  
  Cyberwaresui.ownedSkeletons, Cyberwaresui.totalSkeletons = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.Skeletons)


  Cyberwaresui.ownedTotalArms = Cyberwaresui.ownedArms or 0
  Cyberwaresui.totalArms = Cyberwaresui.totalArms or 0
  
  Cyberwaresui.ownedTotalcirculatorySystems = Cyberwaresui.ownedcirculatorySystems or 0
  Cyberwaresui.totalcirculatorySystems = Cyberwaresui.totalcirculatorySystems or 0
  
  Cyberwaresui.ownedTotalFacesCY = Cyberwaresui.ownedFacesCY or 0
  Cyberwaresui.totalFacesCY = Cyberwaresui.totalFacesCY or 0
  
  Cyberwaresui.ownedTotalFrontalCortexs = Cyberwaresui.ownedFrontalCortexs or 0
  Cyberwaresui.totalFrontalCortexs = Cyberwaresui.totalFrontalCortexs or 0
  
  Cyberwaresui.ownedTotalHandsCY = Cyberwaresui.ownedHandsCY or 0
  Cyberwaresui.totalHandsCY = Cyberwaresui.totalHandsCY or 0
  
  Cyberwaresui.ownedTotalIntegumentarSystems = Cyberwaresui.ownedIntegumentarSystems or 0
  Cyberwaresui.totalIntegumentarSystems = Cyberwaresui.totalIntegumentarSystems or 0
  
  Cyberwaresui.ownedTotalLegsCY = Cyberwaresui.ownedLegsCY or 0
  Cyberwaresui.totalLegsCY = Cyberwaresui.totalLegsCY or 0
  
  Cyberwaresui.ownedTotalNervousSystems = Cyberwaresui.ownedNervousSystems or 0
  Cyberwaresui.totalNervousSystems = Cyberwaresui.totalNervousSystems or 0
  
  Cyberwaresui.ownedTotalOperatingSystems = Cyberwaresui.ownedOperatingSystems or 0
  Cyberwaresui.totalOperatingSystems = Cyberwaresui.totalOperatingSystems or 0
  
  Cyberwaresui.ownedTotalSkeletons = Cyberwaresui.ownedSkeletons or 0
  Cyberwaresui.totalSkeletons = Cyberwaresui.totalSkeletons or 0
  
  Cyberwaresui.ownedTotalCyberwares = --Cyberwaresui.ownedTotalAxes +
  Cyberwaresui.ownedTotalArms +
  Cyberwaresui.ownedTotalcirculatorySystems +
  Cyberwaresui.ownedTotalFacesCY +
  Cyberwaresui.ownedTotalFrontalCortexs +
  Cyberwaresui.ownedTotalHandsCY +
  Cyberwaresui.ownedTotalIntegumentarSystems +
  Cyberwaresui.ownedTotalLegsCY +
  Cyberwaresui.ownedTotalNervousSystems+
  Cyberwaresui.ownedTotalOperatingSystems+
  Cyberwaresui.ownedTotalSkeletons

Cyberwaresui.totalTotalCyberwares = --Cyberwaresui.totalAxes +
Cyberwaresui.totalArms +
Cyberwaresui.totalcirculatorySystems +
Cyberwaresui.totalFacesCY +
Cyberwaresui.totalFrontalCortexs +
Cyberwaresui.totalHandsCY +
Cyberwaresui.totalIntegumentarSystems +
Cyberwaresui.totalLegsCY +
Cyberwaresui.totalNervousSystems+
Cyberwaresui.totalOperatingSystems+
Cyberwaresui.totalSkeletons

return Cyberwaresui.ownedTotalCyberwares, Cyberwaresui.totalTotalCyberwares
end
function Cyberwaresui.countcyberwaresliberty()
  Cyberwaresui.ownedArms_liberty, Cyberwaresui.totalArms_liberty = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.Arms_liberty)
  
  Cyberwaresui.ownedcirculatorySystems_liberty , Cyberwaresui.totalcirculatorySystems_liberty  = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.circulatorySystems_liberty )
  
  Cyberwaresui.ownedFacesCY_liberty, Cyberwaresui.totalFacesCY_liberty = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.FacesCY_liberty)
  
  Cyberwaresui.ownedFrontalCortexs_liberty, Cyberwaresui.totalFrontalCortexs_liberty = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.FrontalCortexs_liberty)
  
  Cyberwaresui.ownedHandsCY_liberty, Cyberwaresui.totalHandsCY_liberty = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.HandsCY_liberty)
  
  Cyberwaresui.ownedIntegumentarSystems_liberty, Cyberwaresui.totalIntegumentarSystems_liberty = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.IntegumentarSystems_liberty)
  
  Cyberwaresui.ownedLegsCY_liberty, Cyberwaresui.totalLegsCY_liberty = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.LegsCY_liberty)
  
  Cyberwaresui.ownedNervousSystems_liberty, Cyberwaresui.totalNervousSystems_liberty = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.NervousSystems_liberty)
  
  Cyberwaresui.ownedOperatingSystems_liberty, Cyberwaresui.totalOperatingSystems_liberty = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.OperatingSystems_liberty)
  
  Cyberwaresui.ownedSkeletons_liberty, Cyberwaresui.totalSkeletons_liberty = Cyberwaresui.CountOwnedWeapons(groupedCyberwares.Skeletons_liberty)


  Cyberwaresui.ownedTotalArms_liberty = Cyberwaresui.ownedArms_liberty or 0
  Cyberwaresui.totalArms_liberty = Cyberwaresui.totalArms_liberty or 0
  
  Cyberwaresui.ownedTotalcirculatorySystems_liberty = Cyberwaresui.ownedcirculatorySystems_liberty or 0
  Cyberwaresui.totalcirculatorySystems_liberty = Cyberwaresui.totalcirculatorySystems_liberty or 0
  
  Cyberwaresui.ownedTotalFacesCY_liberty = Cyberwaresui.ownedFacesCY_liberty or 0
  Cyberwaresui.totalFacesCY_liberty = Cyberwaresui.totalFacesCY_liberty or 0
  
  Cyberwaresui.ownedTotalFrontalCortexs_liberty = Cyberwaresui.ownedFrontalCortexs_liberty or 0
  Cyberwaresui.totalFrontalCortexs_liberty = Cyberwaresui.totalFrontalCortexs_liberty or 0
  
  Cyberwaresui.ownedTotalHandsCY_liberty = Cyberwaresui.ownedHandsCY_liberty or 0
  Cyberwaresui.totalHandsCY_liberty = Cyberwaresui.totalHandsCY_liberty or 0
  
  Cyberwaresui.ownedTotalIntegumentarSystems_liberty = Cyberwaresui.ownedIntegumentarSystems_liberty or 0
  Cyberwaresui.totalIntegumentarSystems_liberty = Cyberwaresui.totalIntegumentarSystems_liberty or 0
  
  Cyberwaresui.ownedTotalLegsCY_liberty = Cyberwaresui.ownedLegsCY_liberty or 0
  Cyberwaresui.totalLegsCY_liberty = Cyberwaresui.totalLegsCY_liberty or 0
  
  Cyberwaresui.ownedTotalNervousSystems_liberty = Cyberwaresui.ownedNervousSystems_liberty or 0
  Cyberwaresui.totalNervousSystems_liberty = Cyberwaresui.totalNervousSystems_liberty or 0
  
  Cyberwaresui.ownedTotalOperatingSystems_liberty = Cyberwaresui.ownedOperatingSystems_liberty or 0
  Cyberwaresui.totalOperatingSystems_liberty = Cyberwaresui.totalOperatingSystems_liberty or 0
  
  Cyberwaresui.ownedTotalSkeletons_liberty = Cyberwaresui.ownedSkeletons_liberty or 0
  Cyberwaresui.totalSkeletons_liberty = Cyberwaresui.totalSkeletons_liberty or 0
  
  Cyberwaresui.ownedTotalCyberwaresliberty = --Cyberwaresui.ownedTotalAxes +
  Cyberwaresui.ownedArms_liberty +
  Cyberwaresui.ownedcirculatorySystems_liberty +
  Cyberwaresui.ownedFacesCY_liberty +
  Cyberwaresui.ownedFrontalCortexs_liberty +
  Cyberwaresui.ownedHandsCY_liberty +
  Cyberwaresui.ownedIntegumentarSystems_liberty +
  Cyberwaresui.ownedLegsCY_liberty +
  Cyberwaresui.ownedNervousSystems_liberty+
  Cyberwaresui.ownedOperatingSystems_liberty+
  Cyberwaresui.ownedSkeletons_liberty

Cyberwaresui.totalTotalCyberwaresliberty = --Cyberwaresui.totalAxes +
Cyberwaresui.totalArms_liberty +
Cyberwaresui.totalcirculatorySystems_liberty +
Cyberwaresui.totalFacesCY_liberty +
Cyberwaresui.totalFrontalCortexs_liberty +
Cyberwaresui.totalHandsCY_liberty +
Cyberwaresui.totalIntegumentarSystems_liberty +
Cyberwaresui.totalLegsCY_liberty +
Cyberwaresui.totalNervousSystems_liberty+
Cyberwaresui.totalOperatingSystems_liberty+
Cyberwaresui.totalSkeletons_liberty

return Cyberwaresui.ownedTotalCyberwaresliberty, Cyberwaresui.totalTotalCyberwaresliberty
end
function Cyberwaresui.uicyberwares()
  if ImGui.CollapsingHeader(string.format(T("ATT_CYBERWARE") .."(%d/%d)",Cyberwaresui.ownedTotalCyberwares or 0, Cyberwaresui.totalTotalCyberwares or 0)) then
        ImGui.Indent(20)
        
        -- Filtrage des cyberwares
        if not ATT.showOnlyCyberwares then
            goto skipCyberwares
        end
        
        ::skipCyberwares::
        
        if ImGui.Button(string.format(T("ATT_ARMS") .." (%d/%d)",Cyberwaresui.ownedTotalArms or 0, Cyberwaresui.totalArms or 0), -1, 0) then
              setActive("Cyberwaresui", "showArms")
        end
        if ImGui.Button(string.format(T("ATT_CIRCULATORY_SYSTEMS") .." (%d/%d)",Cyberwaresui.ownedTotalcirculatorySystems or 0, Cyberwaresui.totalcirculatorySystems or 0), -1, 0) then
              setActive("Cyberwaresui", "showcirculatorySystems")
        end
        if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Cyberwaresui.ownedTotalFacesCY or 0, Cyberwaresui.totalFacesCY or 0), -1, 0) then
              setActive("Cyberwaresui", "showFacesCY")
    end
    if ImGui.Button(string.format(T("ATT_FRONTAL_CORTEX") .." (%d/%d)",Cyberwaresui.ownedTotalFrontalCortexs or 0, Cyberwaresui.totalFrontalCortexs or 0), -1, 0) then
              setActive("Cyberwaresui", "showFrontalCortexs")
    end
    if ImGui.Button(string.format(T("ATT_HANDS") .." (%d/%d)",Cyberwaresui.ownedTotalHandsCY or 0, Cyberwaresui.totalHandsCY or 0), -1, 0) then
              setActive("Cyberwaresui", "showHandsCY")
    end
    if ImGui.Button(string.format(T("ATT_INTEGUMENTARY") .." (%d/%d)",Cyberwaresui.ownedTotalIntegumentarSystems or 0, Cyberwaresui.totalIntegumentarSystems or 0), -1, 0) then
              setActive("Cyberwaresui", "showIntegumentarSystems")
    end
    if ImGui.Button(string.format(T("ATT_LEGSCY") .." (%d/%d)",Cyberwaresui.ownedTotalLegsCY or 0, Cyberwaresui.totalLegsCY or 0), -1, 0) then
              setActive("Cyberwaresui", "showLegsCY")
    end
    if ImGui.Button(string.format(T("ATT_NERVOUS_SYSTEM") .." (%d/%d)",Cyberwaresui.ownedTotalNervousSystems or 0, Cyberwaresui.totalNervousSystems or 0), -1, 0) then
              setActive("Cyberwaresui", "showNervousSystems")
    end
    if ImGui.Button(string.format(T("ATT_OPERATION_SYSTEMS") .." (%d/%d)",Cyberwaresui.ownedTotalOperatingSystems or 0, Cyberwaresui.totalOperatingSystems or 0), -1, 0) then
              setActive("Cyberwaresui", "showOperatingSystems")
    end
    if ImGui.Button(string.format(T("ATT_SKELETONS") .." (%d/%d)",Cyberwaresui.ownedTotalSkeletons or 0, Cyberwaresui.totalSkeletons or 0), -1, 0) then
              setActive("Cyberwaresui", "showSkeletons")
    end
    ImGui.Unindent(20)
  end 
end
function Cyberwaresui.uicyberwaresliberty()
  if ImGui.CollapsingHeader(string.format(T("ATT_CYBERWARE") .."(%d/%d)",Cyberwaresui.ownedTotalCyberwaresliberty or 0, Cyberwaresui.totalTotalCyberwaresliberty or 0)) then
    ImGui.Indent(20)
    if ImGui.Button(string.format(T("ATT_ARMS") .." (%d/%d)",Cyberwaresui.ownedArms_liberty or 0, Cyberwaresui.totalArms_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showArms")
              
    end
    if ImGui.Button(string.format(T("ATT_CIRCULATORY_SYSTEMS") .." (%d/%d)",Cyberwaresui.ownedcirculatorySystems_liberty or 0, Cyberwaresui.totalcirculatorySystems_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showcirculatorySystems")
    end
    if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Cyberwaresui.ownedFacesCY_liberty or 0, Cyberwaresui.totalFacesCY_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showFacesCY")
    end
    if ImGui.Button(string.format(T("ATT_FRONTAL_CORTEX") .." (%d/%d)",Cyberwaresui.ownedFrontalCortexs_liberty or 0, Cyberwaresui.totalFrontalCortexs_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showFrontalCortexs")
    end
    if ImGui.Button(string.format(T("ATT_HANDS") .." (%d/%d)",Cyberwaresui.ownedHandsCY_liberty or 0, Cyberwaresui.totalHandsCY_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showHandsCY")
    end
    if ImGui.Button(string.format(T("ATT_INTEGUMENTARY") .." (%d/%d)",Cyberwaresui.ownedIntegumentarSystems_liberty or 0, Cyberwaresui.totalIntegumentarSystems_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showIntegumentarSystems")
    end
    if ImGui.Button(string.format(T("ATT_LEGSCY") .." (%d/%d)",Cyberwaresui.ownedLegsCY_liberty or 0, Cyberwaresui.totalLegsCY_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showLegsCY")
    end
    if ImGui.Button(string.format(T("ATT_NERVOUS_SYSTEM") .." (%d/%d)",Cyberwaresui.ownedNervousSystems_liberty or 0, Cyberwaresui.totalNervousSystems_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showNervousSystems")
    end
    if ImGui.Button(string.format(T("ATT_OPERATION_SYSTEMS") .." (%d/%d)",Cyberwaresui.ownedOperatingSystems_liberty or 0, Cyberwaresui.totalOperatingSystems_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showOperatingSystems")
    end
    if ImGui.Button(string.format(T("ATT_SKELETONS") .." (%d/%d)",Cyberwaresui.ownedSkeletons_liberty or 0, Cyberwaresui.totalSkeletons_liberty or 0), -1, 0) then
              setActive("Cyberwaresui", "showSkeletons")
    end
    ImGui.Unindent(20)
  end
end

Cyberwaresui.groupedCyberwares = groupedCyberwares

return Cyberwaresui