local Vehicules = {}
local showGeneralUI     = false
local showchangelogUI   = false
local showinformationUI = false
local hideOwnedItems = false  
local hideUnownedItems = false  
-- Vehicules.detailVehicle = nil

-- 🔹 Fonction utilitaire pour toujours renvoyer une table d’IDs
function Vehicules.getIds(vehicle)
    if type(vehicle.ids) == "table" then
        return vehicle.ids
    elseif type(vehicle.id) == "string" then
        return { vehicle.id }
    else
        return {}
    end
end

local _trad                 = require("trad/translations")
local vehicleTranslations   = _trad.vehicle_descriptions

ATT.translations            = _trad.interface
ATT.selectedLanguage        = "en"

local function T(key) return ATT.T(key) end
local searchQuery = ""
local vehicles = require("data/vehicles")
local ownedVehicles = {}
Vehicules.vehicles = vehicles

local selectedVehicle = nil
function Vehicules.updateVehicleOwnership()
    Vehicules.ownedVehicles = {}
    local vehicleSystem = Game.GetVehicleSystem()

    if vehicleSystem then
        for _, category in pairs(Vehicules.vehicles) do
            for _, vehicle in ipairs(category) do
                for _, id in ipairs(Vehicules.getIds(vehicle)) do
                    local recordID = TweakDBID.new(id)
                    if vehicleSystem:IsVehiclePlayerUnlocked(recordID) then
                        Vehicules.ownedVehicles[id] = true
                    end
                end
            end
        end
    end
end

-- function Vehicules.updateVehicleOwnership()
--     Vehicules.ownedVehicles = {}
--     local vehicleSystem = Game.GetVehicleSystem()

--     if vehicleSystem then
--         for _, vehicle in ipairs(Vehicules.vehicles["Voitures"]) do
--             local recordID = TweakDBID.new(vehicle.id)
--             if vehicleSystem:IsVehiclePlayerUnlocked(recordID) then
--                 Vehicules.ownedVehicles[vehicle.id] = true
--             end
--         end
--         for _, vehicle in ipairs(Vehicules.vehicles["Voituresliberty"]) do
--             local recordID = TweakDBID.new(vehicle.id)
--             if vehicleSystem:IsVehiclePlayerUnlocked(recordID) then
--                 Vehicules.ownedVehicles[vehicle.id] = true
--             end
--         end
--         for _, vehicle in ipairs(Vehicules.vehicles["Voituresnomad"]) do
--             local recordID = TweakDBID.new(vehicle.id)
--             if vehicleSystem:IsVehiclePlayerUnlocked(recordID) then
--                 Vehicules.ownedVehicles[vehicle.id] = true
--             end
--         end
--         for _, vehicle in ipairs(Vehicules.vehicles["Motos"]) do
--             local recordID = TweakDBID.new(vehicle.id)
--             if vehicleSystem:IsVehiclePlayerUnlocked(recordID) then
--                 Vehicules.ownedVehicles[vehicle.id] = true
--             end
--         end
--         for _, vehicle in ipairs(Vehicules.vehicles["Motosliberty"]) do
--             local recordID = TweakDBID.new(vehicle.id)
--             if vehicleSystem:IsVehiclePlayerUnlocked(recordID) then
--                 Vehicules.ownedVehicles[vehicle.id] = true
--             end
--         end
--         for _, vehicle in ipairs(Vehicules.vehicles["Motosnomad"]) do
--             local recordID = TweakDBID.new(vehicle.id)
--             if vehicleSystem:IsVehiclePlayerUnlocked(recordID) then
--                 Vehicules.ownedVehicles[vehicle.id] = true
--             end
--         end
--         -- idem pour Voituresnomad, Motosnomad, Voituresliberty, etc.
--     end
-- end


-- function Vehicules.updateVehicleOwnership()
--     Vehicules.ownedVehicles = {}
--     local vehicleSystem = Game.GetVehicleSystem()

--     if vehicleSystem then
--         local unlockedVehicles = vehicleSystem:GetPlayerUnlockedVehicles()
--         for _, vehicle in ipairs(unlockedVehicles) do
--             Vehicules.ownedVehicles[vehicle.recordID.value] = true
--         end
--     end
-- end
function Vehicules.drawVehicleCategory(name, vehicleList)
    if not vehicleList then return end
    for _, vehicle in ipairs(vehicleList) do
        local owned = false
        for _, id in ipairs(Vehicules.getIds(vehicle)) do
            if Vehicules.ownedVehicles[id] then
                owned = true
                break
            end
        end

        if owned then
            ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.0, 1.0) -- Vert si possédé
        else
            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.0, 0.0, 1.0) -- Rouge si pas possédé
        end

        if ImGui.Selectable(vehicle.name, Vehicules.selectedVehicle == vehicle) then
            Vehicules.selectedVehicle = vehicle
        end

        ImGui.PopStyleColor()
    end
end

-- function Vehicules.drawVehicleCategory(name, vehicleList)
--     if not vehicleList then return end
--     for _, vehicle in ipairs(vehicleList) do
--         local isOwned = Vehicules.ownedVehicles[vehicle.id] or false
--         if isOwned then
--             ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.0, 1.0) 
--         else
--             ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.0, 0.0, 1.0) 
--         end

--         if ImGui.Selectable(vehicle.name, Vehicules.selectedVehicle == vehicle) then
--             Vehicules.selectedVehicle = vehicle
--         end

--         ImGui.PopStyleColor()
--     end
-- end
function Vehicules.drawFilteredVehicleCategory(categoryName, vehicleList)
    if not vehicleList then return end

    local totalOwned, totalVehicles = 0, #vehicleList
    local filteredVehicles = {}

    for _, vehicle in ipairs(vehicleList) do
        local owned = false
        for _, id in ipairs(Vehicules.getIds(vehicle)) do
            if Vehicules.ownedVehicles[id] then
                owned = true
                break
            end
        end

        if owned then
            totalOwned = totalOwned + 1
        end

        -- 🔥 Filtrage Hide Owned/Unowned
        if ATT.hideOwnedItems and owned then goto continue end
        if ATT.hideUnownedItems and not owned then goto continue end

        -- 🔎 Filtrage par recherche
        if searchQuery == "" or string.find(string.lower(vehicle.name), string.lower(searchQuery), 1, true) then
            table.insert(filteredVehicles, vehicle)
        end

        ::continue::
    end

    if #filteredVehicles > 0 then
        Vehicules.drawVehicleCategory(categoryName, filteredVehicles)
    end
end

-- function Vehicules.drawFilteredVehicleCategory(categoryName, vehicleList)
    
--     local totalOwned, totalVehicles = 0, #vehicles

--     for _, vehicle in ipairs(vehicleList) do
--         if Vehicules.ownedVehicles[vehicle.id] then
--             totalOwned = totalOwned + 1
--         end
--     end

--     local percentage = totalVehicles > 0 and (totalOwned / totalVehicles) * 100 or 0
--     local filteredVehicles = {}

--     for _, vehicle in ipairs(vehicleList) do
--         local isOwned = Vehicules.ownedVehicles[vehicle.id] or false

--         -- 🔥 Si l'option est activée et que le véhicule est possédé, on le cache
--         if ATT.hideOwnedItems and isOwned then
--             goto continue
--         end
--         if ATT.hideUnownedItems and not isOwned then
--             goto continue
--         end

--         if searchQuery == "" or string.find(string.lower(vehicle.name), string.lower(searchQuery), 1, true) then
--             table.insert(filteredVehicles, vehicle)
--         end

--         ::continue::
--     end

--     if #filteredVehicles > 0 then
--         Vehicules.drawVehicleCategory(categoryName, filteredVehicles)
--     end
-- end
-- 🔹 Nomad
function Vehicules.testnomad()
    Vehicules.ownedVoitures, Vehicules.totalVoitures = 0, #Vehicules.vehicles["Voituresnomad"]
    Vehicules.ownedMotos, Vehicules.totalMotos = 0, #Vehicules.vehicles["Motosnomad"]

    for _, vehicle in ipairs(Vehicules.vehicles["Voituresnomad"]) do
        for _, id in ipairs(Vehicules.getIds(vehicle)) do
            if Vehicules.ownedVehicles[id] then
                Vehicules.ownedVoitures = Vehicules.ownedVoitures + 1
                break -- ✅ compte une seule fois le véhicule même s'il a plusieurs IDs
            end
        end
    end

    for _, vehicle in ipairs(Vehicules.vehicles["Motosnomad"]) do
        for _, id in ipairs(Vehicules.getIds(vehicle)) do
            if Vehicules.ownedVehicles[id] then
                Vehicules.ownedMotos = Vehicules.ownedMotos + 1
                break
            end
        end
    end

    Vehicules.ownedVehiclesTotal = Vehicules.ownedVoitures + Vehicules.ownedMotos
    Vehicules.totalVehiclesTotal = Vehicules.totalVoitures + Vehicules.totalMotos
    return Vehicules.ownedVehiclesTotal, Vehicules.totalVehiclesTotal
end


-- 🔹 Streetkid / Corpo
function Vehicules.teststreetcorpo()
    Vehicules.ownedVoituresstreetcorpo, Vehicules.totalVoituresstreetcorpo = 0, #Vehicules.vehicles["Voitures"]
    Vehicules.ownedMotosstreetcorpo, Vehicules.totalMotosstreetcorpo = 0, #Vehicules.vehicles["Motos"]

    for _, vehicle in ipairs(Vehicules.vehicles["Voitures"]) do
        for _, id in ipairs(Vehicules.getIds(vehicle)) do
            if Vehicules.ownedVehicles[id] then
                Vehicules.ownedVoituresstreetcorpo = Vehicules.ownedVoituresstreetcorpo + 1
                break
            end
        end
    end

    for _, vehicle in ipairs(Vehicules.vehicles["Motos"]) do
        for _, id in ipairs(Vehicules.getIds(vehicle)) do
            if Vehicules.ownedVehicles[id] then
                Vehicules.ownedMotosstreetcorpo = Vehicules.ownedMotosstreetcorpo + 1
                break
            end
        end
    end

    Vehicules.ownedVehiclesTotalstreetcorpo = Vehicules.ownedVoituresstreetcorpo + Vehicules.ownedMotosstreetcorpo
    Vehicules.totalVehiclesTotalstreetcorpo = Vehicules.totalVoituresstreetcorpo + Vehicules.totalMotosstreetcorpo
    return Vehicules.ownedVehiclesTotalstreetcorpo, Vehicules.totalVehiclesTotalstreetcorpo
end


-- 🔹 Liberty
function Vehicules.testliberty()
    Vehicules.ownedVoituresliberty, Vehicules.totalVoituresliberty = 0, #Vehicules.vehicles["Voituresliberty"]
    Vehicules.ownedMotosliberty, Vehicules.totalMotosliberty = 0, #Vehicules.vehicles["Motosliberty"]

    for _, vehicle in ipairs(Vehicules.vehicles["Voituresliberty"]) do
        for _, id in ipairs(Vehicules.getIds(vehicle)) do
            if Vehicules.ownedVehicles[id] then
                Vehicules.ownedVoituresliberty = Vehicules.ownedVoituresliberty + 1
                break
            end
        end
    end

    for _, vehicle in ipairs(Vehicules.vehicles["Motosliberty"]) do
        for _, id in ipairs(Vehicules.getIds(vehicle)) do
            if Vehicules.ownedVehicles[id] then
                Vehicules.ownedMotosliberty = Vehicules.ownedMotosliberty + 1
                break
            end
        end
    end

    Vehicules.ownedVehiclesTotalliberty = Vehicules.ownedVoituresliberty + Vehicules.ownedMotosliberty
    Vehicules.totalVehiclesTotalliberty = Vehicules.totalVoituresliberty + Vehicules.totalMotosliberty
    return Vehicules.ownedVehiclesTotalliberty, Vehicules.totalVehiclesTotalliberty
end
-- function Vehicules.testnomad()
--         Vehicules.ownedVoitures, Vehicules.totalVoitures = 0, #Vehicules.vehicles["Voituresnomad"]
--         Vehicules.ownedMotos, Vehicules.totalMotos = 0, #Vehicules.vehicles["Motosnomad"]

--         for _, vehicle in ipairs(Vehicules.vehicles["Voituresnomad"]) do
--             if Vehicules.ownedVehicles[vehicle.id] then
--                 Vehicules.ownedVoitures = Vehicules.ownedVoitures + 1
--             end
--         end

--         for _, vehicle in ipairs(Vehicules.vehicles["Motosnomad"]) do
--             if Vehicules.ownedVehicles[vehicle.id] then
--                 Vehicules.ownedMotos = Vehicules.ownedMotos + 1
--             end
--         end

--         Vehicules.ownedVehiclesTotal = Vehicules.ownedVoitures + Vehicules.ownedMotos
--         Vehicules.totalVehiclesTotal = Vehicules.totalVoitures + Vehicules.totalMotos
--         return Vehicules.ownedVehiclesTotal, Vehicules.totalVehiclesTotal
-- end
-- function Vehicules.teststreetcorpo()
--         Vehicules.ownedVoituresstreetcorpo, Vehicules.totalVoituresstreetcorpo = 0, #Vehicules.vehicles["Voitures"]
--         Vehicules.ownedMotosstreetcorpo, Vehicules.totalMotosstreetcorpo = 0, #Vehicules.vehicles["Motos"]

--         for _, vehicle in ipairs(Vehicules.vehicles["Voitures"]) do
--             if Vehicules.ownedVehicles[vehicle.id] then
--                 Vehicules.ownedVoituresstreetcorpo = Vehicules.ownedVoituresstreetcorpo + 1
--             end
--         end

--         for _, vehicle in ipairs(Vehicules.vehicles["Motos"]) do
--             if Vehicules.ownedVehicles[vehicle.id] then
--                 Vehicules.ownedMotosstreetcorpo = Vehicules.ownedMotosstreetcorpo + 1
--             end
--         end

--         Vehicules.ownedVehiclesTotalstreetcorpo = Vehicules.ownedVoituresstreetcorpo + Vehicules.ownedMotosstreetcorpo
--         Vehicules.totalVehiclesTotalstreetcorpo = Vehicules.totalVoituresstreetcorpo + Vehicules.totalMotosstreetcorpo
--         return Vehicules.ownedVehiclesTotalstreetcorpo, Vehicules.totalVehiclesTotalstreetcorpo
-- end
-- function Vehicules.testliberty()
--         Vehicules.ownedVoituresliberty, Vehicules.totalVoituresliberty = 0, #Vehicules.vehicles["Voituresliberty"]
--         Vehicules.ownedMotosliberty, Vehicules.totalMotosliberty = 0, #Vehicules.vehicles["Motosliberty"]

--         for _, vehicle in ipairs(Vehicules.vehicles["Voituresliberty"]) do
--             if Vehicules.ownedVehicles[vehicle.id] then
--                 Vehicules.ownedVoituresliberty = Vehicules.ownedVoituresliberty + 1
--             end
--         end

--         for _, vehicle in ipairs(Vehicules.vehicles["Motosliberty"]) do
--             if Vehicules.ownedVehicles[vehicle.id] then
--                 Vehicules.ownedMotosliberty = Vehicules.ownedMotosliberty + 1
--             end
--         end

--         Vehicules.ownedVehiclesTotalliberty = Vehicules.ownedVoituresliberty + Vehicules.ownedMotosliberty
--         Vehicules.totalVehiclesTotalliberty = Vehicules.totalVoituresliberty + Vehicules.totalMotosliberty
--         return Vehicules.ownedVehiclesTotalliberty, Vehicules.totalVehiclesTotalliberty
-- end



local function drawVehicleUI(ownedTotal, totalTotal, ownedCars, totalCars, ownedMotos, totalMotos)
    if ImGui.CollapsingHeader(string.format(T("ATT_VEHICLES") .. " (%d/%d)", ownedTotal or 0, totalTotal or 0)) then
        ImGui.Indent(20)
        if ImGui.Button(string.format(T("ATT_CARS") .. "(%d/%d)", ownedCars or 0, totalCars or 0), -1, 0) then
            setActive("Vehicules", "showcar")
            setCategory(Vehicules, T("ATT_CARS"))
        end
        if ImGui.Button(string.format(T("ATT_MOTO") .. "(%d/%d)", ownedMotos or 0, totalMotos or 0), -1, 0) then
            setActive("Vehicules", "showmoto")
            setCategory(Vehicules, T("ATT_MOTO"))
        end
        ImGui.Unindent(20)
    end
end

function Vehicules.uinomad()
    drawVehicleUI(Vehicules.ownedVehiclesTotal, Vehicules.totalVehiclesTotal, Vehicules.ownedVoitures, Vehicules.totalVoitures, Vehicules.ownedMotos, Vehicules.totalMotos)
end

function Vehicules.uistreetcorpo()
    drawVehicleUI(Vehicules.ownedVehiclesTotalstreetcorpo, Vehicules.totalVehiclesTotalstreetcorpo, Vehicules.ownedVoituresstreetcorpo, Vehicules.totalVoituresstreetcorpo, Vehicules.ownedMotosstreetcorpo, Vehicules.totalMotosstreetcorpo)
end

function Vehicules.uiliberty()
    drawVehicleUI(Vehicules.ownedVehiclesTotalliberty, Vehicules.totalVehiclesTotalliberty, Vehicules.ownedVoituresliberty, Vehicules.totalVoituresliberty, Vehicules.ownedMotosliberty, Vehicules.totalMotosliberty)
end

Vehicules.selectedVehicle = selectedVehicle
Vehicules.ownedVehicles = ownedVehicles
Vehicules.searchQuery = searchQuery
Vehicules.vehicleTranslations = vehicleTranslations
-- Vehicules.vehicles = vehicles
Vehicules.ownedVehicles = {}
Vehicules.hideOwnedItems = hideOwnedItems
Vehicules.hideUnownedItems = hideUnownedItems


return Vehicules
