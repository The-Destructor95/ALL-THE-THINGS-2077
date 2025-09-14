local general = {}
-- local translations = require("trad/Interface") -- Charge les traductions
showEnglish = true
ATT.translations            = require("trad/Interface")
-- local translationstest = require("trad/tradtest") -- Charge les traductions
ATT.selectedLanguage        = "en"

local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
end
general.modes = { "toast", "hud" }
general.currentMode = ATT.notificationMode or "toast"

general.currentIndex = 1
for i, mode in ipairs(general.modes) do
    if mode == general.currentMode then
        general.currentIndex = i
        break
    end
end
function general.drawgeneralui()
  local childWindow10Width, childWindow10Height = ImGui.GetContentRegionAvail()
  if ImGui.BeginChild("Child Window 10", childWindow10Width, 0, false) then
      ImGui.Text("Version: 2.3")
      ImGui.Separator()
      ImGui.Spacing()

      if ImGui.BeginTabBar("##TabBar1") then
          if ImGui.BeginTabItem(T("ATT_GENERAL")) then
            ImGui.Spacing()
            ImGui.Text(T("ATT_CURRENT_LANGUAGE") .. ATT.selectedLanguage)
            ImGui.Spacing()
            
              if ImGui.Button(T("ATT_ENGLISH")) then
                  ATT.selectedLanguage = "en"
                  showEnglish = true
                  ATT.SaveSettings()
              end
            ImGui.SameLine()
              if ImGui.Button(T("ATT_TRAD")) then
                  ATT.selectedLanguage = "trad"
                  showEnglish = false
                  ATT.SaveSettings()
              end
            ImGui.Spacing()
            ImGui.Separator()
            ImGui.Spacing()
              if ImGui.Button(T("ATT_CHOICE")) then
                  ATT.currentProfile = "menu"
            end
           ImGui.EndTabItem()
          end
          if ImGui.BeginTabItem(T("ATT_FILTERS")) then
            ImGui.Spacing()
            ATT.hideOwnedItems = ImGui.Checkbox(T("ATT_HIDE_ITEMS"), ATT.hideOwnedItems)
            ImGui.Spacing()
            ATT.hideUnownedItems = ImGui.Checkbox(T("ATT_UNOWNED_ITEMS"), ATT.hideUnownedItems)
            ImGui.EndTabItem()
            if ATT.hideOwnedItems and ATT.hideUnownedItems then
              ATT.hideOwnedItems = false
              ATT.hideUnownedItems = false
              ATT.SaveSettings()
            end
          end
-- (          -- if ImGui.BeginTabItem(T("ATT_FILTERS")) then
          --   ImGui.Spacing()
          -- --  if ImGui.CollapsingHeader("Vehicules") then
          -- --   ImGui.Text(T("ATT_FILTERS_TEXT"))

          -- --  end
          --  ATT.hideOwnedItems = ImGui.Checkbox(T("ATT_HIDE_ITEMS"), ATT.hideOwnedItems)
          --  ImGui.Spacing()
          --  ATT.hideUnownedItems = ImGui.Checkbox(T("ATT_UNOWNED_ITEMS"), ATT.hideUnownedItems)
          --   ImGui.EndTabItem()
-- deUnownedItems)
          --   ImGui.EndTabItem()
          -- end
          -- if ImGui.BeginTabItem(T("ATT_NOTIFICATION")) then
          --   ImGui.Spacing()
          --     ATT.enableNotifications = ImGui.Checkbox(T("ATT_NOTIFICATION_DISABLE"), ATT.enableNotifications)
          --   ImGui.Spacing()
            
          --   -- ATT.expertMode = ImGui.Checkbox("Activer le mode expert (chaque ID)", ATT.expertMode)
            
          --   -- if ImGui.IsItemHovered() then
          --   --     ImGui.SetTooltip("Mode expert : une notification s'affichera pour chaque version d'un même objet.\nMode standard : une seule notification par nom d'objet.")
          --   -- end
            
          --   -- if ImGui.BeginCombo("Type de notification", general.modes[general.currentIndex]) then
          --   --   for i, mode in ipairs(general.modes) do
          --   --       local selected = (i == general.currentIndex)
          --   --       if ImGui.Selectable(mode, selected) then
          --   --           ATT.notificationMode = mode -- 🔥 Ici tu mets bien à jour
          --   --           general.currentIndex = i -- 🔥 Et ici tu MAJ aussi l'index sélectionné
          --   --           ATT.SaveSettings()
          --   --       end
          --   --       if selected then
          --   --           ImGui.SetItemDefaultFocus()
          --   --       end
          --   --   end
          --   -- ImGui.EndCombo()
          --   -- end
          -- ImGui.EndTabItem()
          -- end
      ImGui.EndTabBar()
      end
  ImGui.EndChild()
  end
end
function general.showuigeneral()
  if ImGui.Button("general", -1, 0) then
    setActive("general", "showGeneralUI")
  end
end

return general


