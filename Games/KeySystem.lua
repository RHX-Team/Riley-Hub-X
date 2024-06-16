-- Define the GUI elements
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local KeyBox = Instance.new("TextBox")
local VerifyButton = Instance.new("TextButton")
local GetKeyButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Parent the GUI elements
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
KeyBox.Parent = Frame
VerifyButton.Parent = Frame
GetKeyButton.Parent = Frame
UICorner.Parent = Frame

-- Set properties for the Frame
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.Size = UDim2.new(0, 200, 0, 100)
UICorner.CornerRadius = UDim.new(0, 10)

-- Set properties for the KeyBox
KeyBox.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
KeyBox.Position = UDim2.new(0.1, 0, 0.2, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0.2, 0)
KeyBox.Font = Enum.Font.Gotham
KeyBox.Text = "KEY"
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextScaled = true
KeyBox.TextWrapped = true

-- Set properties for the VerifyButton
VerifyButton.BackgroundColor3 = Color3.fromRGB(0, 204, 0)
VerifyButton.Position = UDim2.new(0.1, 0, 0.5, 0)
VerifyButton.Size = UDim2.new(0.8, 0, 0.2, 0)
VerifyButton.Font = Enum.Font.Gotham
VerifyButton.Text = "VERIFY"
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.TextScaled = true
VerifyButton.TextWrapped = true

-- Set properties for the GetKeyButton
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 204, 0)
GetKeyButton.Position = UDim2.new(0.1, 0, 0.75, 0)
GetKeyButton.Size = UDim2.new(0.8, 0, 0.2, 0)
GetKeyButton.Font = Enum.Font.Gotham
GetKeyButton.Text = "GET KEY"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextScaled = true
GetKeyButton.TextWrapped = true

-- Define the correct key and the loadstring URL
local correctKey = "YourCustomKey"
local loadstringURL = "https://pastebin.com/raw/yourloadstringcode"

-- Verify Button functionality
VerifyButton.MouseButton1Click:Connect(function()
    if KeyBox.Text == correctKey then
        loadstring(game:HttpGet(loadstringURL))()
    else
        KeyBox.Text = "INCORRECT KEY"
        wait(2)
        KeyBox.Text = ""
    end
end)

-- Get Key Button functionality
GetKeyButton.MouseButton1Click:Connect(function()
    local url = "https://yourwebsite.com/getkey"
    setclipboard(url)
    KeyBox.Text = "LINK COPIED"
    wait(2)
    KeyBox.Text = ""
end)
