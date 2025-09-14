local Profil = {}

function Profil.DrawMenu()
        local windowWidth = ImGui.GetContentRegionAvail()
    local Text1Width = ImGui.CalcTextSize("EXCLUSIVE ITEMS") 
    local totalWidth = Text1Width 
    ImGui.SetCursorPosX((windowWidth - totalWidth) / 2)
          ImGui.Text("EXCLUSIVE ITEMS")
    
      local nomadWidth, nomadHeight = ImGui.GetContentRegionAvail()
      if ImGui.BeginChild("nomad", 0.3 * nomadWidth, 0.9 * nomadHeight, true) then
        
        ImGui.Dummy(100, 100)
        if ImGui.Button("nomad", -1, 0) then
          ATT.currentProfile = "nomad"  -- 🔥 Change le profil actif

        end
        if ImGui.TreeNodeEx("vehicles", ImGuiTreeNodeFlags.DefaultOpen) then
          ImGui.BulletText("Thorton Galena GA40xt 'Rattler'")
          ImGui.BulletText("Jackie's Tuned ARCH")
          ImGui.TreePop()
        end
        if ImGui.TreeNodeEx("Clothes", ImGuiTreeNodeFlags.DefaultOpen) then
          ImGui.BulletText("set : nomad")
          ImGui.TreePop()
        end
        ImGui.EndChild()
      end
      
      ImGui.SameLine()
      
      local streetkidWidth, streetkidHeight = ImGui.GetContentRegionAvail()
      if ImGui.BeginChild("streetkid", 0.5 * streetkidWidth, 0.9 *streetkidHeight, true) then
        ImGui.Dummy(100, 100)
        if ImGui.Button("streetkid", -1, 0) then
          ATT.currentProfile = "att1"  -- 🔥 Change le profil actif

          -- TODO
        end
        if ImGui.TreeNodeEx("Clothes", ImGuiTreeNodeFlags.DefaultOpen) then
          ImGui.BulletText("set : streetkid")
          ImGui.BulletText("SEMURAI crystaljock bomber")

          ImGui.TreePop()
        end
        ImGui.EndChild()
      end
      ImGui.SameLine()
      
      local corpoWidth, corpoHeight = ImGui.GetContentRegionAvail()
      if ImGui.BeginChild("corpo", 1 * corpoWidth, 0.9 * corpoHeight, true) then
        ImGui.Dummy(100, 100)
        if ImGui.Button("corpo", -1, 0) then
          ATT.currentProfile = "att2"  -- 🔥 Change le profil actif

          -- TODO
        end
        if ImGui.TreeNodeEx("Clothes", ImGuiTreeNodeFlags.DefaultOpen) then
          ImGui.BulletText("set : corpo")
          ImGui.TreePop()
        end
        if ImGui.TreeNodeEx("Weapons", ImGuiTreeNodeFlags.DefaultOpen) then
          ImGui.BulletText("Apparition")
          ImGui.SameLine() 
          
        end
        ImGui.EndChild()
      end
      if ImGui.BeginChild("Child Window 24", 0, 0, true,  ImGuiWindowFlags.NoScrollbar) then
        -- ImGui.AlignTextToFramePadding()
        ImGui.Text("The-Destrutor95")
        ImGui.SameLine() 
        ImGui.SetCursorPosX(ImGui.GetContentRegionAvail() - ImGui.CalcTextSize("version 2.3")+110)  
        -- ImGui.AlignTextToFramePadding()
        ImGui.Text("version 2.3")
    
        ImGui.EndChild()
    end
    
     

end

return Profil
