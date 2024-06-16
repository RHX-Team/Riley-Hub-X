local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    local ScreenGui = Instance.new("ScreenGui")
    local Toggle = Instance.new("ImageButton")
    
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui
    
    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BorderSizePixel = 2
    Toggle.BorderColor3 = Color3.fromRGB(0,255,255)
    Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Image = "https://cdn.discordapp.com/attachments/1251015431855145021/1251435886525288468/47450058-5C55-4983-88D5-F56DBA115754.jpg?ex=666e91fd&is=666d407d&hm=069ebf11438c5b2599c4d24a818c2c2004e0d78d1ec6e43e4abd81d5972ff6f1&"
    Toggle.ImageColor3 = Color3.fromRGB(0, 255, 255)
    Toggle.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"K",false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"K",false,game)
    end)

    local gui = Toggle
    local dragging
    local dragInput
    local dragStart
    local startPos
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Riley Hub X | Arsenal (PC)",
   LoadingTitle = "Riley Hub X | Arsenal (PC)",
   LoadingSubtitle = "By Riley",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Riley Hub X"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Riley Hub X Key System",
      Subtitle = "Put The Key To Access Riley Hub X",
      Note = "Get Key: https://loot-link.com/s?402d88ce",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/sENES1MQ"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "Riley Hub X ",
   Content = "Riley Hub X Has Loaded",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Ok",
         Callback = function()
         print("Thanks For Using Riley Hub X")
      end
   },
},
})

local Tab = Window:CreateTab("Home", 4483362458) -- Title, Image

local Label = Tab:CreateLabel("Status: Undetected")

local Paragraph = Tab:CreateParagraph({Title = "Welcome To Riley Hub X", Content = "Riley Hub X Supports Various Games"})

local Tab2 = Window:CreateTab("Gun Mods", 4483362458) -- Title, Image

local Toggle = Tab2:CreateToggle({
   Name = "Aimbot",
   CurrentValue = false,
   Flag = "Aimbot", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(aimbot)
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
   end,
})

local Button = Tab2:CreateButton({
   Name = "Rapid Fire",
   Callback = function()
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
   end,
})

local Button = Tab2:CreateButton({
   Name = "Infinite Ammo",
   Callback = function()
   while wait() do
	game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
	game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
end
   end,
})  

local Button = Tab2:CreateButton({
   Name = "RGB Gun",
   Callback = function()
  local c = 1 function zigzag(X)  return math.acos(math.cos(X * math.pi)) / math.pi end game:GetService("RunService").RenderStepped:Connect(function()  if game.Workspace.Camera:FindFirstChild('Arms') then   for i,v in pairs(game.Workspace.Camera.Arms:GetDescendants()) do    if v.ClassName == 'MeshPart' then      v.Color = Color3.fromHSV(zigzag(c),1,1)     c = c + .0001    end   end  end end)
   end,
})  

local Button = Tab2:CreateButton({
   Name = "Silent Aim",
   Callback = function()
   function getplrsname() for i,v in pairs(game:GetChildren()) do if v.ClassName == "Players" then return v.Name end end end local players = getplrsname() local plr = game[players].LocalPlayer coroutine.resume(coroutine.create(function() while wait(1) do coroutine.resume(coroutine.create(function() for _,v in pairs(game[players]:GetPlayers()) do if v.Name ~= plr.Name and v.Character then v.Character.RightUpperLeg.CanCollide = false v.Character.RightUpperLeg.Transparency = 75 v.Character.RightUpperLeg.Size = Vector3.new(21,21,21) v.Character.LeftUpperLeg.CanCollide = false v.Character.LeftUpperLeg.Transparency = 75 v.Character.LeftUpperLeg.Size = Vector3.new(21,21,21) v.Character.HeadHB.CanCollide = false v.Character.HeadHB.Transparency = 75 v.Character.HeadHB.Size = Vector3.new(21,21,21) v.Character.HumanoidRootPart.CanCollide = false v.Character.HumanoidRootPart.Transparency = 75 v.Character.HumanoidRootPart.Size = Vector3.new(21,21,21) end end end)) end end))
   end,
})  

local Tab3 = Window:CreateTab("ESP", 4483362458) -- Title, Image

local Button = Tab3:CreateButton({
   Name = "Player ESP",
   Callback = function()
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
   end,
})

local Tab4 = Window:CreateTab("Visuals", 4483362458) -- Title, Image

local Button = Tab4:CreateButton({
   Name = "Full Bright",
   Callback = function()
         		local Light = game:GetService("Lighting")
function dofullbright()
Light.Ambient = Color3.new(1, 1, 1)
Light.ColorShift_Bottom = Color3.new(1, 1, 1)
Light.ColorShift_Top = Color3.new(1, 1, 1)
end
dofullbright()
Light.LightingChanged:Connect(dofullbright)
   end,
})  

local Tab5 = Window:CreateTab("Misc", 4483362458) -- Title, Image

local Input = Tab5:CreateInput({
   Name = "Change Walkspeed",
   PlaceholderText = "Input Walkspeed",
   RemoveTextAfterFocusLost = false,
   Callback = function(speed)
   while true do
        wait()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
        end
   end,
})

local Button = Tab5:CreateButton({
   Name = "Destroy UI",
   Callback = function()
   Rayfield:Destroy()
   end,
})  

local Label = Tab5:CreateLabel("Made By RileyBeeRBLX")
