local nomad = {}
-- ATT.translations = require("trad/Interface")
local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
end
function nomad.OnDrawProfil()
        ImGui.Text("Profil: Nomad")
        -- ImGui.SameLine()
        -- if ImGui.Button(T("ATT_CHOICE")) then
        --     ATT.currentProfile = "menu"  -- 🔥 Retourne au menu principal
        -- end
end

return nomad
