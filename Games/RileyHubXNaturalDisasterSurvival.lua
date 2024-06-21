local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Riley Hub X", HidePremium = false, SaveConfig = true, IntroEnabled = true, IntroText ="Riley Hub X", ConfigFolder = "Riley Hub X"})
OrionLib:MakeNotification({
	Name = "Riley Hub X",
	Content = "Riley Hub X Has Loaded",
	Image = "rbxassetid://4483345998",
	Time = 3
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab1 = Window:MakeTab({
	Name = "Game Scripts",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Fun Stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Others",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Riley Hub X","Welcome To Riley Hub X The Best Script")
local Section = Tab1:AddSection({
	Name = "Teleports"
})

Tab1:AddButton({
	Name = "Map",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108, 49, 0)
	end
})

Tab1:AddButton({
	Name = "Tower",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264, 196, 288)
	end
})

local Section = Tab1:AddSection({
	Name = "Others"
})

Tab1:AddToggle({
	Name = "Walk On Water",
	Default = false,
	Callback = function(Value)
		if (Value) == false then do game.Workspace.WaterLevel.CanCollide = false
				game.Workspace.WaterLevel.Size = Vector3.new(10, 1, 10)
			end
		end
		if (Value) == true then do game.Workspace.WaterLevel.CanCollide = true
				game.Workspace.WaterLevel.Size = Vector3.new(1000, 1, 1000)
			end
		end
	end    
})

Tab1:AddButton({
	Name = "Remove Ads",
	Callback = function()
      		game:GetService("Workspace").BillboardAd:Destroy()
game:GetService("Workspace").ForwardPortal:Destroy()
game:GetService("Workspace").ReturnPortal:Destroy()
  	end    
})

Tab1:AddButton({
	Name = "Remove Sandstorm",
	Callback = function()
      		game.Players.LocalPlayer.PlayerGui.SandStormGui:destroy()
  	end    
})
Tab1:AddButton({
	Name = "Remove Blizzard",
	Callback = function()
      		game.Players.LocalPlayer.PlayerGui.BlizzardGui:destroy()
  	end    
})

Tab:AddButton({
	Name = "Copy Discord Invite",
	Callback = function()
      		setclipboard("https://discord.com/invite/yWwVdeGt2t")
OrionLib:MakeNotification({
	Name = "Copied To Clipboard",
	Content = "Discord Invite Link Has Been Copied To Your Clipboard,"
	Image = "rbxassetid://4483345998",
	Time = 5
})

Tab1:AddButton({
	Name = "Launch Land Rocket",
	Callback = function()
      		fireclickdetector(game:GetService("Workspace").Structure["Launch Land"]["SPACESHIP!!"].Shuttle.IgnitionButton.ClickDetector)
fireclickdetector(game:GetService("Workspace").Structure["Launch Land"].RocketStand.ConsoleLower.ReleaseButtonLower.ClickDetector)
fireclickdetector(game:GetService("Workspace").Structure["Launch Land"].RocketStand.ConsoleUpper.ReleaseButtonUpper.ClickDetector)
fireclickdetector(game:GetService("Workspace").Structure["Launch Land"].LoadingTower.Console.ReleaseEntryBridge.ClickDetector)

  	end    
})

local Section = Tab2:AddSection({
	Name = "Auto Farm"
})

Tab2:AddButton({
	Name = "Enable",
	Callback = function()
local runService = game:GetService("RunService")
event = runService.RenderStepped:Connect(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264, 195, 288)
end)
if game.Players.LocalPlayer.Character.FallDamageScript then
game.Players.LocalPlayer.Character.FallDamageScript:Destroy()
end
end
})

Tab2:AddButton({
	Name = "Disable",
	Callback = function()
      		event:Disconnect()
end
})

local Section = Tab2:AddSection({
	Name = "Player"
})

Tab2:AddSlider({
	Name = "WalkSpeed",
	Min = 0,
	Max = 250,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "WalkSpeed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end    
})

Tab2:AddSlider({
	Name = "JumpPowers",
	Min = 0,
	Max = 550,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JumpPowers",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
	end    
})

Tab2:AddSlider({
	Name = "Gravity",
	Min = 0,
	Max = 196,
	Default = 196,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
		game.Workspace.Gravity = (Value)
	end    
})

Tab2:AddSlider({
	Name = "HipHeight",
	Min = 0,
	Max = 50,
	Default = game.Players.LocalPlayer.Character.Humanoid.HipHeight,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "HipHeight",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.HipHeight = (Value)
	end    
})

local Section = Tab3:AddSection({
	Name = "Admins"
})

Tab3:AddButton({
	Name = "Infinite Yield",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})
OrionLib:Init()
