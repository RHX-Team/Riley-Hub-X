-- Gui to Lua
-- Version: 3.2

-- Instances:

local SprintingSystem = Instance.new("Folder")
local System = Instance.new("Folder")
local SprintGui = Instance.new("ScreenGui")
local SprintButton = Instance.new("TextButton")
local UIGradient = Instance.new("UIGradient")

--Properties:

SprintingSystem.Name = "Sprinting System"
SprintingSystem.Parent = game.Workspace

System.Name = "System"
System.Parent = SprintingSystem

SprintGui.Name = "SprintGui"
SprintGui.Parent = System
SprintGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

SprintButton.Name = "Sprint Button"
SprintButton.Parent = SprintGui
SprintButton.BackgroundColor3 = Color3.fromRGB(252, 1, 7)
SprintButton.BorderColor3 = Color3.fromRGB(128, 0, 2)
SprintButton.BorderSizePixel = 9
SprintButton.Position = UDim2.new(0.754981577, 0, 0.462466121, 0)
SprintButton.Size = UDim2.new(0.237005159, 0, 0.105125189, 0)
SprintButton.Font = Enum.Font.GothamBold
SprintButton.Text = "Sprint: Off"
SprintButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintButton.TextScaled = true
SprintButton.TextSize = 14.000
SprintButton.TextWrapped = true

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(192, 191, 197)), ColorSequenceKeypoint.new(0.87, Color3.fromRGB(255, 254, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient.Rotation = -90
UIGradient.Parent = SprintButton

-- Scripts:

local function JOVBXL_fake_script() -- SprintButton.Sprint Script 
	local script = Instance.new('LocalScript', SprintButton)

	--By flashkat1/Coffee Gaming
	--feel free to subscribe for more models and tutorials
	--video that this is from: https://www.youtube.com/watch?v=G6wMpUUDqbE
	
	--Waiting for player to click button
	script.Parent.MouseButton1Click:Connect(function()
	--Setting up a local veriable
		local Humanoid = game.Players.LocalPlayer.Character.Humanoid
		
		--Checking if player is sprinting
		if Humanoid.WalkSpeed == 16 then
			
		--Enables sprint
			Humanoid.WalkSpeed = 30 
			script.Parent.Text = "Sprint: On"
			script.Parent.BackgroundColor3 = Color3.new(0.419608, 1, 0)
			script.Parent.BorderColor3 = Color3.new(0.141176, 0.54902, 0)
		else
		--Disables sprint
			Humanoid.WalkSpeed = 16
			script.Parent.Text = "Sprint: Off"
			script.Parent.BackgroundColor3 = Color3.new(0.986252, 0.00712596, 0.0274357)
			script.Parent.BorderColor3 = Color3.new(0.501961, 0, 0.00784314)
		end
	end)
end
coroutine.wrap(JOVBXL_fake_script)()
local function TYVS_fake_script() -- System.CloneScript 
	local script = Instance.new('Script', System)

	local clone = script.Parent.SprintGui:Clone()
	
	clone.Parent = game.StarterGui
end
coroutine.wrap(TYVS_fake_script)()
