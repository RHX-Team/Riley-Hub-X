local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local notif = Notification.new("success", "Riley Hub X", "Riley Hub X Has Loaded")
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/test", true))()

local Window = Library:CreateWindow"Riley Hub X"

Window:AddFolder"Main"

Window:AddButton({text = "Infinite Ammo", flag = "button", callback = function() 
while wait() do
	game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
	game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
end
end})
Window:AddButton({text = "Rapid Fire", flag = "button", callback = function()
local replicationstorage = game.ReplicatedStorage

for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
   if v.Name == "Auto" then
       v.Value = true
   end
   if v.Name == "RecoilControl" then
       v.Value = 0
   end
   if v.Name == "MaxSpread" then
       v.Value = 0
   end
   if v.Name == "ReloadTime" then
      v.Value = 1
   end
   if v.Name == "FireRate" then
       v.Value = 0.05
   end
   if v.Name == "Crit" then
       v.Value = 20
   end
end
end})
Window:AddButton({text = "Silent Aim", flag = "button", callback = function()
function getplrsname() for i,v in pairs(game:GetChildren()) do if v.ClassName == "Players" then return v.Name end end end local players = getplrsname() local plr = game[players].LocalPlayer coroutine.resume(coroutine.create(function() while wait(1) do coroutine.resume(coroutine.create(function() for _,v in pairs(game[players]:GetPlayers()) do if v.Name ~= plr.Name and v.Character then v.Character.RightUpperLeg.CanCollide = false v.Character.RightUpperLeg.Transparency = 75 v.Character.RightUpperLeg.Size = Vector3.new(21,21,21) v.Character.LeftUpperLeg.CanCollide = false v.Character.LeftUpperLeg.Transparency = 75 v.Character.LeftUpperLeg.Size = Vector3.new(21,21,21) v.Character.HeadHB.CanCollide = false v.Character.HeadHB.Transparency = 75 v.Character.HeadHB.Size = Vector3.new(21,21,21) v.Character.HumanoidRootPart.CanCollide = false v.Character.HumanoidRootPart.Transparency = 75 v.Character.HumanoidRootPart.Size = Vector3.new(21,21,21) end end end)) end end))
end})
Window:AddButton({text = "RGB Gun", flag = "button", callback = function()
  local c = 1 function zigzag(X)  return math.acos(math.cos(X * math.pi)) / math.pi end game:GetService("RunService").RenderStepped:Connect(function()  if game.Workspace.Camera:FindFirstChild('Arms') then   for i,v in pairs(game.Workspace.Camera.Arms:GetDescendants()) do    if v.ClassName == 'MeshPart' then      v.Color = Color3.fromHSV(zigzag(c),1,1)     c = c + .0001    end   end  end end)
end})
Window:AddButton({text = "Player ESP", flag = "button", callback = function()
      		-- loadstring
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()

-- config
ESP.Tracers = true
ESP.Players = true
ESP.Boxes = true
ESP.Names = true
ESP:Toggle(true)

-- object
ESP:AddObjectListener(Workspace, { -- Object Path, For example: Workspace.ThisFolder
    Name = "", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 0, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})
ESP.whatever = true
end})
Window:AddBox({text = "Change Walkspeed", flag = "box", value = "Value", callback = function(speed)
while true do
        wait()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
        end
end})
Window:AddToggle({text = "Aimbot", flag = "toggle", state = false, callback = function(aimbot)
local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local GuiService = game:GetService("GuiService")
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local Camera = workspace.CurrentCamera
    local sc = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    local Down = true
    local Inset = GuiService:GetGuiInset()
    
    --// Options \\--
    getgenv().Options = {
        Enabled = aimbot,
        TeamCheck = true,
        Triggerbot = true,
        Smoothness = true,
        AimPart = "Head",
        FOV = 150
    }
    
    --// Functions \\--
    local gc = function()
        local nearest = math.huge
        local nearplr
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= game:GetService("Players").LocalPlayer and v.Character and v.Character:FindFirstChild(Options.AimPart) then
                if Options.TeamCheck then
                    if game:GetService("Players").LocalPlayer.Team ~= v.Team then
                        local pos = Camera:WorldToScreenPoint(v.Character[Options.AimPart].Position)
                        local diff = math.sqrt((pos.X - sc.X) ^ 2 + (pos.Y + Inset.Y - sc.Y) ^ 2)
                        if diff < nearest and diff < Options.FOV then
                            nearest = diff
                            nearplr = v
                        end
                    end
                else
                    local pos = Camera:WorldToScreenPoint(v.Character[Options.AimPart].Position)
                    local diff = math.sqrt((pos.X - sc.X) ^ 2 + (pos.Y + Inset.Y - sc.Y) ^ 2)
                    if diff < nearest and diff < Options.FOV then
                        nearest = diff
                        nearplr = v
                    end
                end
            end
        end
        return nearplr
    end -- google chrome made this but i modified it for it to use teamcheck
    
    function Circle()
        local circ = Drawing.new('Circle')
        circ.Transparency = 1
        circ.Thickness = 1.5
        circ.Visible = true
        circ.Color = Color3.fromRGB(255,255,255)
        circ.Filled = false
        circ.NumSides = 150
        circ.Radius = Options.FOV
        return circ
    end
    curc = Circle()
    --// Main \\--
    UserInputService.InputBegan:Connect(function( input )
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            Down = true
        end
    end)
    UserInputService.InputEnded:Connect(function( input )
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            Down = false
        end
    end)
    RunService.RenderStepped:Connect(function( ... )
        if Options.Enabled then
            if Down then
                if gc() ~= nil and gc().Character:FindFirstChild(Options.AimPart) then
                    if Options.Smoothness then
                        pcall(function( ... )
                            local Info = TweenInfo.new(0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
                            game:GetService("TweenService"):Create(Camera,Info,{
                                CFrame = CFrame.new(Camera.CFrame.p,gc().Character[Options.AimPart].CFrame.p)
                            }):Play()
                        end)
                    else
                        pcall(function()
                            Camera.CFrame = CFrame.new(Camera.CFrame.p,gc().Character[Options.AimPart].CFrame.p)
                        end)
                    end
                end
            end
            curc.Visible = false
            curc.Position = Vector2.new(Mouse.X, Mouse.Y+Inset.Y)
        else
            -- do nothing except remove the fov
            curc.Visible = false
        end
    end)
end})
Window:AddLabel({text = "Youtube: RileyBeeOrion"})
Library:Init()
