local information = {}

ATT.translations            = require("trad/translations").interface
ATT.selectedLanguage        = "en"
local function T(key) return ATT.T(key) end

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
    setCategory(information, T("ATT_INFORMATION"))
  end
end
return information