local information = {}
-- local translations = require("trad/Interface") -- Charge les traductions
-- local Weaponsui = require("weaponsui")

ATT.translations            = require("trad/Interface")
ATT.selectedLanguage        = "en"
local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
end

function information.drawinformationui()
    local childWindow10Width, childWindow10Height = ImGui.GetContentRegionAvail()
    if ImGui.BeginChild("Child Window 10", 1 * childWindow10Width, 0, false) then
        ImGui.Text("Version: 2.3")
          ImGui.Spacing()
          ImGui.Separator()
          ImGui.Spacing()
          ImGui.Text(T("ATT_CREDITS"))
          ImGui.Spacing()
          ImGui.Text(T("ATT_GRATITUDE"))
          ImGui.EndChild()
      ImGui.EndChild()
    end   
end
function information.showuiinformation()
  if ImGui.Button(T("ATT_INFORMATION"), -1, 0) then
    setActive("information", "showinformationUI")
  end
end
return information