-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.Name = "KeySystem"

-- Create main frame
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.new(0, 0.5, 0)
mainFrame.Size = UDim2.new(0, 400, 0, 200)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
mainFrame.Draggable = true
mainFrame.Active = true

-- Add corner radius to main frame
local cornerRadius = Instance.new("UICorner")
cornerRadius.Parent = mainFrame

-- Create the title
local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.Text = "RHX"
title.Size = UDim2.new(0, 200, 0, 50)
title.Position = UDim2.new(0.5, -100, 0, 10)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24

-- Create key input textbox
local keyBox = Instance.new("TextBox")
keyBox.Parent = mainFrame
keyBox.PlaceholderText = "KEY"
keyBox.Size = UDim2.new(0, 200, 0, 50)
keyBox.Position = UDim2.new(0.5, -100, 0, 70)
keyBox.BackgroundColor3 = Color3.new(1, 1, 1)
keyBox.TextColor3 = Color3.new(0, 0, 0)
keyBox.Font = Enum.Font.SourceSans
keyBox.TextSize = 18

-- Create Verify button
local verifyButton = Instance.new("TextButton")
verifyButton.Parent = mainFrame
verifyButton.Text = "VERIFY"
verifyButton.Size = UDim2.new(0, 100, 0, 50)
verifyButton.Position = UDim2.new(0.5, -110, 0, 130)
verifyButton.BackgroundColor3 = Color3.new(0, 1, 0)
verifyButton.TextColor3 = Color3.new(0, 0, 0)
verifyButton.Font = Enum.Font.SourceSansBold
verifyButton.TextSize = 18

-- Create Get Key button
local getKeyButton = Instance.new("TextButton")
getKeyButton.Parent = mainFrame
getKeyButton.Text = "GET KEY"
getKeyButton.Size = UDim2.new(0, 100, 0, 50)
getKeyButton.Position = UDim2.new(0.5, 10, 0, 130)
getKeyButton.BackgroundColor3 = Color3.new(0, 1, 0)
getKeyButton.TextColor3 = Color3.new(0, 0, 0)
getKeyButton.Font = Enum.Font.SourceSansBold
getKeyButton.TextSize = 18

-- Create close button (X)
local closeButton = Instance.new("TextButton")
closeButton.Parent = mainFrame
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18

-- Key validation logic
local validKey = "your_custom_key"  -- Replace with your actual key

verifyButton.MouseButton1Click:Connect(function()
    if keyBox.Text == validKey then
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
    local url = "https://yourwebsite.com/getkey"
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
