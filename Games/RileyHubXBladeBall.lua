local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Riley Hub X", HidePremium = false, SaveConfig = true, IntroEnabled = true, IntroText ="Riley Hub X", ConfigFolder = "RileyHubX"})

local Tab = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Combat"
})

local Section2 = Tab2:AddSection({
	Name = "Player"
})

local Section3 = Tab3:AddSection({
	Name = "Misc"
})

Tab:AddToggle({
	Name = "Auto Parry",
	Default = false,
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/datshort1/DatModV6/main/AutoParryPro"))()
	end    
})

Tab:AddToggle({
	Name = "Auto Parry V2",
	Default = false,
	Callback = function()
	-- Auto Parry V2
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local BallFolder = Workspace:WaitForChild("Balls")

local player = Players.LocalPlayer
local canParry = true

local function calculatePredictionTime(ball, player)
    local character = player.Character
    if character then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local relativePosition = ball.Position - rootPart.Position
            local relativeVelocity = ball.Velocity - rootPart.Velocity
            local a = ball.Size.Magnitude / 1
            local b = relativePosition.Magnitude
            local c = math.sqrt(a * a + b * b)
            return (c - a) / relativeVelocity.Magnitude
        end
    end
    return math.huge
end

local function parry()
    if canParry then
        canParry = false
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        task.delay(0.1, function()
            canParry = true
        end)
    end
end

local function checkProximityToPlayer(ball, player)
    local predictionTime = calculatePredictionTime(ball, player)
    local realBallAttribute = ball:GetAttribute("realBall")
    local target = ball:GetAttribute("target")

    if predictionTime and realBallAttribute and target then
        local ballSpeedThreshold = math.max(0.4, 0.6 - ball.Velocity.Magnitude * 0.03)
        if predictionTime <= ballSpeedThreshold and realBallAttribute and target == player.Name then
            parry()
        end
    end
end

local function checkBallsProximity()
    if player and player.Character then
        for _, ball in ipairs(BallFolder:GetChildren()) do
            if ball:IsA("BasePart") then
                checkProximityToPlayer(ball, player)
            end
        end
    end
end

RunService.Heartbeat:Connect(checkBallsProximity)
	end    
})

Tab:AddToggle({
	Name = "Auto Parry V3",
	Default = false,
	Callback = function()
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Balls = workspace:WaitForChild("Balls", 9000000000)

local function VerifyBall(Ball)
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end

local function IsTarget()
    return (Player.Character and Player.Character:FindFirstChild("Highlight"))
end

local function Parry()
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
end

Balls.ChildAdded:Connect(function(Ball)
    if not VerifyBall(Ball) then
        return
    end

    local OldPosition = Ball.Position
    local OldTick = tick()

    Ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() then
            local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
            local Velocity = (OldPosition - Ball.Position).Magnitude

            if (Distance / Velocity) <= 10 then
                Parry()
            end
        end

        if (tick() - OldTick >= 1/60) then
            OldTick = tick()
            OldPosition = Ball.Position
        end
    end)
end)
	end    
})

Tab:AddToggle({
	Name = "Auto Parry V4",
	Default = false,
	Callback = function()
	-- Its Only An Auto Parry
-- Fixed By Riley
local services = setmetatable({}, { __index = function(self, key)
    local service = game:GetService(key)
    self[key] = service
    return service
end })

local Players = services.Players
local Workspace = services.Workspace

local client = Players.LocalPlayer

local ballsFolder = Workspace.Balls

local Util = {}
do
    shared.Util = Util

    function Util.getBalls()
        local realBall, otherBall

        for i = 1, #ballsFolder:GetChildren() do
            local ball = ballsFolder:GetChildren()[i]
            if not ball:IsA("BasePart") then continue end

            local isRealBall = ball:GetAttribute("realBall")
            if isRealBall == nil then continue end

            if isRealBall then
                realBall = ball
            else
                otherBall = ball
            end

            if realBall and otherBall then break end
        end

        return realBall, otherBall
    end

    function Util.isHunting()
        local realBall = Util.getBalls()
        if not realBall then return false end

        local target = realBall:GetAttribute("target")
        if not target then return false end

        return target == client.Name
    end
end

ballsFolder.ChildAdded:Connect(function()
    print('------------------- Ball Spawned -------------------')

    task.wait(1.5)

    local realBall, fakeBall

    for i = 1, #ballsFolder:GetChildren() do
        local ball = ballsFolder:GetChildren()[i]
        if not ball:IsA("BasePart") then continue end

        local currentSpeed = ball.Velocity.Magnitude
        if currentSpeed == 0 then
            realBall = ball
        else
            fakeBall = ball
        end

        if realBall and fakeBall then break end
    end

    if realBall then
        local usedRemote = false
        local lastPosition = realBall.Position
        local lastVelocity = fakeBall.Velocity

        realBall:GetPropertyChangedSignal("Position"):Connect(function()
            if not Util.isHunting() then return end

            local playerPosition = client.Character and client.Character.PrimaryPart and client.Character.PrimaryPart.Position
            if not playerPosition then return end

            local currentSpeed = fakeBall and fakeBall.Velocity.Magnitude or 0

            local predictedPosition = lastPosition + lastVelocity
            local predictedDistance = (predictedPosition - playerPosition).Magnitude

            lastPosition = realBall.Position
            lastVelocity = realBall.Velocity

            local timeToReachPlayer = predictedDistance / (currentSpeed == 0 and 1 or currentSpeed)
            print(timeToReachPlayer)

            if timeToReachPlayer <= 0.3 and not usedRemote then
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ParryButtonPress"):Fire()
                task.wait(0.1)
                usedRemote = true
            elseif timeToReachPlayer > 0.4 then
                usedRemote = false
            end
        end)
    end
end)
	end    
})

Tab:AddToggle({
	Name = "Powerful Auto Parry",
	Default = false,
	Callback = function()
	getgenv().config = getgenv().config or {
    hit_time = 0.25, -- // recommended 0.25 to 0.75 \ --
 
    mode = 'Always', -- // Hold , Toggle , Always \ --
    deflect_type = 'Remote', -- // Key Press , Remote \ --
    notifications = true,
    keybind = Enum.KeyCode.V
}
 
loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()
	end    
})

Tab2:AddTextbox({
	Name = "Change Walkspeed",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
	end	  
})

Tab2:AddTextbox({
	Name = "Change FOV (Field Of View)",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
	local FovNumber = value
local Camera = workspace.CurrentCamera
Camera.FieldOfView = FovNumber
	end	  
})

Tab2:AddTextbox({
	Name = "Change JumpPower",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
	end	  
})

Tab3:AddLabel("Made By RileyBeeRBLX")

Tab3:AddLabel("Status: Undetected")

Tab3:AddLabel("Thanks For Using Riley Hub X")

Tab3:AddButton({
	Name = "Join The Discord Server",
	Callback = function()
      	setclipboard(https://discord.com/invite/yWwVdeGt2t)
  	end    
})

Tab3:AddButton({
	Name = "Destroy UI",
	Callback = function()
      	OrionLib:Destroy()
  	end    
})
OrionLib:Init()
