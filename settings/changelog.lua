local changelog = {}
ATT.translations            = require("trad/Interface")
-- local translationstest = require("trad/tradtest") -- Charge les traductions
ATT.selectedLanguage        = "en"

local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
end
function changelog.drawchangelogui()
    local childWindow10Width, childWindow10Height = ImGui.GetContentRegionAvail()
    if ImGui.BeginChild("Child Window 10", 1 * childWindow10Width, 0, false) then

      -- function changelog.drawchangelogui()
        local updates = require("settings/update") -- charge le fichier update.lua
      
        for _, update in ipairs(updates) do
          if ImGui.CollapsingHeader(string.format("Version %s - %s", update.version, update.date)) then
            ImGui.Indent(10)
            for _, change in ipairs(update.changes) do
              ImGui.BulletText(change)
            end
            ImGui.Unindent(10)
          end
        end
      -- end
      --   ImGui.Text("Version: 2.0")
                  
      --             ImGui.Separator()
                  
      --             ImGui.Spacing()
      -- if ImGui.BeginTabBar("##TabBar1") then
      --   if ImGui.BeginTabItem("ATT_GENERAL") then
      --       ImGui.Spacing()
      --       ImGui.Spacing()
      --       ImGui.Spacing()
              
      --       ImGui.Spacing()
      --       ImGui.Spacing()
      --       ImGui.Spacing()

      --       ImGui.EndTabItem()
      --     end
          
        
      --   ImGui.EndTabBar()
      -- end
      ImGui.EndChild()
    end   
    
end

function changelog.showuichangelog()
  if ImGui.Button(T("ATT_CHANGELOG"), -1, 0) then
    setActive("changelog", "showchangelogUI")
  end
end
return changelog
