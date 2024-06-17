local correctKey = "your-correct-key" -- Replace with your correct key
local loadStringScript = "your-loadstring-script" -- Replace with your loadstring script
local keyLink = "your-key-link" -- Replace with your key link

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local VerifyButton = Instance.new("TextButton")
local GetKeyButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local NotificationLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Set the properties of the Frame
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.Position = UDim2.new(0.5, -175, 0.5, -125)
Frame.Size = UDim2.new(0, 350, 0, 250)
Frame.ClipsDescendants = true
Frame.BorderSizePixel = 0

-- Make the Frame draggable
Frame.Active = true
Frame.Draggable = true

-- Set the properties of the ImageLabel
ImageLabel.Parent = Frame
ImageLabel.Image = "rbxassetid://<your-image-id>" -- Replace with your image ID
ImageLabel.Position = UDim2.new(0, 10, 0, 10)
ImageLabel.Size = UDim2.new(0, 50, 0, 50)

-- Set the properties of the TextLabel
TextLabel.Parent = Frame
TextLabel.Text = "Alchemy Hub"
TextLabel.Font = Enum.Font.LexendDeca
TextLabel.TextScaled = true
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Position = UDim2.new(0.2, 0, 0, 10)
TextLabel.Size = UDim2.new(0.6, 0, 0.25, 0)

-- Set the properties of the TextBox
TextBox.Parent = Frame
TextBox.PlaceholderText = "KEY"
TextBox.Font = Enum.Font.LexendDeca
TextBox.TextScaled = true
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderColor3 = Color3.fromRGB(0, 166, 81)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)

-- Set the properties of the VerifyButton
VerifyButton.Parent = Frame
VerifyButton.Text = "VERIFY"
VerifyButton.Font = Enum.Font.LexendDeca
VerifyButton.TextScaled = true
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.BackgroundColor3 = Color3.fromRGB(0, 166, 81)
VerifyButton.Position = UDim2.new(0.1, 0, 0.65, 0)
VerifyButton.Size = UDim2.new(0.8, 0, 0.15, 0)

-- Set the properties of the GetKeyButton
GetKeyButton.Parent = Frame
GetKeyButton.Text = "GET KEY"
GetKeyButton.Font = Enum.Font.LexendDeca
GetKeyButton.TextScaled = true
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 166, 81)
GetKeyButton.Position = UDim2.new(0.1, 0, 0.85, 0)
GetKeyButton.Size = UDim2.new(0.8, 0, 0.15, 0)

-- Set the properties of the CloseButton
CloseButton.Parent = Frame
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.LexendDeca
CloseButton.TextScaled = true
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(217, 83, 79)
CloseButton.Position = UDim2.new(0.9, -25, 0, 10)
CloseButton.Size = UDim2.new(0, 25, 0, 25)

-- Set the properties of the NotificationLabel
NotificationLabel.Parent = ScreenGui
NotificationLabel.BackgroundColor3 = Color3.fromRGB(0, 166, 81)
NotificationLabel.Size = UDim2.new(0, 300, 0, 50)
NotificationLabel.Position = UDim2.new(0.5, -150, -0.1, 0)
NotificationLabel.Text = ""
NotificationLabel.Visible = false
NotificationLabel.Font = Enum.Font.LexendDeca
NotificationLabel.TextScaled = true
NotificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Function to show notification
local function showNotification(message, isError)
    NotificationLabel.Text = message
    if isError then
        NotificationLabel.BackgroundColor3 = Color3.fromRGB(217, 83, 79)
    else
        NotificationLabel.BackgroundColor3 = Color3.fromRGB(0, 166, 81)
    end
    NotificationLabel.Visible = true
    wait(5)
    NotificationLabel.Visible = false
end

-- Verify Button functionality
VerifyButton.MouseButton1Click:Connect(function()
    local key = TextBox.Text
    if key == correctKey then
        showNotification("Correct Key", false)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Key System",
            Text = "Correct Key",
            Duration = 5,
        })
        -- Destroy the UI and load the script
        ScreenGui:Destroy()
        loadstring(loadStringScript)() -- Replace with your script loading logic
    else
        showNotification("Incorrect Key", true)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Key System",
            Text = "Incorrect Key",
            Duration = 5,
        })
    end
end)

-- Get Key Button functionality
GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard(keyLink) -- Copy key link to clipboard
    showNotification("Key link copied to clipboard", false)
end)

-- Close Button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Make the Frame draggable
local dragging = false
local dragInput, mousePos, framePos

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - mousePos
        Frame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
    end
end)
