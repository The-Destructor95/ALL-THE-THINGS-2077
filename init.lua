                                                 -----------------------------------------------------
                                                 --              ALL THE THINGS 2077                --
                                                 -----------------------------------------------------
                                                 -- thanks fop the author of IconicWeaponsChecklist --
                                                 --                   yakuzadeso                    --
                                                 --        for allowing me to reuse his code        --
                                                 -----------------------------------------------------
                                                 --  To translate the mod, please do so in the      --
                                                 -- "trad" folder and only modify the text where it -- 
                                                 -- is marked “trad”. the english version is there  --
                                                 --           to help with the translation.         --
                                                 -----------------------------------------------------

ATT = {
  description = "",
}
showEnglish      = true
-----------------------------------------------------------
-- Chargement des modules
-----------------------------------------------------------
ATT.Profil                          = require("profil/profil")
ATT.nomad                           = require("profil/nomad")
ATT.ATT1                            = require("profil/att1")
ATT.ATT2                            = require("profil/att2")
ATT.general                         = require("settings/general")
ATT.changelog                       = require("settings/changelog")
ATT.information                     = require("settings/information")
ATT.Vehicules                       = require("system/vehicules")
ATT.Cyberwaresui                    = require("system/cyberwaresui")
ATT.Quickhacksui                    = require("system/quickhacks")
ATT.Modsui                          = require("system/modui")
ATT.Weaponsui                       = require("system/weaponsui")
ATT.Clothesui                       = require("system/clothesui")
ATT.Misc                            = require("system/misc")
ATT.translations                    = require("trad/Interface")
ATT.selectedLanguage                = "en"
ATT.currentProfile                  = "menu"            
ATT.selectedGame                    = "Cyberpunk 2077"  
local searchQuery = ""
-----------------------------------------------------------
-- Initialisation des paramètres par défaut
-----------------------------------------------------------
ATT.hideOwnedItems                  = false
ATT.hideUnownedItems                = false
isOverlayOpen                       = false
-----------------------------------------------------------
-- Fonctions utilitaires
local categories = {
  Clothesui = {
      "showHeads_northhside", "showFaces_northhside", "showFeets_northhside", "showInnerTorsos_northhside",
      "showLegss_northhside", "showOuterTorsos_northhside", 
      "showHeads_kabuki", "showFaces_kabuki",
      "showFeets_kabuki", "showInnerTorsos_kabuki", "showLegss_kabuki", "showOuterTorsos_kabuki",
      "showHeads_little_china","showFaces_little_china","showFeets_little_china","showInnerTorsos_little_china","showLegss_little_china","showOuterTorsos_little_china",
      "showHeads_Japantown","showFaces_Japantown","showFeets_Japantown","showInnerTorsos_Japantown","showLegss_Japantown","showOuterTorsos_Japantown",
      "showHeads_Karim_Noel","showFaces_Karim_Noel","showFeets_Karim_Noel","showInnerTorsos_Karim_Noel",
      "showLegss_Karim_Noel","showOuterTorsos_Karim_Noel",
      "showHeads_Charter_Hill","showFaces_Charter_Hill","showFeets_Charter_Hill","showInnerTorsos_Charter_Hill","showLegss_Charter_Hill","showOuterTorsos_Charter_Hill",
      "showHeads_Zane_Jagger","showFaces_Zane_Jagger","showFeets_Zane_Jagger","showInnerTorsos_Zane_Jagger",
      "showLegss_Zane_Jagger","showOuterTorsos_Zane_Jagger",
      "showHeads_corpo_plaza","showFaces_corpo_plaza","showFeets_corpo_plaza","showInnerTorsos_corpo_plaza","showLegss_corpo_plaza","showOuterTorsos_corpo_plaza",
      "showHeads_Wellsprings","showFaces_Wellsprings","showFeets_Wellsprings","showInnerTorsos_Wellsprings",
      "showLegss_Wellsprings","showOuterTorsos_Wellsprings",
      "showHeads_arroyo","showFaces_arroyo","showFeets_arroyo","showInnerTorsos_arroyo","showLegss_arroyo","showOuterTorsos_arroyo",
      "showHeads_rancho_coronado","showFeets_rancho_coronado","showInnerTorsos_rancho_coronado","showLegss_rancho_coronado","showOuterTorsos_rancho_coronado",
      "showHeads_west_wind_estate","showFaces_west_wind_estate","showFeets_west_wind_estate","showInnerTorsos_west_wind_estate","showLegss_west_wind_estate","showOuterTorsos_west_wind_estate",
      "showHeads_david_walker","showFaces_david_walker","showFeets_david_walker","showInnerTorsos_david_walker","showLegss_david_walker","showOuterTorsos_david_walker",
      "showHeads_satoshi_ueno","showFaces_satoshi_ueno","showFeets_satoshi_ueno","showInnerTorsos_satoshi_ueno","showLegss_satoshi_ueno","showOuterTorsos_satoshi_ueno",
      "showHeads_red_peaks","showFaces_red_peaks","showFeets_red_peaks","showInnerTorsos_red_peaks","showLegss_red_peaks","showOuterTorsos_red_peaks",
      "showHaeds_other","showJohnny_Silverhand_set","showV_corpo_set","showV_nomad_set","showV_streetkid_set",
      "showV_The_Rescue_set","showYorinubo_set","showMaxTac_set","showNUS_Agent_set","showThe_Star_set","showThe_sun_set",
      "showTemperance_set","showCop_set","showCorporate_set","showFixer_set","showMedia_set","showNetrunner_set","showNomad_set",
      "showRocker_set","showSolo_set","showTechie_set"
  },
  Vehicules = { "showcar", "showmoto" },
  Weaponsui = {
      "showhandguns", "showrevolvers", "showassault_rifles", "showSniperRifles", "showPrecisionRifles",
      "showShotguns", "showSmgs", "showHmgs", "showGrenades","showAxes","showChainswords","showKatanas",
      "showKnives","showMachetes","showSwords","showHammers","showOneHandedClubs","showTwoHandedClubs"
  },
  Modsui = {
    "showARSMGLMGMOD","showBLADEMOD","showBLUNTWEAPONMOD","showMELEEWEAPONMOD","showMUZZLEASSAULTRIFLESMG","showMUZZLEHANDGUN","showPISTOLREVOLVERMOD",
    "showPOWERWEAPONMOD","showSCOPEGENERICLONG","showSCOPEGENERICSHORT","showSCOPETECHSNIPER","showSHOTGUNMOD","showSILENCER","showSMARTWEAPONMOD","showSNIPERPRECRIFLEMOD",
    "showTECHWEAPONMOD","showTHROWABLEWEAPONMOD","showWEAPONMOD"  
  },
  Cyberwaresui = {
      "showArms", "showcirculatorySystems", "showFacesCY", "showFrontalCortexs", "showHandsCY",
      "showIntegumentarSystems","showLegsCY","showNervousSystems","showOperatingSystems","showSkeletons"
  },
  Quickhacksui = { "showcombat", "showcontrol", "showcovert", "showultimate" },
  Misc = { "showcrafting", "showmeds", "showalcohol", "showdrink","showfood","showbuff" },
  general = { "showGeneralUI"},
  information = { "showinformationUI"},
  changelog = { "showchangelogUI"},
}
-----------------------------------------------------------
-- Fonction pour tout désactiver sauf une variable spécifique
-----------------------------------------------------------
function setActive(category, activeKey)
  -- Désactiver toutes les variables dans toutes les catégories
  for cat, keys in pairs(categories) do
      for _, key in ipairs(keys) do
          ATT[cat][key] = false
      end
  end
  -- Activer uniquement la clé sélectionnée si la catégorie existe
  if categories[category] then
      ATT[category][activeKey] = true
  else
      print("Erreur : La catégorie '" .. category .. "' n'existe pas.")
  end
end 
-----------------------------------------------------------
--traduction des informations des items 
-----------------------------------------------------------
local function T(key)
  return ATT.translations[ATT.selectedLanguage][key] or key
end

local function loadTranslations()
  local file = io.open("trad/Description.json", "r")
  if not file then return {} end
  
  local content = file:read("*a")
  file:close()
  
  local translationstests, _, err = json.decode(content)
  if err then
      print("Erreur de décodage JSON :", err)
      return {}
  end
  
  return translationstests
end
local translationstests = loadTranslations()
-----------------------------------------------------------
--Sauevegarde des paramètres dans "settings.json"
-----------------------------------------------------------
function ATT.SaveSettings()
  local settings = {
      showEnglish = showEnglish ,
      selectedLanguage = ATT.selectedLanguage,
      currentProfile = ATT.currentProfile ,
      hideOwnedItems = ATT.hideOwnedItems ,
      hideUnownedItems = ATT.hideUnownedItems,
  }

  local jsonString = json.encode(settings)
  local file = io.open("settings.json", "w")
  if file then
      file:write(jsonString)
      file:close()
  end
end
function ATT.LoadSettings()
  local file = io.open("settings.json", "r")
  if file then
      local jsonString = file:read("*a")
      file:close()

      local success, settings = pcall(json.decode, jsonString)
      if success and settings then
          showEnglish = settings.showEnglish
          ATT.selectedLanguage = settings.selectedLanguage 
          ATT.currentProfile = settings.currentProfile 
          ATT.hideOwnedItems = settings.hideOwnedItems 
          ATT.hideUnownedItems = settings.hideUnownedItems
      end
  end
end
ATT.LoadSettings()

registerForEvent("onOverlayOpen", function()
    isOverlayOpen = true
    ATT.Vehicules.updateVehicleOwnership()
    ATT.Weaponsui.UpdateInventoryCache()
    ATT.Quickhacksui.UpdateInventoryCache()
    ATT.Cyberwaresui.UpdateInventoryCache()
    ATT.Modsui.UpdateInventoryCache()
    ATT.Clothesui.UpdateInventoryCache()
    ATT.Misc.UpdateInventoryCache()
end)

registerForEvent("onOverlayClose", function()
    isOverlayOpen = false
end)

registerForEvent("onDraw", function()

  if isOverlayOpen then 
    -- if ImGui.Begin(T("ATT_TiTLE")) then
    if ImGui.Begin("2.3 DEVMOD") then
        if ATT.currentProfile == "menu" then
          -- DrawThemeEditor()
          ATT.Profil.DrawMenu()
          ATT.SaveSettings()
        end
      
    ----------------------------------------------------------
    --menu principal du mod
    ----------------------------------------------------------
      if ImGui.BeginChild("Child Window 4", 0, 0, true) then
           ATT.DrawUIHeader() 
        local childWindow9Width, childWindow9Height = ImGui.GetContentRegionAvail()
        if ImGui.BeginChild("Child Window 9", 0.3 * childWindow9Width, 0, true) then
          ImGui.Spacing()
          ImGui.Text("categories")
          ImGui.Spacing()
          ImGui.Separator()
          if ATT.currentProfile == "nomad" then
            if ATT.selectedGame == "Cyberpunk 2077" then
                ATT.DrawUIVehiculesCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUIWeaponsCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUIClothesCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUICyberwaresCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUIQuickhacksCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUIModCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUIMiscCyberpunk2077()
            end
            if ATT.selectedGame == "Phantom Liberty" then
                ATT.DrawUIVehiculesPhantomLiberty()
              ImGui.Spacing()
                ATT.DrawUIWeaponsPhantomLiberty()
              ImGui.Spacing()
                ATT.DrawUICyberwaresPhantomLiberty()
              ImGui.Spacing()
                ATT.DrawUIModPhantomLiberty()
            end
          end
          if ATT.currentProfile == "att1" or ATT.currentProfile == "att2" then
            if ATT.selectedGame == "Cyberpunk 2077" then
                ATT.DrawUIVehiculesCyberpunk2077streetcorpo()
              ImGui.Spacing()
                ATT.DrawUIWeaponsCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUIClothesCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUICyberwaresCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUIQuickhacksCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUIModCyberpunk2077()
              ImGui.Spacing()
                ATT.DrawUIMiscCyberpunk2077()
            end
            if ATT.selectedGame == "Phantom Liberty" then
                ATT.DrawUIVehiculesPhantomLiberty()
              ImGui.Spacing()
                ATT.DrawUIWeaponsPhantomLiberty()
              ImGui.Spacing()
                ATT.DrawUICyberwaresPhantomLiberty()
              ImGui.Spacing()
                ATT.DrawUIModPhantomLiberty()
            end
          end
            ImGui.Spacing()
            ImGui.Separator()
            ImGui.Spacing()
            ATT.DrawUISettings()
        ImGui.EndChild()
        ImGui.SameLine()
        if not ATT.general.showGeneralUI  and not ATT.changelog.showchangelogUI and not ATT.information.showinformationUI then 
          local childWindow10Width, childWindow10Height = ImGui.GetContentRegionAvail()
          if ImGui.BeginChild("Child Window 10", 1 * childWindow10Width, 0, false) then
            ImGui.Spacing()
            if ATT.currentProfile == "nomad" then
              ATT.Vehicules.ownedVehiclesTotal,               ATT.Vehicules.totalVehiclesTotal                = ATT.Vehicules.testnomad()
              ATT.Clothesui.ownedTotalClothesui,              ATT.Clothesui.totalTotalClothesui               = ATT.Clothesui.count()
              -- ATT.Clothesui.ownedTotalNomad,                  ATT.Clothesui.totalNomad                        = ATT.Clothesui.countnomad()
              ATT.Vehicules.ownedVehiclesTotalliberty,        ATT.Vehicules.totalVehiclesTotalliberty         = ATT.Vehicules.testliberty()
              ATT.Weaponsui.ownedTotalWeapons,                ATT.Weaponsui.totalTotalWeapons                 = ATT.Weaponsui.count()
              ATT.Weaponsui.ownedTotalWeaponsliberty,         ATT.Weaponsui.totalTotalWeaponsliberty          = ATT.Weaponsui.countliberty()
              ATT.Cyberwaresui.ownedTotalCyberwares,          ATT.Cyberwaresui.totalTotalCyberwares           = ATT.Cyberwaresui.count()
              ATT.Cyberwaresui.ownedTotalCyberwaresliberty,   ATT.Cyberwaresui.totalTotalCyberwaresliberty    = ATT.Cyberwaresui.countcyberwaresliberty()
              ATT.Quickhacksui.ownedTotalQuickhacksui,        ATT.Quickhacksui.totalTotalQuickhacksui         = ATT.Quickhacksui.count()
              ATT.Modsui.ownedTotalModsui,                    ATT.Modsui.totalTotalModsui                     = ATT.Modsui.count()
              ATT.Modsui.ownedTotalModsuiliberty,             ATT.Modsui.totalTotalModsuiliberty              = ATT.Modsui.countmodliberty()
          elseif ATT.currentProfile == "att1"then
              ATT.Vehicules.ownedVehiclesTotalstreetcorpo,    ATT.Vehicules.totalVehiclesTotalstreetcorpo     = ATT.Vehicules.teststreetcorpo()
              ATT.Clothesui.ownedTotalClothesui,              ATT.Clothesui.totalTotalClothesui               = ATT.Clothesui.count()
              -- ATT.Clothesui.ownedTotalStreetkid,              ATT.Clothesui.totalStreetkid                    = ATT.Clothesui.countstreetkid()
              ATT.Vehicules.ownedVehiclesTotalliberty,        ATT.Vehicules.totalVehiclesTotalliberty         = ATT.Vehicules.testliberty()
              ATT.Weaponsui.ownedTotalWeapons,                ATT.Weaponsui.totalTotalWeapons                 = ATT.Weaponsui.count()
              ATT.Weaponsui.ownedTotalWeaponsliberty,         ATT.Weaponsui.totalTotalWeaponsliberty          = ATT.Weaponsui.countliberty()
              ATT.Cyberwaresui.ownedTotalCyberwares,          ATT.Cyberwaresui.totalTotalCyberwares           = ATT.Cyberwaresui.count()
              ATT.Cyberwaresui.ownedTotalCyberwaresliberty,   ATT.Cyberwaresui.totalTotalCyberwaresliberty    = ATT.Cyberwaresui.countcyberwaresliberty()
              ATT.Quickhacksui.ownedTotalQuickhacksui,        ATT.Quickhacksui.totalTotalQuickhacksui         = ATT.Quickhacksui.count()
              ATT.Modsui.ownedTotalModsui,                    ATT.Modsui.totalTotalModsui                     = ATT.Modsui.count()
              ATT.Modsui.ownedTotalModsuiliberty,             ATT.Modsui.totalTotalModsuiliberty              = ATT.Modsui.countmodliberty()
          elseif ATT.currentProfile == "att2" then
              ATT.Vehicules.ownedVehiclesTotalstreetcorpo,    ATT.Vehicules.totalVehiclesTotalstreetcorpo     = ATT.Vehicules.teststreetcorpo()
              ATT.Clothesui.ownedTotalClothesui,              ATT.Clothesui.totalTotalClothesui               = ATT.Clothesui.count()
              -- ATT.Clothesui.ownedTotalCorpo,                  ATT.Clothesui.totalCorpo                        = ATT.Clothesui.countcorpo()
              ATT.Vehicules.ownedVehiclesTotalliberty,        ATT.Vehicules.totalVehiclesTotalliberty         = ATT.Vehicules.testliberty()
              ATT.Weaponsui.ownedTotalWeapons,                ATT.Weaponsui.totalTotalWeapons                 = ATT.Weaponsui.count()
              ATT.Weaponsui.ownedTotalWeaponsliberty,         ATT.Weaponsui.totalTotalWeaponsliberty          = ATT.Weaponsui.countliberty()
              ATT.Cyberwaresui.ownedTotalCyberwares,          ATT.Cyberwaresui.totalTotalCyberwares           = ATT.Cyberwaresui.count()
              ATT.Cyberwaresui.ownedTotalCyberwaresliberty,   ATT.Cyberwaresui.totalTotalCyberwaresliberty    = ATT.Cyberwaresui.countcyberwaresliberty()
              ATT.Quickhacksui.ownedTotalQuickhacksui,        ATT.Quickhacksui.totalTotalQuickhacksui         = ATT.Quickhacksui.count()
              ATT.Modsui.ownedTotalModsui,                    ATT.Modsui.totalTotalModsui                     = ATT.Modsui.count()
              ATT.Modsui.ownedTotalModsuiliberty,             ATT.Modsui.totalTotalModsuiliberty              = ATT.Modsui.countmodliberty()
              ATT.Misc.ownedTotalMisc,                        ATT.Misc.totalTotalMisc                         = ATT.Misc.count()
          end
            local ownedVehiclesTotal              = ATT.Vehicules.ownedVehiclesTotal or 0
            local ownedVehiclesTotalstreetcorpo   = ATT.Vehicules.ownedVehiclesTotalstreetcorpo or 0
            local ownedVehiclesTotalliberty       = ATT.Vehicules.ownedVehiclesTotalliberty or 0
            local totalVehiclesTotal              = ATT.Vehicules.totalVehiclesTotal or 0
            local totalVehiclesTotalstreetcorpo   = ATT.Vehicules.totalVehiclesTotalstreetcorpo or 0
            local totalVehiclesTotalliberty       = ATT.Vehicules.totalVehiclesTotalliberty or 0

            local ownedWeaponsuiTotal             = ATT.Weaponsui.ownedTotalWeapons or 0 
            local totalWeaponsuiTotal             = ATT.Weaponsui.totalTotalWeapons or 0 
            local ownedWeaponsuilibertyTotal      = ATT.Weaponsui.ownedTotalWeaponsliberty or 0 
            local totalWeaponsuilibertyTotal      = ATT.Weaponsui.totalTotalWeaponsliberty or 0 

            local ownedCyberwaresuiTotal          = ATT.Cyberwaresui.ownedTotalCyberwares or 0
            local totalCyberwaresuiTotal          = ATT.Cyberwaresui.totalTotalCyberwares or 0
            local ownedCyberwaresuilibertyTotal   = ATT.Cyberwaresui.ownedTotalCyberwaresliberty or 0
            local totalCyberwaresuilibertyTotal   = ATT.Cyberwaresui.totalTotalCyberwaresliberty or 0

            local ownedQuickhacksuiTotal          = ATT.Quickhacksui.ownedTotalQuickhacksui or 0
            local totalQuickhacksuiTotal          = ATT.Quickhacksui.totalTotalQuickhacksui or 0

            local ownedClothesuiTotal             = ATT.Clothesui.ownedTotalClothesui or 0
            -- local ownedClothesuinomadTotal        = ATT.Clothesui.ownedTotalNomad or 0
            -- local ownedClothesuistreetkidTotal    = ATT.Clothesui.ownedTotalStreetkid or 0
            -- local ownedClothesuicorpoTotal        = ATT.Clothesui.ownedTotalCorpo or 0
            local totalClothesuiTotal             = ATT.Clothesui.totalTotalClothesui or 0
            -- local totalClothesuinomadTotal        = ATT.Clothesui.totalNomad or 0
            -- local totalClothesuistreetkidTotal    = ATT.Clothesui.totalStreetkid or 0
            -- local totalClothesuicorpoTotal        = ATT.Clothesui.totalCorpo or 0

            local ownedModsuiTotal                = ATT.Modsui.ownedTotalModsui or 0
            local totalModsuiTotal                = ATT.Modsui.totalTotalModsui or 0
            local ownedModsuilibertyTotal         = ATT.Modsui.ownedTotalModsuiliberty or 0
            local totalModsuilibertyTotal         = ATT.Modsui.totalTotalModsuiliberty or 0

            local ownedMiscTotal                  = ATT.Misc.ownedTotalMisc or 0
            local totalMiscTotal                  = ATT.Misc.totalTotalMisc or 0

            local progress = 0
            if ATT.currentProfile == "nomad" then
              if (
                  ownedVehiclesTotal + 
                  ownedVehiclesTotalliberty + 
                  ownedWeaponsuiTotal + 
                  ownedCyberwaresuiTotal + 
                  ownedQuickhacksuiTotal + 
                  ownedClothesuiTotal + 
                  ownedModsuiTotal + 
                  ownedWeaponsuilibertyTotal + 
                  ownedModsuilibertyTotal + 
                  ownedCyberwaresuilibertyTotal +
                  ownedMiscTotal
                  ) > 0 then
                  progress = (
                    ownedVehiclesTotal + 
                    ownedVehiclesTotalliberty + 
                    ownedWeaponsuiTotal + 
                    ownedCyberwaresuiTotal + 
                    ownedQuickhacksuiTotal + 
                    ownedClothesuiTotal + 
                    ownedModsuiTotal + 
                    ownedWeaponsuilibertyTotal + 
                    ownedModsuilibertyTotal + 
                    ownedCyberwaresuilibertyTotal +
                    ownedMiscTotal
                    ) 
                  / 
                  (
                    totalVehiclesTotal + 
                    totalVehiclesTotalliberty + 
                    totalWeaponsuiTotal + 
                    totalCyberwaresuiTotal + 
                    totalQuickhacksuiTotal + 
                    totalClothesuiTotal + 
                    totalModsuiTotal + 
                    totalWeaponsuilibertyTotal + 
                    totalModsuilibertyTotal + 
                    totalCyberwaresuilibertyTotal +
                    totalMiscTotal 
                  )
              end
              -- ImGui.Indent(100)
              ImGui.Text(string.format(T("ATT_PROGRESS") .. "%d/%d (%.2f%%)", 
              ownedVehiclesTotal + 
              ownedVehiclesTotalliberty + 
              ownedWeaponsuiTotal + 
              ownedClothesuiTotal + 
              ownedQuickhacksuiTotal + 
              ownedCyberwaresuiTotal + 
              ownedModsuiTotal + 
              ownedWeaponsuilibertyTotal + 
              ownedModsuilibertyTotal + 
              ownedCyberwaresuilibertyTotal +
              ownedMiscTotal, 
              totalVehiclesTotal + 
              totalVehiclesTotalliberty + 
              totalWeaponsuiTotal + 
              totalCyberwaresuiTotal + 
              totalQuickhacksuiTotal + 
              totalClothesuiTotal + 
              totalModsuiTotal + 
              totalWeaponsuilibertyTotal + 
              totalModsuilibertyTotal + 
              totalCyberwaresuilibertyTotal +
              totalMiscTotal, 
              progress * 100))
              -- ImGui.Unindent(100)
            end

            if ATT.currentProfile == "att1" then
              if ( 
                ownedVehiclesTotalliberty + 
                ownedWeaponsuiTotal + 
                ownedCyberwaresuiTotal + 
                ownedQuickhacksuiTotal + 
                ownedClothesuiTotal + 
                ownedModsuiTotal + 
                ownedWeaponsuilibertyTotal + 
                ownedModsuilibertyTotal + 
                ownedCyberwaresuilibertyTotal + 
                ownedMiscTotal + 
                ownedVehiclesTotalstreetcorpo) 
                > 0 then
                  progress = ( 
                    ownedVehiclesTotalliberty + 
                    ownedWeaponsuiTotal + 
                    ownedCyberwaresuiTotal + 
                    ownedQuickhacksuiTotal + 
                    ownedClothesuiTotal + 
                    ownedModsuiTotal + 
                    ownedWeaponsuilibertyTotal + 
                    ownedModsuilibertyTotal + 
                    ownedCyberwaresuilibertyTotal + 
                    ownedMiscTotal + 
                    ownedVehiclesTotalstreetcorpo
                  ) 
                  / 
                  ( 
                    totalVehiclesTotalliberty + 
                    totalWeaponsuiTotal + 
                    totalCyberwaresuiTotal + 
                    totalQuickhacksuiTotal + 
                    totalClothesuiTotal + 
                    totalModsuiTotal + 
                    totalWeaponsuilibertyTotal + 
                    totalModsuilibertyTotal + 
                    totalCyberwaresuilibertyTotal + 
                    totalMiscTotal + 
                    totalVehiclesTotalstreetcorpo
                  )
              end
              -- ImGui.Indent(100)
                ImGui.Text(string.format(T("ATT_PROGRESS") .. "%d/%d (%.2f%%)", 
                ownedVehiclesTotalliberty + 
                ownedWeaponsuiTotal + 
                ownedClothesuiTotal + 
                ownedQuickhacksuiTotal + 
                ownedCyberwaresuiTotal + 
                ownedModsuiTotal + 
                ownedWeaponsuilibertyTotal + 
                ownedModsuilibertyTotal + 
                ownedCyberwaresuilibertyTotal + 
                ownedMiscTotal + 
                ownedVehiclesTotalstreetcorpo, 
                totalVehiclesTotalliberty + 
                totalWeaponsuiTotal + 
                totalCyberwaresuiTotal + 
                totalQuickhacksuiTotal + 
                totalClothesuiTotal + 
                totalModsuiTotal + 
                totalWeaponsuilibertyTotal + 
                totalModsuilibertyTotal + 
                totalCyberwaresuilibertyTotal + 
                totalMiscTotal + 
                totalVehiclesTotalstreetcorpo, 
                progress * 100))
              -- ImGui.Unindent(100)
            end
            if ATT.currentProfile == "att2" then
              if ( 
                ownedVehiclesTotalliberty + 
                ownedWeaponsuiTotal + 
                ownedCyberwaresuiTotal + 
                ownedQuickhacksuiTotal + 
                ownedClothesuiTotal + 
                ownedModsuiTotal + 
                ownedWeaponsuilibertyTotal + 
                ownedModsuilibertyTotal + 
                ownedCyberwaresuilibertyTotal + 
                ownedMiscTotal + 
                ownedVehiclesTotalstreetcorpo) 
                > 0 then
                  progress = ( 
                    ownedVehiclesTotalliberty + 
                    ownedWeaponsuiTotal + 
                    ownedCyberwaresuiTotal + 
                    ownedQuickhacksuiTotal + 
                    ownedClothesuiTotal + 
                    ownedModsuiTotal + 
                    ownedWeaponsuilibertyTotal + 
                    ownedModsuilibertyTotal + 
                    ownedCyberwaresuilibertyTotal + 
                    ownedMiscTotal + 
                    ownedVehiclesTotalstreetcorpo
                  ) 
                  / 
                  ( 
                    totalVehiclesTotalliberty + 
                    totalWeaponsuiTotal + 
                    totalCyberwaresuiTotal + 
                    totalQuickhacksuiTotal + 
                    totalClothesuiTotal + 
                    totalModsuiTotal + 
                    totalWeaponsuilibertyTotal + 
                    totalModsuilibertyTotal + 
                    totalCyberwaresuilibertyTotal + 
                    totalMiscTotal + 
                    totalVehiclesTotalstreetcorpo-- +
                    --totalClothesuicorpoTotal
                  )
              end
              -- ImGui.Indent(100)
                ImGui.Text(string.format(T("ATT_PROGRESS") .. "%d/%d (%.2f%%)", 
                ownedVehiclesTotalliberty + 
                ownedWeaponsuiTotal + 
                ownedClothesuiTotal + 
                ownedQuickhacksuiTotal + 
                ownedCyberwaresuiTotal + 
                ownedModsuiTotal + 
                ownedWeaponsuilibertyTotal + 
                ownedModsuilibertyTotal + 
                ownedCyberwaresuilibertyTotal + 
                ownedMiscTotal + 
                ownedVehiclesTotalstreetcorpo, 
                totalVehiclesTotalliberty + 
                totalWeaponsuiTotal + 
                totalCyberwaresuiTotal + 
                totalQuickhacksuiTotal + 
                totalClothesuiTotal + 
                totalModsuiTotal + 
                totalWeaponsuilibertyTotal + 
                totalModsuilibertyTotal + 
                totalCyberwaresuilibertyTotal + 
                totalMiscTotal + 
                totalVehiclesTotalstreetcorpo, --+ 
               -- totalClothesuicorpoTotal, 
                progress * 100))
              -- ImGui.Unindent(100)
            end

            ImGui.ProgressBar(progress, -1,0, string.format("%.0f%%", progress * 100))
            ImGui.SameLine()
            -- searchQuery = ImGui.InputTextWithHint("##search", "search item", searchQuery, 256)
            ImGui.Spacing()
            ImGui.Separator()
            local childWindow5Width, childWindow5Height = ImGui.GetContentRegionAvail()
            if ImGui.BeginChild("Child Window 5", 1 * childWindow5Width, 0.6 * childWindow5Height, true) then
              if ATT.selectedGame == "Cyberpunk 2077" then
                if ATT.currentProfile == "nomad" then
                    ATT.DrawUIVehiculeslistNomadCyberpunk2077()
                    ATT.DrawUIClotheslistnomadCyberpunk2077()
                end
                if ATT.currentProfile == "att1" then
                    ATT.DrawUIVehiculeslistCyberpunk2077()
                    ATT.DrawUIClothesliststreetkidCyberpunk2077()
                end
                if ATT.currentProfile == "att2" then
                    ATT.DrawUIVehiculeslistCyberpunk2077()
                    ATT.DrawUIClotheslistcorpoCyberpunk2077()
                end
                ATT.DrawUIWeaponslistCyberpunk2077()
                ATT.DrawUICyberwareslistCyberpunk2077()
                ATT.DrawUIQuickhackslistCyberpunk2077()
                ATT.DrawUIMisclistCyberpunk2077()
                ATT.DrawUIModlistCyberpunk2077()
                ATT.DrawUIClotheslistCyberpunk2077()
              end
              if ATT.selectedGame == "Phantom Liberty" then
                ATT.DrawUIVehiculeslistPhantomLiberty()
                ATT.DrawUIWeaponslistPhantomLiberty()
                ATT.DrawUICyberwareslistPhantomLiberty()
                ATT.DrawUIModlistPhantomLiberty()
              end
            ImGui.EndChild()
            end
            local childWindow4Width, childWindow4Height = ImGui.GetContentRegionAvail()
            if ImGui.BeginChild("Child Window 4", 1 * childWindow4Width, 1 * childWindow4Height, true) then
              --debut armes
                if ATT.Weaponsui.showhandguns then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Handguns[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Handguns[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if ImGui.TreeNode(T("ATT_Obtention")) then
                      if acquisitionText ~= "" then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                      end
                      if vendorText ~= "" then
                        if ImGui.TreeNode(T("ATT_Vendor")) then
                          ImGui.TextWrapped(vendorText or "")
                          ImGui.TreePop()
                        end
                      end
                      ImGui.TreePop()
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Handguns_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Handguns_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Handguns_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Handguns_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Handguns_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Handguns_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end
                end
                if ATT.Weaponsui.showrevolvers then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Revolvers[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Revolvers[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if ImGui.TreeNode(T("ATT_Obtention")) then
                      if acquisitionText ~= "" then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                      end
                      if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                      end
                    ImGui.TreePop()
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Revolvers_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Revolvers_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Revolvers_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Revolvers_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Revolvers_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Revolvers_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showassault_rifles then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.AssaultRifles[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.AssaultRifles[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.AssaultRifles_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.AssaultRifles_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.AssaultRifles_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.AssaultRifles_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.AssaultRifles_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.AssaultRifles_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showSniperRifles then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.SniperRifles[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.SniperRifles[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.SniperRifles_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.SniperRifles_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.SniperRifles_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.SniperRifles_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.SniperRifles_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.SniperRifles_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showPrecisionRifles then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.PrecisionRifles[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.PrecisionRifles[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.PrecisionRifles_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.PrecisionRifles_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.PrecisionRifles_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.PrecisionRifles_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showShotguns then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Shotguns[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Shotguns[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Shotguns_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Shotguns_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Shotguns_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Shotguns_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Shotguns_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Shotguns_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showSmgs then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Smgs[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Smgs[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Smgs_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Smgs_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Smgs_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Smgs_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Smgs_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Smgs_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showHmgs then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Hmgs[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Hmgs[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Hmgs_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Hmgs_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Hmgs_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Hmgs_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showGrenades then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Grenades[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Grenades[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end               
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Grenades_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Grenades_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showAxes then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Axes[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Axes[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Axes_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Axes_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Axes_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Axes_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showChainswords then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Chainswords[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Chainswords[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Chainswords_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Chainswords_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showKatanas then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Katanas[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Katanas[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end               
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Katanas_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Katanas_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showKnives then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Knives[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Knives[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Knives_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Knives_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Knives_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Knives_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showMachetes then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Machetes[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Machetes[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Machetes_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Machetes_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Machetes_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Machetes_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showSwords then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Swords[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.Swords[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end
                end
                if ATT.Weaponsui.showHammers then
                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Hammers[ATT.Weaponsui.selectedName] then
                  local data = ATT.Weaponsui.groupedWeapons.Hammers[ATT.Weaponsui.selectedName]
                  local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                  local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")
                  
                  -- ImGui.TextWrapped(acquisitionText)
                  if acquisitionText ~= "" then
                    if ImGui.TreeNode(T("ATT_Obtention")) then
                      if ImGui.TreeNode(T("ATT_Ennemie")) then
                        ImGui.TextWrapped(acquisitionText or "")
                        ImGui.TreePop()
                      end
                      if vendorText ~= "" then
                        if ImGui.TreeNode(T("ATT_Vendor")) then
                          ImGui.TextWrapped(vendorText or "")
                          ImGui.TreePop()
                        end
                        ImGui.TreePop()
                      end
                    end
                  end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.Hammers_quest[ATT.Weaponsui.selectedName] then
                  local data = ATT.Weaponsui.groupedWeapons.Hammers_quest[ATT.Weaponsui.selectedName]
                  local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                  local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")
                  
                  -- ImGui.TextWrapped(acquisitionText)
                  if acquisitionText ~= "" then
                  if ImGui.TreeNode(T("ATT_Obtention")) then
                    if ImGui.TreeNode(T("ATT_Mission")) then
                      ImGui.TextWrapped(acquisitionText or "")
                      ImGui.TreePop()
                    end
                    if vendorText ~= "" then
                      if ImGui.TreeNode(T("ATT_Vendor")) then
                        ImGui.TextWrapped(vendorText or "")
                        ImGui.TreePop()
                      end
                      ImGui.TreePop()
                    end
                  end
                  end
                  end 
                end
                if ATT.Weaponsui.showOneHandedClubs then
                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.OneHandedClubs[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.OneHandedClubs[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.OneHandedClubs_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.OneHandedClubs_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.OneHandedClubs_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.OneHandedClubs_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
                if ATT.Weaponsui.showTwoHandedClubs then
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.TwoHandedClubs[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.TwoHandedClubs[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.TwoHandedClubs_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.TwoHandedClubs_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Ennemie")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.TwoHandedClubs_quest_liberty[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.TwoHandedClubs_quest_liberty[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end                
                  if ATT.Weaponsui.selectedName and ATT.Weaponsui.groupedWeapons.TwoHandedClubs_quest[ATT.Weaponsui.selectedName] then
                    local data = ATT.Weaponsui.groupedWeapons.TwoHandedClubs_quest[ATT.Weaponsui.selectedName]
                    local acquisitionText = showEnglish and (data.acquisitionen or "") or (data.acquisitiontrad or "")
                    local vendorText = showEnglish and (data.vendoren or "") or (data.vendorentrad or "")

                    -- ImGui.TextWrapped(acquisitionText)
                    if acquisitionText ~= "" then
                      if ImGui.TreeNode(T("ATT_Obtention")) then
                        if ImGui.TreeNode(T("ATT_Mission")) then
                          ImGui.TextWrapped(acquisitionText or "")
                          ImGui.TreePop()
                        end
                        if vendorText ~= "" then
                          if ImGui.TreeNode(T("ATT_Vendor")) then
                            ImGui.TextWrapped(vendorText or "")
                            ImGui.TreePop()
                          end
                          ImGui.TreePop()
                        end
                      end
                    end
                  end 
                end
              --fin armes
              --debut cyberwares
                if ATT.Cyberwaresui.showArms then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.Arms[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.Arms[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.Arms_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.Arms_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Cyberwaresui.showcirculatorySystems then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.circulatorySystems[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.circulatorySystems[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.circulatorySystems_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.circulatorySystems_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Cyberwaresui.showFacesCY then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.FacesCY[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.FacesCY[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.FacesCY_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.FacesCY_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Cyberwaresui.showFrontalCortexs then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.FrontalCortexs[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.FrontalCortexs[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.FrontalCortexs_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.FrontalCortexs_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Cyberwaresui.showHandsCY then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.HandsCY[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.HandsCY[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.HandsCY_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.HandsCY_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Cyberwaresui.showIntegumentarSystems then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.IntegumentarSystems[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.IntegumentarSystems[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.IntegumentarSystems_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.IntegumentarSystems_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Cyberwaresui.showLegsCY then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.LegsCY[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.LegsCY[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.LegsCY_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.LegsCY_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Cyberwaresui.showNervousSystems then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.NervousSystems[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.NervousSystems[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.NervousSystems_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.NervousSystems_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Cyberwaresui.showOperatingSystems then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.OperatingSystems[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.OperatingSystems[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.OperatingSystems_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.OperatingSystems_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Cyberwaresui.showSkeletons then
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.Skeletons[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.Skeletons[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Cyberwaresui.selectedName and ATT.Cyberwaresui.groupedCyberwares.Skeletons_liberty[ATT.Cyberwaresui.selectedName] then
                    local data = ATT.Cyberwaresui.groupedCyberwares.Skeletons_liberty[ATT.Cyberwaresui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
              --fin cyberwares
              --debut quickhacks
                if ATT.Quickhacksui.showcombat then
                  if ATT.Quickhacksui.selectedName and ATT.Quickhacksui.groupedQuickhacks.combat[ATT.Quickhacksui.selectedName] then
                    local data = ATT.Quickhacksui.groupedQuickhacks.combat[ATT.Quickhacksui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Quickhacksui.showcontrol then
                  if ATT.Quickhacksui.selectedName and ATT.Quickhacksui.groupedQuickhacks.control[ATT.Quickhacksui.selectedName] then
                    local data = ATT.Quickhacksui.groupedQuickhacks.control[ATT.Quickhacksui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Quickhacksui.showcovert then
                  if ATT.Quickhacksui.selectedName and ATT.Quickhacksui.groupedQuickhacks.covert[ATT.Quickhacksui.selectedName] then
                    local data = ATT.Quickhacksui.groupedQuickhacks.covert[ATT.Quickhacksui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Quickhacksui.showultimate then
                  if ATT.Quickhacksui.selectedName and ATT.Quickhacksui.groupedQuickhacks.ultimate[ATT.Quickhacksui.selectedName] then
                    local data = ATT.Quickhacksui.groupedQuickhacks.ultimate[ATT.Quickhacksui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
              --fin quickhacks
              --debut mod
                if ATT.Modsui.showARSMGLMGMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.ARSMGLMGMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.ARSMGLMGMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showBLADEMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.BLADEMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.BLADEMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showBLUNTWEAPONMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.BLUNTWEAPONMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.BLUNTWEAPONMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showMELEEWEAPONMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.MELEEWEAPONMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.MELEEWEAPONMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showMUZZLEASSAULTRIFLESMG then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.MUZZLEASSAULTRIFLESMG[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.MUZZLEASSAULTRIFLESMG[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showMUZZLEHANDGUN then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.MUZZLEHANDGUN[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.MUZZLEHANDGUN[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showPISTOLREVOLVERMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.PISTOLREVOLVERMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.PISTOLREVOLVERMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showPOWERWEAPONMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.POWERWEAPONMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.POWERWEAPONMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.POWERWEAPONMOD_liberty[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.POWERWEAPONMOD_liberty[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showSCOPEGENERICLONG then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.SCOPEGENERICLONG[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.SCOPEGENERICLONG[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showSCOPEGENERICSHORT then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.SCOPEGENERICSHORT[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.SCOPEGENERICSHORT[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showSCOPETECHSNIPER then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.SCOPETECHSNIPER[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.SCOPETECHSNIPER[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showSHOTGUNMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.SHOTGUNMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.SHOTGUNMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showSILENCER then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.SILENCER[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.SILENCER[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showSMARTWEAPONMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.SMARTWEAPONMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.SMARTWEAPONMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.SMARTWEAPONMOD_liberty[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.SMARTWEAPONMOD_liberty[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showSNIPERPRECRIFLEMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.SNIPERPRECRIFLEMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.SNIPERPRECRIFLEMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showTECHWEAPONMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.TECHWEAPONMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.TECHWEAPONMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.TECHWEAPONMOD_liberty[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.TECHWEAPONMOD_liberty[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showTHROWABLEWEAPONMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.THROWABLEWEAPONMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.THROWABLEWEAPONMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Modsui.showWEAPONMOD then
                  if ATT.Modsui.selectedName and ATT.Modsui.groupedMods.WEAPONMOD[ATT.Modsui.selectedName] then
                    local data = ATT.Modsui.groupedMods.WEAPONMOD[ATT.Modsui.selectedName]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
              --fin mod
              --debut Vehicules
              if ATT.Vehicules.showcar or ATT.Vehicules.showmoto then
                if ATT.Vehicules.selectedVehicle then
                    local vehicleData = ATT.Vehicules.selectedVehicle
            
                    -- 🔹 Chercher la traduction en parcourant tous les IDs possibles
                    local translation = nil
                    for _, id in ipairs(ATT.Vehicules.getIds(vehicleData)) do
                        if ATT.Vehicules.vehicleTranslations[id] then
                            translation = ATT.Vehicules.vehicleTranslations[id]
                            break
                        end
                    end
            
                    local displayName = showEnglish and (translation and translation.en or vehicleData.name)
                                                      or (translation and translation.trad or vehicleData.name)
                    local additionalText = showEnglish and (translation and translation.addionalen)
                                                       or (translation and translation.addionaltrad)
            
                    if displayName then
                        if ImGui.TreeNode(T("ATT_Obtention")) then
                            ImGui.TextWrapped(displayName or "")
                            ImGui.TreePop()
                        end
                    end
            
                    if additionalText then
                        if ImGui.TreeNode(T("ATT_ExtraInfo")) then
                            ImGui.TextWrapped(additionalText or "Aucune information disponible")
                            ImGui.TreePop()
                        end
                    end
            
                    ImGui.TreePop()
                end
            end
            
                -- if ATT.Vehicules.showcar or ATT.Vehicules.showmoto then
                --   if ATT.Vehicules.selectedVehicle then
                --       local vehicleData = ATT.Vehicules.selectedVehicle
                --       local displayName = showEnglish and (ATT.Vehicules.vehicleTranslations[vehicleData.id] and ATT.Vehicules.vehicleTranslations[vehicleData.id].en or vehicleData.name)
                --                           or (ATT.Vehicules.vehicleTranslations[vehicleData.id] and ATT.Vehicules.vehicleTranslations[vehicleData.id].trad or vehicleData.name)
                --       local additionalText = showEnglish and (ATT.Vehicules.vehicleTranslations[vehicleData.id] and ATT.Vehicules.vehicleTranslations[vehicleData.id].addionalen)
                --                              or (ATT.Vehicules.vehicleTranslations[vehicleData.id] and ATT.Vehicules.vehicleTranslations[vehicleData.id].addionaltrad)
                --       if displayName then
                --         if ImGui.TreeNode(T("ATT_Obtention")) then
                --           ImGui.TextWrapped(displayName or "")
                --           ImGui.TreePop()
                --         end
                --       end
                --       if additionalText then
                --         if ImGui.TreeNode(T("ATT_ExtraInfo")) then
                --           ImGui.TextWrapped(additionalText or "Aucune information disponible")
                --           ImGui.TreePop()
                --         end
                --       end
                --       ImGui.TreePop()
                --     end
                -- end
                     
                --fin vehicules
                if ATT.Misc.showcrafting then
                  if ATT.Misc.selectedName and ATT.Misc.groupedmisc.CRAFTING_COMPONENTS[ATT.Misc.selectedName] then
                    local data = ATT.Misc.groupedmisc.CRAFTING_COMPONENTS[ATT.Misc.groupedmisc]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Misc.showbuff then
                  if ATT.Misc.selectedName and ATT.Misc.groupedmisc.BUFF[ATT.Misc.selectedName] then
                    local data = ATT.Misc.groupedmisc.BUFF[ATT.Misc.groupedmisc]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Misc.showmeds then
                  if ATT.Misc.selectedName and ATT.Misc.groupedmisc.Medication[ATT.Misc.selectedName] then
                    local data = ATT.Misc.groupedmisc.Medication[ATT.Misc.groupedmisc]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Misc.showalcohol then
                  if ATT.Misc.selectedName and ATT.Misc.groupedmisc.ALCOHOL[ATT.Misc.selectedName] then
                    local data = ATT.Misc.groupedmisc.ALCOHOL[ATT.Misc.groupedmisc]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Misc.showdrink then
                  if ATT.Misc.selectedName and ATT.Misc.groupedmisc.DRINK[ATT.Misc.selectedName] then
                    local data = ATT.Misc.groupedmisc.DRINK[ATT.Misc.groupedmisc]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end
                if ATT.Misc.showfood then
                  if ATT.Misc.selectedName and ATT.Misc.groupedmisc.FOOD[ATT.Misc.selectedName] then
                    local data = ATT.Misc.groupedmisc.FOOD[ATT.Misc.groupedmisc]
                  
                    -- 🔥 Affiche la bonne version de l'acquisition en fonction de `showEnglish`
                    local acquisitionText = showEnglish and data.acquisitionen or data.acquisitiontrad
                  
                    ImGui.TextWrapped(acquisitionText or "No acquisition information available.")
                      --     ImGui.TextWrapped(group[selectedName].additionaltest or "No acquisition information available.")
                  
                  end
                end

              --debut nomad clothes
                if ATT.Clothesui.showV_nomad_set then
                    ImGui.TextWrapped(T("ATT_NOMAD"))
                end
                if ATT.Clothesui.showV_streetkid_set then
                    ImGui.TextWrapped(T("ATT_STREETKID"))
                end
                if ATT.Clothesui.showV_corpo_set then
                    ImGui.TextWrapped(T("ATT_CORPORAT"))
                end

                -- if ATT.Clothesui.showHaeds_other then
                --     ImGui.TextWrapped(T("ATT_CORPORAT"))
                -- end
                if ATT.Clothesui.showJohnny_Silverhand_set then
                    ImGui.TextWrapped(T("ATT_SILVEHAND"))
                end
                if ATT.Clothesui.showV_The_Rescue_set then
                    ImGui.TextWrapped(T("ATT_THE_RESCUE"))
                end
                if ATT.Clothesui.showYorinubo_set then
                    ImGui.TextWrapped(T("ATT_YORINOBU"))
                end
                if ATT.Clothesui.showMaxTac_set then
                    ImGui.TextWrapped(T("ATT_MAXTAC"))
                end
                if ATT.Clothesui.showNUS_Agent_set then
                    ImGui.TextWrapped(T("ATT_TWITCH"))
                end
                if ATT.Clothesui.showThe_Star_set then
                    ImGui.TextWrapped(T("ATT_WATCHTOWER"))
                end
                if ATT.Clothesui.showThe_sun_set then
                    ImGui.TextWrapped(T("ATT_POG_ENDING"))
                end
                if ATT.Clothesui.showTemperance_set then
                    ImGui.TextWrapped(T("ATT_NDF_ENDING"))
                end
                if ATT.Clothesui.showCop_set then
                    ImGui.TextWrapped(T("ATT_COP_ROLE"))
                end
                if ATT.Clothesui.showCorporate_set then
                    ImGui.TextWrapped(T("ATT_CORPORATE_ROLE"))
                end
                if ATT.Clothesui.showFixer_set then
                    ImGui.TextWrapped(T("ATT_FIXER_ROLE"))
                end
                if ATT.Clothesui.showMedia_set then
                    ImGui.TextWrapped(T("ATT_MEDIA_ROLE"))
                end
                if ATT.Clothesui.showNetrunner_set then
                    ImGui.TextWrapped(T("ATT_NETRUNNER_ROLE"))
                end
                if ATT.Clothesui.showNomad_set then
                    ImGui.TextWrapped(T("ATT_NOMAD_ROLE"))
                end
                if ATT.Clothesui.showRocker_set then
                    ImGui.TextWrapped(T("ATT_ROCKER_ROLE"))
                end
                if ATT.Clothesui.showSolo_set then
                    ImGui.TextWrapped(T("ATT_SOLO_ROLE"))
                end
                if ATT.Clothesui.showTechie_set then
                    ImGui.TextWrapped(T("ATT_TECHIE_ROLE"))
                end
              --fin nomad clothes
            ImGui.EndChild()
            end
          ImGui.EndChild()
          end
        end
        end
        if ATT.general.showGeneralUI then
          ATT.general.drawgeneralui()
        end
        if ATT.changelog.showchangelogUI then
          ATT.changelog.drawchangelogui()
        end
        if ATT.information.showinformationUI then
          ATT.information.drawinformationui()
        end
      ImGui.EndChild()
      end
    end
  ImGui.End()
  end
end)

function ATT.DrawUIHeader()
    ImGui.Spacing()
    ImGui.SameLine()
    if ATT.currentProfile == "nomad" then
      ATT.nomad.OnDrawProfil()
        ATT.SaveSettings()
    end
    if ATT.currentProfile == "att1" then
      ATT.ATT1.OnDrawProfil()
        ATT.SaveSettings()
    end
    if ATT.currentProfile == "att2" then
      ATT.ATT2.OnDrawProfil()
        ATT.SaveSettings()
    end
    ImGui.SameLine()
    local windowWidth = ImGui.GetContentRegionAvail()
    local button1Width = ImGui.CalcTextSize("Cyberpunk 2077") - 60  -- Ajout d'un padding
    local button2Width = ImGui.CalcTextSize("Phantom Liberty") - 60
    local totalWidth = button1Width + button2Width + 20  -- Espacement entre les boutons
    ImGui.SetCursorPosX((windowWidth - totalWidth) / 2)
    if ATT.selectedGame == "Cyberpunk 2077" then
        ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 1.0, 0, 1)
    end
    if ImGui.Button(T("ATT_TITLE_GAME")) then
        ATT.selectedGame = "Cyberpunk 2077"
        ATT.showGeneralUI = false
        ATT.showchangelogUI = false
        ATT.showinformationUI = false
    end
    if ATT.selectedGame == "Cyberpunk 2077" then
        ImGui.PopStyleColor()
    end
    ImGui.SameLine()
    if ATT.selectedGame == "Phantom Liberty" then
        ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 1.0, 0, 1)
    end
    if ImGui.Button(T("ATT_TITLE_DLC")) then
        ATT.selectedGame = "Phantom Liberty"
        ATT.showGeneralUI = false
        ATT.showchangelogUI = false
        ATT.showinformationUI = false
    end
    if ATT.selectedGame == "Phantom Liberty" then
        ImGui.PopStyleColor()
    end
    ImGui.Spacing()
    ImGui.Separator()
end


function ATT.DrawUIVehiculesCyberpunk2077()
  ATT.Vehicules.testnomad()
  ATT.Vehicules.uinomad()
end
function ATT.DrawUIVehiculesCyberpunk2077streetcorpo()
  ATT.Vehicules.teststreetcorpo()
  ATT.Vehicules.uistreetcorpo()
end
function ATT.DrawUIWeaponsCyberpunk2077()
  ATT.Weaponsui.count()
  ATT.Weaponsui.uiweapons()
end
function ATT.DrawUICyberwaresCyberpunk2077()
  ATT.Cyberwaresui.count()
  ATT.Cyberwaresui.uicyberwares()
end
function ATT.DrawUIQuickhacksCyberpunk2077()
  ATT.Quickhacksui.count()
  ATT.Quickhacksui.uicyberwares()
end
function ATT.DrawUIModCyberpunk2077()
  ATT.Modsui.count()
  ATT.Modsui.uiMod()
end
function ATT.DrawUIMiscCyberpunk2077()
  ATT.Misc.ui()
  ATT.Misc.count()
end
function ATT.DrawUIClothesCyberpunk2077()
  ATT.Clothesui.count()
  if ImGui.CollapsingHeader(string.format(T("ATT_CLOTHES") .. "(%d/%d)",ATT.Clothesui.ownedTotalClothesui or 0, ATT.Clothesui.totalTotalClothesui or 0)) then
        ImGui.Indent(20)
        ATT.DrawUIClothesCyberpunk2077Wattson()
        ATT.DrawUIClothesCyberpunk2077santodomingo()
        ATT.DrawUIClothesCyberpunk2077westbrook()
        ATT.DrawUIClothesCyberpunk2077citycenter()
        ATT.DrawUIClothesCyberpunk2077badlands()
        ATT.DrawUIClothesCyberpunk2077heywood()
        ATT.DrawUIClothesCyberpunk207pacifica()
        ATT.DrawUIClothesCyberpunk207setcosmetic()
        ImGui.Unindent(20)
    end
end
function ATT.DrawUIClothesCyberpunk2077Wattson()
  ATT.Clothesui.uiclothesWattson()
end
function ATT.DrawUIClothesCyberpunk2077santodomingo()
  ATT.Clothesui.uiclothessantodomingo()
end
function ATT.DrawUIClothesCyberpunk2077westbrook()
  ATT.Clothesui.uiclotheswestbrook()
end
function ATT.DrawUIClothesCyberpunk2077citycenter()
  ATT.Clothesui.uiclothescitycenter()
end
function ATT.DrawUIClothesCyberpunk2077badlands()
  ATT.Clothesui.uiclothesbadlands()
end
function ATT.DrawUIClothesCyberpunk2077heywood()
  ATT.Clothesui.uiclothesheywood()
end
function ATT.DrawUIClothesCyberpunk207pacifica()
  ATT.Clothesui.uiclothespacifica()
end
function ATT.DrawUIClothesCyberpunk207setcosmetic()
  ATT.Clothesui.uiclothessetcosmetic()
end
function ATT.DrawUIVehiculesPhantomLiberty()
    ATT.Vehicules.testliberty()
    ATT.Vehicules.uiliberty()
end
function ATT.DrawUIWeaponsPhantomLiberty()
  ATT.Weaponsui.countliberty()
  ATT.Weaponsui.uiweaponsliberty()
end
function ATT.DrawUICyberwaresPhantomLiberty()
  ATT.Cyberwaresui.countcyberwaresliberty()
  ATT.Cyberwaresui.uicyberwaresliberty()
end
function ATT.DrawUIModPhantomLiberty()
  ATT.Modsui.countmodliberty()
  ATT.Modsui.uiModliberty()
end
function ATT.DrawUIVehiculeslistNomadCyberpunk2077()
  if ATT.Vehicules.showmoto then
    ATT.Vehicules.drawFilteredVehicleCategory("Motos", ATT.Vehicules.vehicles["Motosnomad"])
  end
  if ATT.Vehicules.showcar then
    ATT.Vehicules.drawFilteredVehicleCategory("Voitures", ATT.Vehicules.vehicles["Voituresnomad"])
  end
end
function ATT.DrawUIVehiculeslistPhantomLiberty()
  if ATT.Vehicules.showcar then
    ATT.Vehicules.drawFilteredVehicleCategory("Voitures", ATT.Vehicules.vehicles["Voituresliberty"])
  end
  if ATT.Vehicules.showmoto then
    ATT.Vehicules.drawFilteredVehicleCategory("Motos", ATT.Vehicules.vehicles["Motosliberty"])
  end
end
function ATT.DrawUIVehiculeslistCyberpunk2077()
  if ATT.Vehicules.showcar then
    ATT.Vehicules.drawFilteredVehicleCategory("Voitures", ATT.Vehicules.vehicles["Voitures"])
  end
  if ATT.Vehicules.showmoto then
    ATT.Vehicules.drawFilteredVehicleCategory("Motos", ATT.Vehicules.vehicles["Motos"])
  end
end
function ATT.DrawUIWeaponslistCyberpunk2077()
  if ATT.Weaponsui.showhandguns then
    ATT.Weaponsui.displayWeaponGroup("handguns", ATT.Weaponsui.groupedWeapons.Handguns)
    -- if not ATT.hideOwnedItems then --cacher les items obtune dans les missions
      ATT.Weaponsui.displayWeaponGroup("handguns_quest", ATT.Weaponsui.groupedWeapons.Handguns_quest)
    -- end
  end
  if ATT.Weaponsui.showrevolvers then
    ATT.Weaponsui.displayWeaponGroup("revolvers", ATT.Weaponsui.groupedWeapons.Revolvers)
    ATT.Weaponsui.displayWeaponGroup("revolvers_quest", ATT.Weaponsui.groupedWeapons.Revolvers_quest)
  end
  if ATT.Weaponsui.showassault_rifles then
    ATT.Weaponsui.displayWeaponGroup("assault_rifle", ATT.Weaponsui.groupedWeapons.AssaultRifles)
    ATT.Weaponsui.displayWeaponGroup("assault_rifle_quest", ATT.Weaponsui.groupedWeapons.AssaultRifles_quest)
  end
  if ATT.Weaponsui.showSniperRifles then
    ATT.Weaponsui.displayWeaponGroup("sniper_rifle", ATT.Weaponsui.groupedWeapons.SniperRifles)
    ATT.Weaponsui.displayWeaponGroup("sniper_rifle_quest",ATT.Weaponsui.groupedWeapons.SniperRifles_quest)
  end
  if ATT.Weaponsui.showPrecisionRifles then
    ATT.Weaponsui.displayWeaponGroup("precision_rifle", ATT.Weaponsui.groupedWeapons.PrecisionRifles)
    ATT.Weaponsui.displayWeaponGroup("precision_rifles_quest", ATT.Weaponsui.groupedWeapons.PrecisionRifles_quest)
  end
  if ATT.Weaponsui.showShotguns then
    ATT.Weaponsui.displayWeaponGroup("shotgun", ATT.Weaponsui.groupedWeapons.Shotguns)
    ATT.Weaponsui.displayWeaponGroup("shotgun_quest", ATT.Weaponsui.groupedWeapons.Shotguns_quest)
  end
  if ATT.Weaponsui.showSmgs then
    ATT.Weaponsui.displayWeaponGroup("smg", ATT.Weaponsui.groupedWeapons.Smgs)
    ATT.Weaponsui.displayWeaponGroup("smg_quest", ATT.Weaponsui.groupedWeapons.Smgs_quest)
  end
  if ATT.Weaponsui.showHmgs then
    ATT.Weaponsui.displayWeaponGroup("hmg", ATT.Weaponsui.groupedWeapons.Hmgs)
  end
  if ATT.Weaponsui.showGrenades then
    ATT.Weaponsui.displayWeaponGroup("grenade", ATT.Weaponsui.groupedWeapons.Grenades)
    ATT.Weaponsui.displayWeaponGroup("grenade_quest", ATT.Weaponsui.groupedWeapons.Grenades_quest)
  end
  if ATT.Weaponsui.showAxes then
    ATT.Weaponsui.displayWeaponGroup("axe", ATT.Weaponsui.groupedWeapons.Axes)
  end
  if ATT.Weaponsui.showChainswords then
    ATT.Weaponsui.displayWeaponGroup("chainsword", ATT.Weaponsui.groupedWeapons.Chainswords)
  end
  if ATT.Weaponsui.showKatanas then
    ATT.Weaponsui.displayWeaponGroup("katana", ATT.Weaponsui.groupedWeapons.Katanas)
    ATT.Weaponsui.displayWeaponGroup("katana_quest", ATT.Weaponsui.groupedWeapons.Katanas_quest)
  end
  if ATT.Weaponsui.showKnives then
    ATT.Weaponsui.displayWeaponGroup("knive", ATT.Weaponsui.groupedWeapons.Knives)
    ATT.Weaponsui.displayWeaponGroup("knive_quest", ATT.Weaponsui.groupedWeapons.Knives_quest)
  end
  if ATT.Weaponsui.showMachetes then
    ATT.Weaponsui.displayWeaponGroup("machete", ATT.Weaponsui.groupedWeapons.Machetes)
  end
  if ATT.Weaponsui.showSwords then
    ATT.Weaponsui.displayWeaponGroup("sword", ATT.Weaponsui.groupedWeapons.Swords)
  end
  if ATT.Weaponsui.showHammers then
    ATT.Weaponsui.displayWeaponGroup("hammer", ATT.Weaponsui.groupedWeapons.Hammers)
    ATT.Weaponsui.displayWeaponGroup("hammer_quest", ATT.Weaponsui.groupedWeapons.Hammers_quest)
  end
  if ATT.Weaponsui.showOneHandedClubs then
    ATT.Weaponsui.displayWeaponGroup("onehandedclub", ATT.Weaponsui.groupedWeapons.OneHandedClubs)
    ATT.Weaponsui.displayWeaponGroup("onehandedclub_quest", ATT.Weaponsui.groupedWeapons.OneHandedClubs_quest)
  end
  if ATT.Weaponsui.showTwoHandedClubs then
    ATT.Weaponsui.displayWeaponGroup("twohandedclub", ATT.Weaponsui.groupedWeapons.TwoHandedClubs)
    ATT.Weaponsui.displayWeaponGroup("twohandedclub_quest", ATT.Weaponsui.groupedWeapons.TwoHandedClubs_quest)
  end
end
function ATT.DrawUIWeaponslistPhantomLiberty()
    if ATT.Weaponsui.showhandguns then
      ATT.Weaponsui.displayWeaponGroup("handguns_liberty", ATT.Weaponsui.groupedWeapons.Handguns_liberty)
      ATT.Weaponsui.displayWeaponGroup("handguns_quest_liberty", ATT.Weaponsui.groupedWeapons.Handguns_quest_liberty)
    end
    if ATT.Weaponsui.showrevolvers then
      ATT.Weaponsui.displayWeaponGroup("revolvers_liberty", ATT.Weaponsui.groupedWeapons.Revolvers_liberty)
      ATT.Weaponsui.displayWeaponGroup("revolvers_quest_liberty", ATT.Weaponsui.groupedWeapons.Revolvers_quest_liberty)
    end
    if ATT.Weaponsui.showassault_rifles then
      ATT.Weaponsui.displayWeaponGroup("assault_rifle_liberty", ATT.Weaponsui.groupedWeapons.AssaultRifles_liberty)
      ATT.Weaponsui.displayWeaponGroup("assault_rifle_quest_liberty", ATT.Weaponsui.groupedWeapons.AssaultRifles_quest_liberty)
    end
    if ATT.Weaponsui.showSniperRifles then
      ATT.Weaponsui.displayWeaponGroup("sniper_rifle_liberty", ATT.Weaponsui.groupedWeapons.SniperRifles_liberty)
      ATT.Weaponsui.displayWeaponGroup("sniper_rifle_quest_liberty", ATT.Weaponsui.groupedWeapons.SniperRifles_quest_liberty)
    end
    if ATT.Weaponsui.showPrecisionRifles then
      ATT.Weaponsui.displayWeaponGroup("precision_rifle_liberty", ATT.Weaponsui.groupedWeapons.PrecisionRifles_liberty)
    end
    if ATT.Weaponsui.showShotguns then
      ATT.Weaponsui.displayWeaponGroup("shotgun_liberty", ATT.Weaponsui.groupedWeapons.Shotguns_liberty)
      ATT.Weaponsui.displayWeaponGroup("shotgun_quest_liberty", ATT.Weaponsui.groupedWeapons.Shotguns_quest_liberty)
    end
    if ATT.Weaponsui.showSmgs then
      ATT.Weaponsui.displayWeaponGroup("smg_liberty", ATT.Weaponsui.groupedWeapons.Smgs_liberty)
      ATT.Weaponsui.displayWeaponGroup("smg_quest_liberty", ATT.Weaponsui.groupedWeapons.Smgs_quest_liberty)
    end
    if ATT.Weaponsui.showHmgs then
      ATT.Weaponsui.displayWeaponGroup("hmg_liberty", ATT.Weaponsui.groupedWeapons.Hmgs_liberty)
      ATT.Weaponsui.displayWeaponGroup("hmg_quest_liberty", ATT.Weaponsui.groupedWeapons.Hmgs_quest_liberty)
    end
    -- if ATT.Weaponsui.showGrenades then
    --   ATT.Weaponsui.displayWeaponGroup("grenade", ATT.Weaponsui.groupedWeapons.Grenades)
    --   ATT.Weaponsui.displayWeaponGroup("grenade_quest", ATT.Weaponsui.groupedWeapons.Grenades_quest)
    -- end
    if ATT.Weaponsui.showAxes then
      ATT.Weaponsui.displayWeaponGroup("axe_liberty", ATT.Weaponsui.groupedWeapons.Axes_liberty)
      ATT.Weaponsui.displayWeaponGroup("axe_quest_liberty", ATT.Weaponsui.groupedWeapons.Axes_quest_liberty)
    end
    if ATT.Weaponsui.showChainswords then
      ATT.Weaponsui.displayWeaponGroup("chainsword_liberty", ATT.Weaponsui.groupedWeapons.Chainswords_liberty)
    end
    -- if ATT.Weaponsui.showKatanas then
    --   ATT.Weaponsui.displayWeaponGroup("katana", ATT.Weaponsui.groupedWeapons.Katanas)
    --   ATT.Weaponsui.displayWeaponGroup("katana_quest", ATT.Weaponsui.groupedWeapons.Katanas_quest)
    -- end
    if ATT.Weaponsui.showKnives then
      ATT.Weaponsui.displayWeaponGroup("knive_quest_liberty", ATT.Weaponsui.groupedWeapons.Knives_quest_liberty)
    end
    if ATT.Weaponsui.showMachetes then
      ATT.Weaponsui.displayWeaponGroup("machete_liberty", ATT.Weaponsui.groupedWeapons.Machetes_liberty)
      ATT.Weaponsui.displayWeaponGroup("machete_quest_liberty", ATT.Weaponsui.groupedWeapons.Machetes_quest_liberty)
    end
    -- if ATT.Weaponsui.showSwords then
    --   ATT.Weaponsui.displayWeaponGroup("sword", ATT.Weaponsui.groupedWeapons.Swords)
    -- end
    -- if ATT.Weaponsui.showHammers then
    --   ATT.Weaponsui.displayWeaponGroup("hammer", ATT.Weaponsui.groupedWeapons.Hammers)
    --   ATT.Weaponsui.displayWeaponGroup("hammer_quest", ATT.Weaponsui.groupedWeapons.Hammers_quest)
    -- end
    if ATT.Weaponsui.showOneHandedClubs then
      ATT.Weaponsui.displayWeaponGroup("onehandedclub_quest_liberty", ATT.Weaponsui.groupedWeapons.OneHandedClubs_quest_liberty)
    end
    if ATT.Weaponsui.showTwoHandedClubs then
      ATT.Weaponsui.displayWeaponGroup("twohandedclub_liberty", ATT.Weaponsui.groupedWeapons.TwoHandedClubs_liberty)
      ATT.Weaponsui.displayWeaponGroup("twohandedclub_quest_liberty", ATT.Weaponsui.groupedWeapons.TwoHandedClubs_quest_liberty)
    end
end
function ATT.DrawUICyberwareslistCyberpunk2077()
  if ATT.Cyberwaresui.showArms then
    ATT.Cyberwaresui.displayWeaponGroup("arm", ATT.Cyberwaresui.groupedCyberwares.Arms)
  end
  if ATT.Cyberwaresui.showcirculatorySystems then
    ATT.Cyberwaresui.displayWeaponGroup("circulatorysystem", ATT.Cyberwaresui.groupedCyberwares.circulatorySystems)
  end
  if ATT.Cyberwaresui.showFacesCY then
    ATT.Cyberwaresui.displayWeaponGroup("faceCY", ATT.Cyberwaresui.groupedCyberwares.FacesCY)
  end
  if ATT.Cyberwaresui.showFrontalCortexs then
    ATT.Cyberwaresui.displayWeaponGroup("frontalcortex", ATT.Cyberwaresui.groupedCyberwares.FrontalCortexs)
  end
  if ATT.Cyberwaresui.showHandsCY then
    ATT.Cyberwaresui.displayWeaponGroup("handCY", ATT.Cyberwaresui.groupedCyberwares.HandsCY)
  end
  if ATT.Cyberwaresui.showIntegumentarSystems then
    ATT.Cyberwaresui.displayWeaponGroup("integumentarysystem", ATT.Cyberwaresui.groupedCyberwares.IntegumentarSystems)
  end
  if ATT.Cyberwaresui.showLegsCY then
    ATT.Cyberwaresui.displayWeaponGroup("legCY", ATT.Cyberwaresui.groupedCyberwares.LegsCY)
  end
  if ATT.Cyberwaresui.showNervousSystems then
    ATT.Cyberwaresui.displayWeaponGroup("nervoussystem", ATT.Cyberwaresui.groupedCyberwares.NervousSystems)
  end
  if ATT.Cyberwaresui.showOperatingSystems then
    ATT.Cyberwaresui.displayWeaponGroup("operatingsystem", ATT.Cyberwaresui.groupedCyberwares.OperatingSystems)
  end
  if ATT.Cyberwaresui.showSkeletons then
    ATT.Cyberwaresui.displayWeaponGroup("skeleton", ATT.Cyberwaresui.groupedCyberwares.Skeletons)
  end
end
function ATT.DrawUICyberwareslistPhantomLiberty()
  if ATT.Cyberwaresui.showArms then
    ATT.Cyberwaresui.displayWeaponGroup("arm", ATT.Cyberwaresui.groupedCyberwares.Arms_liberty)
  end
  if ATT.Cyberwaresui.showcirculatorySystems then
    ATT.Cyberwaresui.displayWeaponGroup("circulatorysystem", ATT.Cyberwaresui.groupedCyberwares.circulatorySystems_liberty)
  end
  if ATT.Cyberwaresui.showFacesCY then
    ATT.Cyberwaresui.displayWeaponGroup("faceCY", ATT.Cyberwaresui.groupedCyberwares.FacesCY_liberty)
  end
  if ATT.Cyberwaresui.showFrontalCortexs then
    ATT.Cyberwaresui.displayWeaponGroup("frontalcortex", ATT.Cyberwaresui.groupedCyberwares.FrontalCortexs_liberty)
  end
  if ATT.Cyberwaresui.showHandsCY then
    ATT.Cyberwaresui.displayWeaponGroup("handCY", ATT.Cyberwaresui.groupedCyberwares.HandsCY_liberty)
  end
  if ATT.Cyberwaresui.showIntegumentarSystems then
    ATT.Cyberwaresui.displayWeaponGroup("integumentarysystem", ATT.Cyberwaresui.groupedCyberwares.IntegumentarSystems_liberty)
  end
  if ATT.Cyberwaresui.showLegsCY then
    ATT.Cyberwaresui.displayWeaponGroup("legCY", ATT.Cyberwaresui.groupedCyberwares.LegsCY_liberty)
  end
  if ATT.Cyberwaresui.showNervousSystems then
    ATT.Cyberwaresui.displayWeaponGroup("nervoussystem", ATT.Cyberwaresui.groupedCyberwares.NervousSystems_liberty)
  end
  if ATT.Cyberwaresui.showOperatingSystems then
    ATT.Cyberwaresui.displayWeaponGroup("operatingsystem", ATT.Cyberwaresui.groupedCyberwares.OperatingSystems_liberty)
  end
  if ATT.Cyberwaresui.showSkeletons then
    ATT.Cyberwaresui.displayWeaponGroup("skeleton", ATT.Cyberwaresui.groupedCyberwares.Skeletons_liberty)
  end
end
function ATT.DrawUIQuickhackslistCyberpunk2077()
  if ATT.Quickhacksui.showcombat then
    ATT.Quickhacksui.displayWeaponGroup("combat", ATT.Quickhacksui.groupedQuickhacks.combat)
  end
  if ATT.Quickhacksui.showcontrol then
    ATT.Quickhacksui.displayWeaponGroup("control", ATT.Quickhacksui.groupedQuickhacks.control)
  end
  if ATT.Quickhacksui.showcovert then
    ATT.Quickhacksui.displayWeaponGroup("covert", ATT.Quickhacksui.groupedQuickhacks.covert)
  end
  if ATT.Quickhacksui.showultimate then
    ATT.Quickhacksui.displayWeaponGroup("ultimate", ATT.Quickhacksui.groupedQuickhacks.ultimate)
  end
end
function ATT.DrawUIMisclistCyberpunk2077()
  if ATT.Misc.showcrafting then
    ATT.Misc.displayWeaponGroup("CRAFTING_COMPONENTS", ATT.Misc.groupedmisc.CRAFTING_COMPONENTS)
  end
  if ATT.Misc.showbuff then
    ATT.Misc.displayWeaponGroup("BUFF", ATT.Misc.groupedmisc.BUFF)
  end
  if ATT.Misc.showmeds then
    ATT.Misc.displayWeaponGroup("Medication", ATT.Misc.groupedmisc.Medication)
  end
  if ATT.Misc.showalcohol then
    ATT.Misc.displayWeaponGroup("ALCOHOL", ATT.Misc.groupedmisc.ALCOHOL)
  end
  if ATT.Misc.showdrink then
    ATT.Misc.displayWeaponGroup("DRINK", ATT.Misc.groupedmisc.DRINK)
  end
  if ATT.Misc.showfood then
    ATT.Misc.displayWeaponGroup("FOOD", ATT.Misc.groupedmisc.FOOD)
  end
end
function ATT.DrawUIModlistCyberpunk2077()
  if ATT.Modsui.showARSMGLMGMOD then
    ATT.Modsui.displayWeaponGroup("ARSMGLMGMOD",  ATT.Modsui.groupedMods.ARSMGLMGMOD)
  end
  if ATT.Modsui.showBLADEMOD then
    ATT.Modsui.displayWeaponGroup("BLADEMODS",  ATT.Modsui.groupedMods.BLADEMOD)
  end
  if ATT.Modsui.showBLUNTWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("BLUNTWEAPONMODS",  ATT.Modsui.groupedMods.BLUNTWEAPONMOD)
  end
  if ATT.Modsui.showMELEEWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("MELEEWEAPONMODS",  ATT.Modsui.groupedMods.MELEEWEAPONMOD)
  end
  if ATT.Modsui.showMUZZLEASSAULTRIFLESMG then
    ATT.Modsui.displayWeaponGroup("MUZZLEASSAULTRIFLESMG",  ATT.Modsui.groupedMods.MUZZLEASSAULTRIFLESMG)
  end
  if ATT.Modsui.showMUZZLEHANDGUN then
    ATT.Modsui.displayWeaponGroup("MUZZLEHANDGUN",  ATT.Modsui.groupedMods.MUZZLEHANDGUN)
  end
  if ATT.Modsui.showPISTOLREVOLVERMOD then
    ATT.Modsui.displayWeaponGroup("PISTOLREVOLVERMOD",  ATT.Modsui.groupedMods.PISTOLREVOLVERMOD)    
  end
  if ATT.Modsui.showPOWERWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("POWERWEAPONMOD",  ATT.Modsui.groupedMods.POWERWEAPONMOD)
  end
  if ATT.Modsui.showSCOPEGENERICLONG then
    ATT.Modsui.displayWeaponGroup("SCOPEGENERICLONG",  ATT.Modsui.groupedMods.SCOPEGENERICLONG)
  end
  if ATT.Modsui.showSCOPEGENERICSHORT then
    ATT.Modsui.displayWeaponGroup("SCOPEGENERICSHORT",  ATT.Modsui.groupedMods.SCOPEGENERICSHORT)  
  end
  if ATT.Modsui.showSCOPETECHSNIPER then
    ATT.Modsui.displayWeaponGroup("SCOPETECHSNIPER",  ATT.Modsui.groupedMods.SCOPETECHSNIPER)
  end
  if ATT.Modsui.showSHOTGUNMOD then
    ATT.Modsui.displayWeaponGroup("SHOTGUNMOD",  ATT.Modsui.groupedMods.SHOTGUNMOD)
  end
  if ATT.Modsui.showSILENCER then
    ATT.Modsui.displayWeaponGroup("SILENCER",  ATT.Modsui.groupedMods.SILENCER)
  end
  if ATT.Modsui.showSMARTWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("SMARTWEAPONMOD",  ATT.Modsui.groupedMods.SMARTWEAPONMOD)
  end
  if ATT.Modsui.showSNIPERPRECRIFLEMOD then
    ATT.Modsui.displayWeaponGroup("SNIPERPRECRIFLEMOD",  ATT.Modsui.groupedMods.SNIPERPRECRIFLEMOD) 
  end
  if ATT.Modsui.showTECHWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("TECHWEAPONMOD",  ATT.Modsui.groupedMods.TECHWEAPONMOD)   
  end
  if ATT.Modsui.showTHROWABLEWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("THROWABLEWEAPONMOD",  ATT.Modsui.groupedMods.THROWABLEWEAPONMOD) 
  end
  if ATT.Modsui.showWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("WEAPONMOD",  ATT.Modsui.groupedMods.WEAPONMOD) 
  end
end
function ATT.DrawUIModlistPhantomLiberty()
  if ATT.Modsui.showPOWERWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("POWERWEAPONMOD_liberty", ATT.Modsui.groupedMods.POWERWEAPONMOD_liberty)
  end
  if ATT.Modsui.showSMARTWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("SMARTWEAPONMOD_liberty", ATT.Modsui.groupedMods.SMARTWEAPONMOD_liberty)
  end
  if ATT.Modsui.showTECHWEAPONMOD then
    ATT.Modsui.displayWeaponGroup("TECHWEAPONMOD_liberty", ATT.Modsui.groupedMods.TECHWEAPONMOD_liberty)
  end
end
function ATT.DrawUIClotheslistCyberpunk2077()
  if ATT.Clothesui.showHeads_northhside then 
    ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_northhside)
    end
    if ATT.Clothesui.showFaces_northhside then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_northhside)
    end
    if ATT.Clothesui.showFeets_northhside then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_northhside)
    end
    if ATT.Clothesui.showInnerTorsos_northhside then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_northhside)
    end
    if ATT.Clothesui.showLegss_northhside then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_northhside)
    end
    if ATT.Clothesui.showOuterTorsos_northhside then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_northhside)
  end
  if ATT.Clothesui.showHeads_kabuki then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_kabuki)
    end
    if ATT.Clothesui.showFaces_kabuki then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_kabuki)
    end
    if ATT.Clothesui.showFeets_kabuki then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_kabuki)
    end
    if ATT.Clothesui.showInnerTorsos_kabuki then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_kabuki)
    end
    if ATT.Clothesui.showLegss_kabuki then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_kabuki)
    end
    if ATT.Clothesui.showOuterTorsos_kabuki then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_kabuki)
  end
  if ATT.Clothesui.showHeads_little_china then 
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_little_china)
    end
    if ATT.Clothesui.showFaces_little_china then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_little_china)
    end
    if ATT.Clothesui.showFeets_little_china then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_little_china)
    end
    if ATT.Clothesui.showInnerTorsos_little_china then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_little_china)
    end
    if ATT.Clothesui.showLegss_little_china then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_little_china)
    end
    if ATT.Clothesui.showOuterTorsos_little_china then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_little_china)
  end
  if ATT.Clothesui.showHeads_arroyo then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_arroyo)
    end
    if ATT.Clothesui.showFaces_arroyo then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_arroyo)
    end
    if ATT.Clothesui.showFeets_arroyo then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_arroyo)
    end
    if ATT.Clothesui.showInnerTorsos_arroyo then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_arroyo)
    end
    if ATT.Clothesui.showLegss_arroyo then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_arroyo)
    end
    if ATT.Clothesui.showOuterTorsos_arroyo then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_arroyo)
  end
  if ATT.Clothesui.showHeads_rancho_coronado then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_rancho_coronado)
    end
    if ATT.Clothesui.showFeets_rancho_coronado then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_rancho_coronado)
    end
    if ATT.Clothesui.showInnerTorsos_rancho_coronado then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_rancho_coronado)
    end
    if ATT.Clothesui.showLegss_rancho_coronado then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_rancho_coronado)
    end
    if ATT.Clothesui.showOuterTorsos_rancho_coronado then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_rancho_coronado)
  end
  if ATT.Clothesui.showHeads_Japantown then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_Japantown)
    end
    if ATT.Clothesui.showFaces_Japantown then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_Japantown)
    end
    if ATT.Clothesui.showFeets_Japantown then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_Japantown)
    end
    if ATT.Clothesui.showInnerTorsos_Japantown then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_Japantown)
    end
    if ATT.Clothesui.showLegss_Japantown then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_Japantown)
    end
    if ATT.Clothesui.showOuterTorsos_Japantown then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_Japantown)
  end
  if ATT.Clothesui.showHeads_Charter_Hill then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_Charter_Hill)
    end
    if ATT.Clothesui.showFaces_Charter_Hill then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_Charter_Hill)
    end
    if ATT.Clothesui.showFeets_Charter_Hill then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_Charter_Hill)
    end
    if ATT.Clothesui.showInnerTorsos_Charter_Hill then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_Charter_Hill)
    end
    if ATT.Clothesui.showLegss_Charter_Hill then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_Charter_Hill)
    end
    if ATT.Clothesui.showOuterTorsos_Charter_Hill then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_Charter_Hill)
  end
  if ATT.Clothesui.showHeads_Zane_Jagger then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_Zane_Jagger)
    end
    if ATT.Clothesui.showFaces_Zane_Jagger then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_Zane_Jagger)
    end
    if ATT.Clothesui.showFeets_Zane_Jagger then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_Zane_Jagger)
    end
    if ATT.Clothesui.showInnerTorsos_Zane_Jagger then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_Zane_Jagger)
    end
    if ATT.Clothesui.showLegss_Zane_Jagger then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_Zane_Jagger)
    end
    if ATT.Clothesui.showOuterTorsos_Zane_Jagger then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_Zane_Jagger)
  end
  if ATT.Clothesui.showHeads_corpo_plaza then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_corpo_plaza)
    end
    if ATT.Clothesui.showFaces_corpo_plaza then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_corpo_plaza)
    end
    if ATT.Clothesui.showFeets_corpo_plaza then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_corpo_plaza)
    end
    if ATT.Clothesui.showInnerTorsos_corpo_plaza then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_corpo_plaza)
    end
    if ATT.Clothesui.showLegss_corpo_plaza then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_corpo_plaza)
    end
    if ATT.Clothesui.showOuterTorsos_corpo_plaza then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_corpo_plaza)
  end
  if ATT.Clothesui.showHeads_red_peaks then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_red_peaks)
    end
    if ATT.Clothesui.showFaces_red_peaks then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_red_peaks)
    end
    if ATT.Clothesui.showFeets_red_peaks then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_red_peaks)
    end
    if ATT.Clothesui.showInnerTorsos_red_peaks then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_red_peaks)
    end
    if ATT.Clothesui.showLegss_red_peaks then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_red_peaks)
    end
    if ATT.Clothesui.showOuterTorsos_red_peaks then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_red_peaks)
  end
  if ATT.Clothesui.showHeads_Wellsprings then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_Wellsprings)
    end
    if ATT.Clothesui.showFaces_Wellsprings then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_Wellsprings)
    end
    if ATT.Clothesui.showFeets_Wellsprings then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_Wellsprings)
    end
    if ATT.Clothesui.showInnerTorsos_Wellsprings then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_Wellsprings)
    end
    if ATT.Clothesui.showLegss_Wellsprings then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_Wellsprings)
    end
    if ATT.Clothesui.showOuterTorsos_Wellsprings then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_Wellsprings)
  end
  if ATT.Clothesui.showHeads_west_wind_estate then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_west_wind_estate)
    end
    if ATT.Clothesui.showFaces_west_wind_estate then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_west_wind_estate)
    end
    if ATT.Clothesui.showFeets_west_wind_estate then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_west_wind_estate)
    end
    if ATT.Clothesui.showInnerTorsos_west_wind_estate then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_west_wind_estate)
    end
    if ATT.Clothesui.showLegss_west_wind_estate then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_west_wind_estate)
    end
    if ATT.Clothesui.showOuterTorsos_west_wind_estate then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_west_wind_estate)
  end
  if ATT.Clothesui.showHeads_satoshi_ueno then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_satoshi_ueno)
    end
    if ATT.Clothesui.showFaces_satoshi_ueno then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_satoshi_ueno)
    end
    if ATT.Clothesui.showFeets_satoshi_ueno then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_satoshi_ueno)
    end
    if ATT.Clothesui.showInnerTorsos_satoshi_ueno then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_satoshi_ueno)
    end
    if ATT.Clothesui.showLegss_satoshi_ueno then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_satoshi_ueno)
    end
    if ATT.Clothesui.showOuterTorsos_satoshi_ueno then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_satoshi_ueno)
  end
  if ATT.Clothesui.showHeads_david_walker then
      ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Heads_david_walker)
    end
    if ATT.Clothesui.showFaces_david_walker then
      ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_david_walker)
    end
    if ATT.Clothesui.showFeets_david_walker then
      ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_david_walker)
    end
    if ATT.Clothesui.showInnerTorsos_david_walker then
      ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_david_walker)
    end
    if ATT.Clothesui.showLegss_david_walker then
      ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_david_walker)
    end
    if ATT.Clothesui.showOuterTorsos_david_walker then
      ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_david_walker)
  end
  if ATT.Clothesui.showHaeds_other then
    ATT.Clothesui.displayWeaponGroup("other", ATT.Clothesui.groupedclothes.Haeds_other)
  end
  if ATT.Clothesui.showJohnny_Silverhand_set then
    ATT.Clothesui.displayWeaponGroup("Johnny Silvehand", ATT.Clothesui.groupedclothes.Johnny_Silverhand_set)
  end
  if ATT.Clothesui.showV_The_Rescue_set then
    ATT.Clothesui.displayWeaponGroup("the rescue", ATT.Clothesui.groupedclothes.V_The_Rescue_set)
  end
  if ATT.Clothesui.showYorinubo_set then
    ATT.Clothesui.displayWeaponGroup("yorinubo", ATT.Clothesui.groupedclothes.Yorinubo_set)
  end
  if ATT.Clothesui.showMaxTac_set then
    ATT.Clothesui.displayWeaponGroup("max tac", ATT.Clothesui.groupedclothes.MaxTac_set)
  end
  if ATT.Clothesui.showNUS_Agent_set then
    ATT.Clothesui.displayWeaponGroup("nus agent", ATT.Clothesui.groupedclothes.NUS_Agent_set)
  end
  if ATT.Clothesui.showThe_Star_set then
    ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.The_Star_set)
  end
  if ATT.Clothesui.showThe_sun_set then
    ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.The_sun_set)
  end
  if ATT.Clothesui.showTemperance_set then
    ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Temperance_set)
  end
  if ATT.Clothesui.showCop_set then
    ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.Cop_set)
  end
  if ATT.Clothesui.showCorporate_set then
    ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Corporate_set)
  end
  if ATT.Clothesui.showFixer_set then
    ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.Fixer_set)
  end
  if ATT.Clothesui.showMedia_set then
    ATT.Clothesui.displayWeaponGroup("heads", ATT.Clothesui.groupedclothes.Media_set)
  end
  if ATT.Clothesui.showNetrunner_set then
    ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Netrunner_set)
  end
  if ATT.Clothesui.showNomad_set then
    ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Nomad_set)
  end
  if ATT.Clothesui.showRocker_set then
    ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.Rocker_set)
  end
  if ATT.Clothesui.showSolo_set then
    ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Solo_set)
  end
  if ATT.Clothesui.showTechie_set then
    ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.Techie_set)
  end
  if ATT.Clothesui.showFaces_kabuki then
    ATT.Clothesui.displayWeaponGroup("faces", ATT.Clothesui.groupedclothes.Faces_kabuki)
  end
  if ATT.Clothesui.showFeets_kabuki then
    ATT.Clothesui.displayWeaponGroup("feets", ATT.Clothesui.groupedclothes.Feets_kabuki)
  end
  if ATT.Clothesui.showInnerTorsos_kabuki then
    ATT.Clothesui.displayWeaponGroup("InnerTorsos", ATT.Clothesui.groupedclothes.InnerTorsos_kabuki)
  end
  if ATT.Clothesui.showLegss_kabuki then
    ATT.Clothesui.displayWeaponGroup("Legss", ATT.Clothesui.groupedclothes.Legss_kabuki)
  end
  if ATT.Clothesui.showOuterTorsos_kabuki then
    ATT.Clothesui.displayWeaponGroup("OuterTorsos", ATT.Clothesui.groupedclothes.OuterTorsos_kabuki)
  end

end
function ATT.DrawUIClotheslistnomadCyberpunk2077()
  if ATT.Clothesui.showV_nomad_set then
    ATT.Clothesui.displayWeaponGroup("nomad", ATT.Clothesui.groupedclothes.V_nomad_set)
  end
end
function ATT.DrawUIClothesliststreetkidCyberpunk2077()
  if ATT.Clothesui.showV_streetkid_set then
    ATT.Clothesui.displayWeaponGroup("streetkid", ATT.Clothesui.groupedclothes.V_streetkid_set)
  end
end
function ATT.DrawUIClotheslistcorpoCyberpunk2077()
  if ATT.Clothesui.showV_corpo_set then
    ATT.Clothesui.displayWeaponGroup("corpo", ATT.Clothesui.groupedclothes.V_corpo_set)
  end
end

function ATT.DrawUISettings()
  if ImGui.CollapsingHeader("Option") then
    ImGui.Indent(20)
      ATT.general.showuigeneral()
      ATT.changelog.showuichangelog()
      ATT.information.showuiinformation()
    ImGui.Unindent(20)
  end
end