


local Quickhacksui = {}
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
ATT.translations            = require("trad/Interface")
ATT.selectedLanguage        = "en"

local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
end
-- local translationstests = loadTranslations() or {}  

local quickhacks = require("data/quickhacks")
local groupedQuickhacks = {
          combat = {},
          control = {},
          covert = {},
          ultimate = {}
}
-- local function getLocalizedItemName(recordID)
--     local record = TweakDB:GetRecord(recordID)
--     if record then
--         local locText = record:LocalizedName()
--         if locText then
--             return locText.value
--         end
--     end
--     return "❌ Nom inconnu"
-- end


-- for _, combat in ipairs(quickhacks.combats) do
--     local recordID = combat[1]
--     local name = getLocalizedItemName(recordID)
--     local acquisitionID = combat[3]

--     local combatData = {
--         recordID = recordID,
--         name = name,
--         acquisitionID = acquisitionID
--     }
    
--     local acquisitionData = translationstests[combatData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
--     if not groupedQuickhacks.combat[combatData.name] then
--         groupedQuickhacks.combat[combatData.name] = { 
--           recordIDs = {}, 
--           acquisitionen = acquisitionData.en,
--             acquisitiontrad = acquisitionData.trad }
--     end
--     table.insert(groupedQuickhacks.combat[combatData.name].recordIDs, combatData.recordID)
--   end

  for _, combat in ipairs(quickhacks.combats) do
    local combatData = {
      recordID = combat[1],
      name = combat[2],
      acquisitionID = combat[3]
     }
    local acquisitionData = translationstests[combatData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedQuickhacks.combat[combatData.name] then
        groupedQuickhacks.combat[combatData.name] = { 
          recordIDs = {}, 
          acquisitionen = acquisitionData.en,
            acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedQuickhacks.combat[combatData.name].recordIDs, combatData.recordID)
  end
  for _, control in ipairs(quickhacks.controls) do
    local controlData = {
      recordID = control[1],
      name = control[2],
      acquisitionID = control[3]
     }
    local acquisitionData = translationstests[controlData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedQuickhacks.control[controlData.name] then
        groupedQuickhacks.control[controlData.name] = { 
        recordIDs = {}, 
        acquisitionen =  acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedQuickhacks.control[controlData.name].recordIDs, controlData.recordID)
  end
  for _, covert in ipairs(quickhacks.coverts) do
    local covertData = {
      recordID = covert[1],
      name = covert[2],
      acquisitionID = covert[3]
     }
    local acquisitionData = translationstests[covertData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedQuickhacks.covert[covertData.name] then
        groupedQuickhacks.covert[covertData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad }
    end
    table.insert(groupedQuickhacks.covert[covertData.name].recordIDs, covertData.recordID)
  end
  for _, ultimate in ipairs(quickhacks.ultimates) do
    local ultimateData = {
      recordID = ultimate[1],
      name = ultimate[2],
      acquisitionID = ultimate[3]
     }
    local acquisitionData = translationstests[ultimateData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
  
    if not groupedQuickhacks.ultimate[ultimateData.name] then
        groupedQuickhacks.ultimate[ultimateData.name] = { 
          recordIDs = {}, 
          acquisitionen = acquisitionData.en,
        acquisitiontrad = acquisitionData.trad
      }
    end
    table.insert(groupedQuickhacks.ultimate[ultimateData.name].recordIDs, ultimateData.recordID)
  end

--   Quickhacksui.knownQuickhackIDs = {}

--   function Quickhacksui.BuildQuickhackIndex()
--       for _, QuickhackGroup in pairs(groupedQuickhacks) do
--           for name, data in pairs(QuickhackGroup) do
--               for _, recordID in ipairs(data.recordIDs or {}) do
--                   Quickhacksui.knownQuickhackIDs[recordID] = name
--               end
--           end
--       end
--   end
-- Quickhacksui.BuildQuickhackIndex()

    Quickhacksui.inventoryCache = {}

--     Quickhacksui.oldInventoryCache = {}
-- Quickhacksui.toast = nil
-- Quickhacksui.initialized = false
 function Quickhacksui.UpdateInventoryCache()
        Quickhacksui.inventoryCache = {}
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
                Quickhacksui.inventoryCache[itemRecordID] = true
            end
        end
    
        -- 🔍 Vérifie les items du coffre
        local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
        if stash then
            local stashSuccess, stashItems = transactionSystem:GetItemList(stash)
            if stashSuccess and stashItems then
                for _, item in ipairs(stashItems) do
                    local itemRecordID = item:GetID().id.value
                    Quickhacksui.inventoryCache[itemRecordID] = true
                end
            end
        end
    end
    -- function Quickhacksui.UpdateInventoryCache()
    --     Quickhacksui.oldInventoryCache = Quickhacksui.inventoryCache or {}
    --     Quickhacksui.inventoryCache = {}
    
    --     local transactionSystem = Game.GetTransactionSystem()
    --     local player = GetPlayer()
    
    --     local newItems = {} 
    
    --     local function checkAndAddItems(entity)
    --         local success, items = transactionSystem:GetItemList(entity)
    --         if success and items then
    --             for _, item in ipairs(items) do
    --                 local recordID = item:GetID().id.value
    --                 Quickhacksui.inventoryCache[recordID] = true
    
    --                 if not Quickhacksui.oldInventoryCache[recordID] and Quickhacksui.knownQuickhackIDs[recordID] then
    --                     table.insert(newItems, recordID)
    --                 end
    --             end
    --         end
    --     end
    
    --     checkAndAddItems(player)
    --     local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
    --     checkAndAddItems(stash)
    
    --     if not Quickhacksui.initialized then
    --         Quickhacksui.initialized = true
    --         return
    --     end
    
    --     if #newItems > 0 then
    --         Quickhacksui.NotifyNewItems(newItems)
    --     end
    -- end 

    -- function Quickhacksui.NotifyNewItems(recordIDs)
    --     if ATT.enableNotifications then return end  
    --     local notified = {}
    --     local newlyDiscoveredNames = {}
    --         for _, recordID in ipairs(recordIDs) do
    --             local name = Quickhacksui.knownQuickhackIDs[recordID]
    --             if name then
    --                 newlyDiscoveredNames[name] = true
    --             end
    --         end

    --         for name, _ in pairs(newlyDiscoveredNames) do
    --             local found = false
    --             local group = groupedQuickhacks 
    --             for _, data in pairs(group) do
    --                 if data[name] then
    --                     for _, id in ipairs(data[name].recordIDs) do
    --                         if Quickhacksui.oldInventoryCache[id] then
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
  

    function Quickhacksui.CheckInStashAndInventory(recordID)
        return Quickhacksui.inventoryCache[recordID] or false
    end
-- 




    function Quickhacksui.displayWeaponGroup(name, group)
        local width, _ = ImGui.GetContentRegionAvail()  
    
        for weaponName, data in pairs(group or {}) do 
            local inInventory = false
            for _, recordID in ipairs(data.recordIDs) do
                if Quickhacksui.CheckInStashAndInventory(recordID) then
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
    
            if ImGui.Selectable(weaponName, Quickhacksui.selectedName == weaponName) then
                Quickhacksui.selectedName = weaponName
            end
    
            ImGui.PopStyleColor()
            ::continue::  

        end
   

    end
function Quickhacksui.CountOwnedWeapons(group)
        Quickhacksui.ownedCount = 0
        Quickhacksui.totalCount = 0
      
        for _, data in pairs(group or {}) do
            Quickhacksui.totalCount = Quickhacksui.totalCount + 1
            for _, recordID in ipairs(data.recordIDs) do
                if Quickhacksui.CheckInStashAndInventory(recordID) then

                    Quickhacksui.ownedCount = Quickhacksui.ownedCount + 1
                    break
                end
            end
        end
      
        return Quickhacksui.ownedCount, Quickhacksui.totalCount
end
function Quickhacksui.count()
    Quickhacksui.ownedcombat, Quickhacksui.totalcombat = Quickhacksui.CountOwnedWeapons(groupedQuickhacks.combat)
    
    Quickhacksui.ownedcontrol, Quickhacksui.totalcontrol = Quickhacksui.CountOwnedWeapons(groupedQuickhacks.control)
    
    Quickhacksui.ownedcovert, Quickhacksui.totalcovert = Quickhacksui.CountOwnedWeapons(groupedQuickhacks.covert)
    
    Quickhacksui.ownedultimate, Quickhacksui.totalultimate = Quickhacksui.CountOwnedWeapons(groupedQuickhacks.ultimate)
    
    Quickhacksui.ownedTotalcombat = Quickhacksui.ownedcombat or 0
    Quickhacksui.totalcombat = Quickhacksui.totalcombat or 0
    
    Quickhacksui.ownedTotalcontrol = Quickhacksui.ownedcontrol or 0
    Quickhacksui.totalcontrol = Quickhacksui.totalcontrol or 0
    
    Quickhacksui.ownedTotalcovert = Quickhacksui.ownedcovert or 0
    Quickhacksui.totalcovert = Quickhacksui.totalcovert or 0
    
    Quickhacksui.ownedTotalultimate = Quickhacksui.ownedultimate or 0
    Quickhacksui.totalultimate = Quickhacksui.totalultimate or 0

    Quickhacksui.ownedTotalQuickhacksui =  
    Quickhacksui.ownedTotalcombat +
    Quickhacksui.ownedTotalcontrol +
    Quickhacksui.ownedTotalcovert +
    Quickhacksui.ownedTotalultimate
    
    Quickhacksui.totalTotalQuickhacksui =
    Quickhacksui.totalcombat +
    Quickhacksui.totalcontrol +
    Quickhacksui.totalcovert +
    Quickhacksui.totalultimate 
    return Quickhacksui.ownedTotalQuickhacksui, Quickhacksui.totalTotalQuickhacksui
end
function Quickhacksui.uicyberwares()
    if ImGui.CollapsingHeader(string.format(T("ATT_QUICKHACKS") .."(%d/%d)",Quickhacksui.ownedTotalQuickhacksui or 0, Quickhacksui.totalTotalQuickhacksui or 0)) then
        ImGui.Indent(20)
        if ImGui.Button(string.format(T("ATT_COMBAT") .."(%d/%d)",Quickhacksui.ownedTotalcombat or 0, Quickhacksui.totalcombat or 0), -1, 0) then
                  setActive("Quickhacksui", "showcombat")
        end
        if ImGui.Button(string.format(T("ATT_CONTROL") .."(%d/%d)",Quickhacksui.ownedTotalcontrol or 0, Quickhacksui.totalcontrol or 0), -1, 0) then
                  setActive("Quickhacksui", "showcontrol")
        end
        if ImGui.Button(string.format(T("ATT_COVERT") .."(%d/%d)",Quickhacksui.ownedTotalcovert or 0, Quickhacksui.totalcovert or 0), -1, 0) then
                  setActive("Quickhacksui", "showcovert")
        end
        if ImGui.Button(string.format(T("ATT_ULTIMATE") .."(%d/%d)",Quickhacksui.ownedTotalultimate or 0, Quickhacksui.totalultimate or 0), -1, 0) then
                  setActive("Quickhacksui", "showultimate")
        end
        ImGui.Unindent(20)
      end
end

Quickhacksui.groupedQuickhacks = groupedQuickhacks

return Quickhacksui
