local Misc = {}
ATT.translations            = require("trad/Interface")
ATT.selectedLanguage        = "en"

local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
  end
local misc = require("data/miscs")
local groupedmisc = {
          CRAFTING_COMPONENTS = {},
          BUFF = {},
          ALCOHOL = {},
          DRINK = {},
          FOOD = {},
          Medication = {}
}
  -- Traitement des CRAFTING_COMPONENTS
  for _, CRAFTINGCOMPONENTS in ipairs(misc.CRAFTING_COMPONENTS) do
    local CRAFTINGCOMPONENTSData = {
      recordID = CRAFTINGCOMPONENTS[1],
      name = CRAFTINGCOMPONENTS[2],
      acquisitionID = CRAFTINGCOMPONENTS[3]
     }
    
    if not groupedmisc.CRAFTING_COMPONENTS[CRAFTINGCOMPONENTSData.name] then
        groupedmisc.CRAFTING_COMPONENTS[CRAFTINGCOMPONENTSData.name] = { 
          recordIDs = {}, 
          -- acquisitionen = acquisitionData.en,
          -- acquisitiontrad = acquisitionData.trad 
          }
    end
    table.insert(groupedmisc.CRAFTING_COMPONENTS[CRAFTINGCOMPONENTSData.name].recordIDs, CRAFTINGCOMPONENTSData.recordID)
  end

  -- Traitement des BUFF
  for _, BUFF in ipairs(misc.BUFF) do
    local BUFFData = {
      recordID = BUFF[1],
      name = BUFF[2],
      acquisitionID = BUFF[3]
     }
    
    if not groupedmisc.BUFF[BUFFData.name] then
        groupedmisc.BUFF[BUFFData.name] = { 
          recordIDs = {}, 
          -- acquisitionen = acquisitionData.en,
          -- acquisitiontrad = acquisitionData.trad 
          }
    end
    table.insert(groupedmisc.BUFF[BUFFData.name].recordIDs, BUFFData.recordID)
  end

  -- Traitement des ALCOHOL
  for _, ALCOHOL in ipairs(misc.ALCOHOL) do
    local ALCOHOLData = {
      recordID = ALCOHOL[1],
      name = ALCOHOL[2],
      acquisitionID = ALCOHOL[3]
     }
    
    if not groupedmisc.ALCOHOL[ALCOHOLData.name] then
        groupedmisc.ALCOHOL[ALCOHOLData.name] = { 
          recordIDs = {}, 
          -- acquisitionen = acquisitionData.en,
          -- acquisitiontrad = acquisitionData.trad 
          }
    end
    table.insert(groupedmisc.ALCOHOL[ALCOHOLData.name].recordIDs, ALCOHOLData.recordID)
  end

  -- Traitement des DRINK
  for _, DRINK in ipairs(misc.DRINK) do
    local DRINKData = {
      recordID = DRINK[1],
      name = DRINK[2],
      acquisitionID = DRINK[3]
     }
    
    if not groupedmisc.DRINK[DRINKData.name] then
        groupedmisc.DRINK[DRINKData.name] = { 
          recordIDs = {}, 
          -- acquisitionen = acquisitionData.en,
          -- acquisitiontrad = acquisitionData.trad 
          }
    end
    table.insert(groupedmisc.DRINK[DRINKData.name].recordIDs, DRINKData.recordID)
  end

  -- Traitement des FOOD
  for _, FOOD in ipairs(misc.FOOD) do
    local FOODData = {
      recordID = FOOD[1],
      name = FOOD[2],
      acquisitionID = FOOD[3]
     }
    
    if not groupedmisc.FOOD[FOODData.name] then
        groupedmisc.FOOD[FOODData.name] = { 
          recordIDs = {}, 
          -- acquisitionen = acquisitionData.en,
          -- acquisitiontrad = acquisitionData.trad 
          }
    end
    table.insert(groupedmisc.FOOD[FOODData.name].recordIDs, FOODData.recordID)
  end

  -- Traitement des MEDS
  for _, MED in ipairs(misc.Medication) do
    local MEDData = {
      recordID = MED[1],
      name = MED[2],
      acquisitionID = MED[3]
     }
    
    if not groupedmisc.Medication[MEDData.name] then
        groupedmisc.Medication[MEDData.name] = { 
          recordIDs = {}, 
          -- acquisitionen = acquisitionData.en,
          -- acquisitiontrad = acquisitionData.trad 
          }
    end
    table.insert(groupedmisc.Medication[MEDData.name].recordIDs, MEDData.recordID)
  end
    Misc.inventoryCache = {}

function Misc.UpdateInventoryCache()
    Misc.inventoryCache = {}
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
            Misc.inventoryCache[itemRecordID] = true
        end
    end

    -- 🔍 Vérifie les items du coffre
    local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
    if stash then
        local stashSuccess, stashItems = transactionSystem:GetItemList(stash)
        if stashSuccess and stashItems then
            for _, item in ipairs(stashItems) do
                local itemRecordID = item:GetID().id.value
                Misc.inventoryCache[itemRecordID] = true
            end
        end
    end
end
function Misc.CheckInStashAndInventory(recordID)
    return Misc.inventoryCache[recordID] or false
end
function Misc.displayWeaponGroup(name, group)
    local width, _ = ImGui.GetContentRegionAvail()  -- ✅ Correction du `width`
    -- ImGui.BeginChild(name .. " list", width - 5, 400, true, ImGuiWindowFlags.NoMove)

    for weaponName, data in pairs(group or {}) do  -- ✅ Vérification `group`
        local inInventory = false
        for _, recordID in ipairs(data.recordIDs) do
            if Misc.CheckInStashAndInventory(recordID) then
                inInventory = true
                break
            end
        end
        -- 🔥 Masquer les armes possédées si l'option est activée
        if ATT.hideOwnedItems and inInventory then
          goto continue  -- ⏭️ Sauter cette itération de la boucle
        end
        if ATT.hideOwnedItems and not inInventory then
          goto continue  -- ⏭️ Sauter cette itération de la boucle
        end

        if inInventory then
            ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.0, 1.0)  -- ✅ Vert si possédé
        else
            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.0, 0.0, 1.0)  -- ❌ Rouge si non possédé
        end

        if ImGui.Selectable(weaponName, Misc.selectedName == weaponName) then
            Misc.selectedName = weaponName
        end

        ImGui.PopStyleColor()
        ::continue::  -- ⏭️ Continuer avec le prochain élément
    end

    -- ImGui.EndChild()  -- ✅ Suppression du `end` mal placé
end
--   Misc.knownMiscIDs = {}

--   function Misc.BuildQuickhackIndex()
--       for _, MiscGroup in pairs(groupedmisc) do
--           for name, data in pairs(MiscGroup) do
--               for _, recordID in ipairs(data.recordIDs or {}) do
--                   Misc.knownMiscIDs[recordID] = name
--               end
--           end
--       end
--   end
-- Misc.BuildQuickhackIndex()

-- Fonction pour compter les items possédés
function Misc.CountOwnedWeapons(group)
        Misc.ownedCount = 0
        Misc.totalCount = 0
      
        for _, data in pairs(group or {}) do
            Misc.totalCount = Misc.totalCount + 1
            for _, recordID in ipairs(data.recordIDs) do
                if Misc.CheckInStashAndInventory(recordID) then
                    Misc.ownedCount = Misc.ownedCount + 1
                    break
                end
            end
        end
      
        return Misc.ownedCount, Misc.totalCount
end

function Misc.count()
    Misc.ownedcrafting, Misc.totalcrafting = Misc.CountOwnedWeapons(groupedmisc.CRAFTING_COMPONENTS)
    Misc.ownedbuff, Misc.totalbuff = Misc.CountOwnedWeapons(groupedmisc.BUFF)
    Misc.ownedmeds, Misc.totalmeds = Misc.CountOwnedWeapons(groupedmisc.Medication)
    Misc.ownedalcohol, Misc.totalalcohol = Misc.CountOwnedWeapons(groupedmisc.ALCOHOL)
    Misc.owneddrink, Misc.totaldrink = Misc.CountOwnedWeapons(groupedmisc.DRINK)
    Misc.ownedfood, Misc.totalfood = Misc.CountOwnedWeapons(groupedmisc.FOOD)
    
    Misc.ownedTotalcrafting = Misc.ownedcrafting or 0
    Misc.totalcrafting = Misc.totalcrafting or 0
    
    Misc.ownedTotalbuff = Misc.ownedbuff or 0
    Misc.totalbuff = Misc.totalbuff or 0
    
    Misc.ownedTotalmeds = Misc.ownedmeds or 0
    Misc.totalmeds = Misc.totalmeds or 0
    
    Misc.ownedTotalalcohol = Misc.ownedalcohol or 0
    Misc.totalalcohol = Misc.totalalcohol or 0
    
    Misc.ownedTotaldrink = Misc.owneddrink or 0
    Misc.totaldrink = Misc.totaldrink or 0
    
    Misc.ownedTotalfood = Misc.ownedfood or 0
    Misc.totalfood = Misc.totalfood or 0

    Misc.ownedTotalMisc =  
    Misc.ownedTotalcrafting +
    Misc.ownedTotalbuff +
    Misc.ownedTotalmeds +
    Misc.ownedTotalalcohol +
    Misc.ownedTotaldrink +
    Misc.ownedTotalfood
    
    Misc.totalTotalMisc =
    Misc.totalcrafting +
    Misc.totalbuff +
    Misc.totalmeds +
    Misc.totalalcohol +
    Misc.totaldrink +
    Misc.totalfood
    
    return Misc.ownedTotalMisc, Misc.totalTotalMisc
end


function Misc.ui()
  if ImGui.CollapsingHeader(string.format(T("ATT_MISC") .. "(%d/%d)", Misc.ownedTotalMisc or 0, Misc.totalTotalMisc or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_CRAFTING_COMPONENTS") .. "(%d/%d)", Misc.ownedTotalcrafting or 0, Misc.totalcrafting or 0), -1, 0) then
          setActive("Misc", "showcrafting")
      end
    --   if ImGui.Button(string.format(T("ATT_BUFF") .. "(%d/%d)", Misc.ownedTotalbuff or 0, Misc.totalbuff or 0), -1, 0) then
    --       setActive("Misc", "showbuff")
    --   end
      if ImGui.Button(string.format(T("ATT_MEDICATION") .. "(%d/%d)", Misc.ownedTotalmeds or 0, Misc.totalmeds or 0), -1, 0) then
          setActive("Misc", "showmeds")
      end
      if ImGui.Button(string.format(T("ATT_ALCOHOL") .. "(%d/%d)", Misc.ownedTotalalcohol or 0, Misc.totalalcohol or 0), -1, 0) then
          setActive("Misc", "showalcohol")
      end
      if ImGui.Button(string.format(T("ATT_DRINK") .. "(%d/%d)", Misc.ownedTotaldrink or 0, Misc.totaldrink or 0), -1, 0) then
          setActive("Misc", "showdrink")
      end
      if ImGui.Button(string.format(T("ATT_FOOD") .. "(%d/%d)", Misc.ownedTotalfood or 0, Misc.totalfood or 0), -1, 0) then
          setActive("Misc", "showfood")
      end
      ImGui.Unindent(20)
  end
end
Misc.groupedmisc = groupedmisc

return Misc
