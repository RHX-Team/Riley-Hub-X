loadstring(game:HttpGet(("https://raw.githubusercontent.com/REDzHUB/LibraryV2/main/redzLib")))()
MakeWindow({
  Hub = {
    Title = "Riley Hub X | Blade Ball",
    Animation = "By Riley",
  },
  Key = {
    KeySystem = false,
    Title = "Riley Hub Key System",
    Description = "Complete The Key System To Access Riley Hub",
    KeyLink = "",
    Keys = {"RileyHubKey2024"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Riley Hub Has Loaded!",
      Incorrectkey = "The Key You Put Is Incorrect!",
      CopyKeyLink = "Copied to Clipboard"
    }
  }
})

 Main = MakeTab({Name = "Main"})
local section = AddSection(Main, {"Auto Parry Section"})

local Toggle = AddButton(Main, {
  Name = "Auto Parry V1",
  Default = false,
  Callback = function(Value)
local function get_plr()
  return game.Players.LocalPlayer
end

local function get_plrChar()
  local plrChar = get_plr().Character
  if plrChar then
    return plrChar
  end
end

local function get_plrRP()
  local plrRP = get_plrChar():FindFirstChild("HumanoidRootPart")
  if plrRP then
    return plrRP
  end
end

local function playerJump()
  pcall(function()
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
  end)
end

local function get_PlayersNumber()
  local Alive = workspace:WaitForChild("Alive", 20):GetChildren()
  local PlayersNumber = 0
  for _,v in pairs(Alive) do
    if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 50 then
      PlayersNumber = PlayersNumber + 1
    end
  end
  return PlayersNumber
end

local function get_ProxyPlayer()
  local Players = workspace:WaitForChild("Alive"):GetChildren()
  local Distance = math.huge
  local plr = game.Players.LocalPlayer
  local plrRP = plr.Character:FindFirstChild("HumanoidRootPart")
  local Player = nil
  
  for _,plr1 in pairs(Players) do
    if plr1.Name ~= plr.Name and plrRP and plr1:FindFirstChild("HumanoidRootPart") and plr1:FindFirstChild("Humanoid") and plr1.Humanoid.Health > 50 then
      local magnitude = (plr1.HumanoidRootPart.Position - plrRP.Position).Magnitude
      if magnitude <= Distance then
        Distance = magnitude
        Player = plr1
      end
    end
  end
  return Player
end

local function Click_Button()
  task.spawn(function()
    local plr = game.Players.LocalPlayer
    local plrFind = workspace.Alive:FindFirstChild(plr.Name)
    if plrFind then
      local plrs = 0
      for _,v in pairs(workspace:WaitForChild("Alive", 10):GetChildren()) do
        plrs = plrs + 1
      end
      if plrs > 1 then
        local args = {[1] = 1.5,[2] = CFrame.new(-254, 112, -119) * CFrame.Angles(-2, 0, 2),[3] = {
        ["2617721424"] = Vector3.new(-273, -724, -20),
        },[4] = {[1] = 910,[2] = 154}}
        game:GetService("ReplicatedStorage").Remotes.ParryAttempt:FireServer(unpack(args))task.wait()
      end
    end
  end)
end

task.spawn(function()
  while task.wait() do
    if getgenv().SpamClickA then
      Click_Button()
    end
  end
end)

local function DetectSpam()
  local Balls = workspace:WaitForChild("Balls", 20)
  
  local OldPos = Vector3.new()
  local OldTick1 = tick()
  
  local OldBall = Balls
  local TargetPlayer = ""
  local SpamNum = 0
  local BallSpeed = 0
  local BallDistance = 0
  
  task.spawn(function()
    local OldTick = tick()
    local OldPos = Vector3.new()
    while getgenv().DetectSpam do task.wait()
      local plrRP = get_plrRP()
      local Ball = Balls:FindFirstChildOfClass("Part")
      if plrRP and Ball then
        BallDistance = (plrRP.Position - Ball.Position).Magnitude
        BallSpeed = (OldPos - Ball.Position).Magnitude
        if tick() - OldTick >= 1/60 then
          OldTick = tick()
          OldPos = Ball.Position
        end
      end
    end
  end)
  
  while getgenv().DetectSpam do task.wait()
    local Ball = Balls:FindFirstChildOfClass("Part")
    local plrRP = get_plrRP()
    local ProxyPlayer = get_ProxyPlayer()
    
    if not Ball then
      getgenv().SpamClickA = false
    end
  
    if Ball and Ball:GetAttribute("realBall") and OldBall ~= Ball then
    
      Ball.Changed:Connect(function()task.wait()
        local Ball = Balls:FindFirstChildOfClass("Part")
        
        if Ball then
          TargetPlayer = Ball:GetAttribute("target")
          
          if ProxyPlayer and TargetPlayer == ProxyPlayer.Name or get_plr() and TargetPlayer == get_plr().Name then
            SpamNum = SpamNum + 1
          else
            SpamNum = 0
          end
          
          local args = ProxyPlayer and ProxyPlayer:FindFirstChild("HumanoidRootPart")
          local HL1 = ProxyPlayer and ProxyPlayer:FindFirstChild("Highlight")
          local HL2 = get_plrChar() and get_plrChar():FindFirstChild("Highlight")
          
          if plrRP and HL1 and args or plrRP and HL2 and args then
            local DistancePlayer = (ProxyPlayer.HumanoidRootPart.Position - plrRP.Position).Magnitude
            local DistanceBall = (Ball.Position - plrRP.Position).Magnitude
            
            if get_PlayersNumber() < 3 then
              if DistancePlayer <= 30 and DistanceBall <= 35 and SpamNum >= 2 then
                getgenv().SpamClickA = true
              else
                getgenv().SpamClickA = false
              end
            else
              if DistancePlayer <= 30 and DistanceBall <= 35 and SpamNum >= 3 then
                getgenv().SpamClickA = true
              else
                getgenv().SpamClickA = false
              end
            end
          else
            getgenv().SpamClickA = false
          end
        end
      end)
      OldBall = Ball
    end
  end
end

getgenv().DetectSpam = true
DetectSpam()
 end
})

local Toggle = AddButton(Main, {
  Name = "Auto Parry V2",
  Default = false,
  Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/DonGabrielle/AutoDetectV4/main/MainBalls"))()
 end
})

local Toggle = AddButton(Main, {
  Name = "Auto Parry V3",
  Default = false,
  Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry"))()
 end
})

local Toggle = AddButton(Main, {
  Name = "Auto Parry V4",
  Default = false,
  Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))()
 end
})

local section = AddSection(Main, {"Spam"})

local Toggle = AddButton(Main, {
  Name = "Normal Auto Spam V1",
  Default = false,
  Callback = function(Value)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local parryButtonPress = replicatedStorage.Remotes.ParryButtonPress
local ballsFolder = workspace:WaitForChild("Balls")

print("Script successfully ran.")

local function onCharacterAdded(newCharacter)
    character = newCharacter
end

player.CharacterAdded:Connect(onCharacterAdded)

local focusedBall = nil  

local function chooseNewFocusedBall()
    local balls = ballsFolder:GetChildren()
    focusedBall = nil
    for _, ball in ipairs(balls) do
        if ball:GetAttribute("realBall") == true then
            focusedBall = ball
            break
        end
    end
end

chooseNewFocusedBall()

local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
    local directionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
    local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
    
    if velocityTowardsPlayer <= 0 then
        return math.huge
    end
    
    local distanceToBeCovered = distanceToPlayer - 30
    return distanceToBeCovered / velocityTowardsPlayer
end

local BASE_THRESHOLD = 0.15
local VELOCITY_SCALING_FACTOR = 0.002

local function getDynamicThreshold(ballVelocityMagnitude)
    local adjustedThreshold = BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR)
    return math.max(0.12, adjustedThreshold)
end

local function checkBallDistance()
    if not character:FindFirstChild("Highlight") then return end
    local charPos = character.PrimaryPart.Position
    local charVel = character.PrimaryPart.Velocity

    if focusedBall and not focusedBall.Parent then
        chooseNewFocusedBall()
    end

    if not focusedBall then return end

    local ball = focusedBall
    local distanceToPlayer = (ball.Position - charPos).Magnitude

    if distanceToPlayer < 10 then
        parryButtonPress:Fire()
        return
    end

    local timeToImpact = timeUntilImpact(ball.Velocity, distanceToPlayer, charVel)
    local dynamicThreshold = getDynamicThreshold(ball.Velocity.Magnitude)

    if timeToImpact < dynamicThreshold then
        parryButtonPress:Fire()
    end
end



runService.Heartbeat:Connect(function()
    checkBallDistance()
end)
 end
})

local Toggle = AddButton(Main, {
  Name = "Normal Auto Spam V2",
  Default = false,
  Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0"))()
 end
})

local Toggle = AddButton(Main, {
  Name = "Auto Spam V1",
  Default = false,
  Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/DonGabrielle/AutoDetectV4/main/MainBalls"))()
 end
})

local Toggle = AddButton(Main, {
  Name = "Auto Spam V2",
  Default = false,
  Callback = function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/t2391h1A"))()
 end
})

local Toggle = AddButton(Main, {
  Name = "Auto Spam V3",
  Default = false,
  Callback = function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/HPNBFGSf"))()
 end
})



 Main = MakeTab({Name = "Misc"})

AddTextBox(Main, {
  Name = "Change Walkspeed",
  Default = "",
  PlaceholderText = "",
  ClearText = true,
  Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value     
 end
})

AddTextBox(Main, {
  Name = "Change JumpPower",
  Default = "",
  PlaceholderText = "",
  ClearText = true,
  Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = value    
  end
})

AddTextBox(Main, {
  Name = "Change FOV",
  Default = "",
  PlaceholderText = "",
  ClearText = true,
  Callback = function(value)
local FovNumber = value
local Camera = workspace.CurrentCamera
Camera.FieldOfView = FovNumber  
  end
})

local Toggle = AddButton(Main, {
  Name = "No Clip",
  Default = false,
  Callback = function(Value)
local Noclip = nil
local Clip = nil
function noclip()
 Clip = false
 local function Nocl()
  if Clip == false and game.Players.LocalPlayer.Character ~= nil then
   for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
     v.CanCollide = false
    end
   end
  end
  wait(0.21) -- basic optimization
 end
 Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end
function clip()
 if Noclip then Noclip:Disconnect() end
 Clip = true
end
noclip() -- to toggle noclip() and clip(
 end
})
local Toggle = AddButton(Main, {
  Name = "Server Hop",
  Default = false,
  Callback = function(Value)
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"
local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end
local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server
TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
 end
})
local Toggle = AddButton(Main, {
  Name = "Rejoin Server",
  Default = false,
  Callback = function(Value)
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(game.PlaceId, p)
 end
})
local Toggle = AddButton(Main, {
  Name = "Destroy UI",
  Default = false,
  Callback = function(Value)
DestroyScript()
 end
})

local Toggle = AddButton(Main, {
  Name = "Infinite Jump",
  Default = false,
  Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/BsGlitch/-nfJumps/main/BsGlitch"))()
 end
})

local Toggle = AddButton(Main, {
  Name = "Remove Textures (Anti Lag)",
  Default = false,
  Callback = function(Value)
local ToDisable = {
	Textures = false,
	VisualEffects = true,
	Parts = true,
	Particles = true,
	Sky = true
}

local ToEnable = {
	FullBright = false
}

local Stuff = {}

for _, v in next, game:GetDescendants() do
	if ToDisable.Parts then
		if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
			v.Material = Enum.Material.SmoothPlastic
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Particles then
		if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
			v.Enabled = false
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.VisualEffects then
		if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
			v.Enabled = false
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Textures then
		if v:IsA("Decal") or v:IsA("Texture") then
			v.Texture = ""
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Sky then
		if v:IsA("Sky") then
			v.Parent = nil
			table.insert(Stuff, 1, v)
		end
	end
end
 end
})
