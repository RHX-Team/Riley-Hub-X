-- Services
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.Name = "ModernUI"

-- Create main frame
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
mainFrame.Size = UDim2.new(0, 450, 0, 250)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -125)
mainFrame.Draggable = true
mainFrame.Active = true

-- Add corner radius to main frame
local cornerRadius = Instance.new("UICorner")
cornerRadius.CornerRadius = UDim.new(0, 15)
cornerRadius.Parent = mainFrame

-- Add stroke to main frame
local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.new(0.3, 0.3, 0.3)
frameStroke.Thickness = 2
frameStroke.Parent = mainFrame

-- Add gradient to main frame
local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.new(0.1, 0.1, 0.1)),
    ColorSequenceKeypoint.new(1, Color3.new(0.2, 0.2, 0.2))
}
frameGradient.Parent = mainFrame

-- Create the title
local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.Text = "Alchemy Hub"
title.Size = UDim2.new(0, 200, 0, 50)
title.Position = UDim2.new(0.5, -100, 0, 10)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextStrokeTransparency = 0.5
title.TextScaled = true

-- Create key input textbox
local keyBox = Instance.new("TextBox")
keyBox.Parent = mainFrame
keyBox.PlaceholderText = "Enter your key"
keyBox.Size = UDim2.new(0, 300, 0, 50)
keyBox.Position = UDim2.new(0.5, -150, 0, 70)
keyBox.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
keyBox.TextColor3 = Color3.new(1, 1, 1)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 18
keyBox.ClearTextOnFocus = false

-- Add corner radius to keyBox
local keyBoxCornerRadius = Instance.new("UICorner")
keyBoxCornerRadius.CornerRadius = UDim.new(0, 10)
keyBoxCornerRadius.Parent = keyBox

-- Create Verify button
local verifyButton = Instance.new("TextButton")
verifyButton.Parent = mainFrame
verifyButton.Text = "VERIFY"
verifyButton.Size = UDim2.new(0, 140, 0, 50)
verifyButton.Position = UDim2.new(0.5, -160, 0, 150)
verifyButton.BackgroundColor3 = Color3.new(0.25, 0.75, 0.25)
verifyButton.TextColor3 = Color3.new(1, 1, 1)
verifyButton.Font = Enum.Font.GothamBold
verifyButton.TextSize = 18

-- Add corner radius to verifyButton
local verifyButtonCornerRadius = Instance.new("UICorner")
verifyButtonCornerRadius.CornerRadius = UDim.new(0, 10)
verifyButtonCornerRadius.Parent = verifyButton

-- Create Get Key button
local getKeyButton = Instance.new("TextButton")
getKeyButton.Parent = mainFrame
getKeyButton.Text = "GET KEY"
getKeyButton.Size = UDim2.new(0, 140, 0, 50)
getKeyButton.Position = UDim2.new(0.5, 20, 0, 150)
getKeyButton.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
getKeyButton.TextColor3 = Color3.new(1, 1, 1)
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextSize = 18

-- Add corner radius to getKeyButton
local getKeyButtonCornerRadius = Instance.new("UICorner")
getKeyButtonCornerRadius.CornerRadius = UDim.new(0, 10)
getKeyButtonCornerRadius.Parent = getKeyButton

-- Add gradient and outline to getKeyButton
local getKeyButtonGradient = Instance.new("UIGradient")
getKeyButtonGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0)),  -- Green light
    ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.new(0.25, 0.75, 0.25)),  -- Normal green
    ColorSequenceKeypoint.new(1, Color3.new(0.25, 0.75, 0.25))
}
getKeyButtonGradient.Parent = getKeyButton

local getKeyButtonStroke = Instance.new("UIStroke")
getKeyButtonStroke.Color = Color3.new(0.25, 0.75, 0.25)
getKeyButtonStroke.Thickness = 2
getKeyButtonStroke.Parent = getKeyButton

-- Create close button (X)
local closeButton = Instance.new("TextButton")
closeButton.Parent = mainFrame
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.BackgroundColor3 = Color3.new(0.8, 0.1, 0.1)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18

-- Add corner radius to closeButton
local closeButtonCornerRadius = Instance.new("UICorner")
closeButtonCornerRadius.CornerRadius = UDim.new(0, 8)
closeButtonCornerRadius.Parent = closeButton

-- Utility functions to get HWID or UUID
local function getHWID()
    return game:GetService("HttpService"):GenerateGUID(false) -- Replace this with actual HWID retrieval method
end

local function getUUID()
    return game:GetService("HttpService"):GenerateGUID(false) -- Replace this with actual UUID retrieval method
end

-- Key validation logic
local validKeyURL = "https://rhxkeysystem.vercel.app/validate?key="

verifyButton.MouseButton1Click:Connect(function()
    local key = keyBox.Text
    local deviceType = "unknown"
    if game:GetService("UserInputService").TouchEnabled then
        -- Assuming it's mobile
        if game:GetService("UserInputService").KeyboardEnabled then
            -- Likely Android
            key = "rhx_hwid_" .. getHWID()
            deviceType = "Android"
        else
            -- Likely iOS
            key = "rhx_" .. getUUID()
            deviceType = "iOS"
        end
    end
    
    local url = validKeyURL .. key
    local response = HttpService:GetAsync(url)
    local data = HttpService:JSONDecode(response)
    
    if data.valid then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Key System",
            Text = "Correct Key",
            Duration = 5,
        })
        -- Execute the loadstring script
        loadstring(game:HttpGet("https://your_script_url.com/script.lua"))() -- Replace with your actual script URL
        screenGui:Destroy()
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Key System",
            Text = "Incorrect Key",
            Duration = 5,
        })
    end
end)

getKeyButton.MouseButton1Click:Connect(function()
    -- Replace the URL with the actual link to get the key
    local url = "https://rhxkeysystem.vercel.app"
    setclipboard(url)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Key System",
        Text = "Key link copied to clipboard",
        Duration = 5,
    })
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
