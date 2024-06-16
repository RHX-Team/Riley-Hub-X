-- Define the GUI elements
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local KeyBox = Instance.new("TextBox")
local VerifyButton = Instance.new("TextButton")
local GetKeyButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Parent the GUI elements
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Logo.Parent = Frame
Title.Parent = Frame
KeyBox.Parent = Frame
VerifyButton.Parent = Frame
GetKeyButton.Parent = Frame
CloseButton.Parent = Frame
UICorner.Parent = Frame

-- Set properties for the Frame
Frame.BackgroundColor3 = Color3.fromRGB(0, 153, 0)  -- Green background
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.Size = UDim2.new(0, 450, 0, 250)  -- Larger and wider
UICorner.CornerRadius = UDim.new(0, 10)
Frame.Active = true
Frame.Draggable = true

-- Set properties for the Logo
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0.02, 0, 0.05, 0)
Logo.Size = UDim2.new(0, 40, 0, 40)
Logo.Image = "https://cdn.discordapp.com/attachments/1251015431855145021/1251798668952998008/rhx.png?ex=666fe3db&is=666e925b&hm=8fd02b463f6787255bea457a1a341ca89bc5d6a82c7d6a2c36945a98132a470e&"

-- Set properties for the Title
Title.BackgroundColor3 = Color3.fromRGB(0, 153, 0)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.2, 0, 0.05, 0)
Title.Size = UDim2.new(0.7, 0, 0.3, 0)
Title.Font = Enum.Font.LexendDeca
Title.Text = "Riley Hub X Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextWrapped = true

-- Set properties for the KeyBox
KeyBox.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
KeyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0.2, 0)
KeyBox.Font = Enum.Font.LexendDeca
KeyBox.Text = "KEY"
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextScaled = true
KeyBox.TextWrapped = true

-- Set properties for the VerifyButton
VerifyButton.BackgroundColor3 = Color3.fromRGB(0, 204, 0)
VerifyButton.Position = UDim2.new(0.1, 0, 0.65, 0)
VerifyButton.Size = UDim2.new(0.8, 0, 0.15, 0)  -- Larger and wider
VerifyButton.Font = Enum.Font.LexendDeca
VerifyButton.Text = "VERIFY"
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.TextScaled = true
VerifyButton.TextWrapped = true

-- Set properties for the GetKeyButton
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 204, 0)
GetKeyButton.Position = UDim2.new(0.1, 0, 0.825, 0)
GetKeyButton.Size = UDim2.new(0.8, 0, 0.15, 0)  -- Larger and wider
GetKeyButton.Font = Enum.Font.LexendDeca
GetKeyButton.Text = "GET KEY"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextScaled = true
GetKeyButton.TextWrapped = true

-- Set properties for the CloseButton
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0.92, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Font = Enum.Font.LexendDeca
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.TextWrapped = true

-- Define the correct key and the loadstring URL
local correctKey = "YourCustomKey"
local loadstringURL = "https://pastebin.com/raw/yourloadstringcode"

-- Notification function
local function notify(title, message)
    game.StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = message;
        Duration = 5;
    })
end

-- Verify Button functionality
VerifyButton.MouseButton1Click:Connect(function()
    if KeyBox.Text == correctKey then
        notify("Riley Hub X Key System", "Correct Key")
        loadstring(game:HttpGet(loadstringURL))()
        ScreenGui:Destroy()  -- Destroy the UI
    else
        notify("Riley Hub X Key System", "Incorrect Key")
        KeyBox.Text = ""
    end
end)

-- Get Key Button functionality
GetKeyButton.MouseButton1Click:Connect(function()
    local url = "https://yourwebsite.com/getkey"
    setclipboard(url)
    notify("Riley Hub X Key System", "Link copied to clipboard!")
end)

-- Close Button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)