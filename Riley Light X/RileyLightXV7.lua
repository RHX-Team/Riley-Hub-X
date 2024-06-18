-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the Toggle Button
local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleButton"
toggleButton.Image = "rbxassetid://<your-toggle-button-image-id>" -- replace with the actual ID
toggleButton.Position = UDim2.new(0, 10, 0.5, -50)
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.BackgroundTransparency = 1
toggleButton.Parent = screenGui

-- Create the Sidebar
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 300, 1, 0)
sidebar.Position = UDim2.new(-1, 0, 0, 0) -- initially off-screen
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
sidebar.BorderSizePixel = 0
sidebar.Parent = screenGui

-- Create a UI Corner for Rounded Edges
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = sidebar

-- Create Tabs Container
local tabsContainer = Instance.new("Frame")
tabsContainer.Name = "TabsContainer"
tabsContainer.Size = UDim2.new(1, 0, 0, 100)
tabsContainer.Position = UDim2.new(0, 0, 0, 0)
tabsContainer.BackgroundTransparency = 1
tabsContainer.Parent = sidebar

-- Create Home Tab
local homeTab = Instance.new("TextButton")
homeTab.Name = "HomeTab"
homeTab.Size = UDim2.new(0, 150, 0, 50)
homeTab.Position = UDim2.new(0, 10, 0, 10)
homeTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
homeTab.Text = "Home"
homeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
homeTab.Font = Enum.Font.LexendDeca
homeTab.TextSize = 18
homeTab.Parent = tabsContainer

-- Create Execute Tab
local executeTab = Instance.new("TextButton")
executeTab.Name = "ExecuteTab"
executeTab.Size = UDim2.new(0, 150, 0, 50)
executeTab.Position = UDim2.new(0, 10, 0, 70)
executeTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
executeTab.Text = "Execute"
executeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
executeTab.Font = Enum.Font.LexendDeca
executeTab.TextSize = 18
executeTab.Parent = tabsContainer

-- Create Executor GUI
local executorGui = Instance.new("Frame")
executorGui.Name = "ExecutorGui"
executorGui.Size = UDim2.new(1, -20, 1, -120)
executorGui.Position = UDim2.new(0, 10, 0, 110)
executorGui.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
executorGui.Visible = false
executorGui.Parent = sidebar

-- Create Textbox
local scriptBox = Instance.new("TextBox")
scriptBox.Name = "ScriptBox"
scriptBox.Size = UDim2.new(1, -20, 0.8, -20)
scriptBox.Position = UDim2.new(0, 10, 0, 10)
scriptBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptBox.TextXAlignment = Enum.TextXAlignment.Left
scriptBox.TextYAlignment = Enum.TextYAlignment.Top
scriptBox.ClearTextOnFocus = false
scriptBox.MultiLine = true
scriptBox.Font = Enum.Font.Code
scriptBox.TextSize = 18
scriptBox.TextWrapped = true
scriptBox.Parent = executorGui

-- Create Execute Button
local executeButton = Instance.new("TextButton")
executeButton.Name = "ExecuteButton"
executeButton.Size = UDim2.new(0, 100, 0, 50)
executeButton.Position = UDim2.new(0, 10, 1, -60)
executeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
executeButton.Text = "Execute"
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.Font = Enum.Font.LexendDeca
executeButton.TextSize = 18
executeButton.Parent = executorGui

-- Create Clear Button
local clearButton = Instance.new("TextButton")
clearButton.Name = "ClearButton"
clearButton.Size = UDim2.new(0, 100, 0, 50)
clearButton.Position = UDim2.new(0, 120, 1, -60)
clearButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
clearButton.Text = "Clear"
clearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clearButton.Font = Enum.Font.LexendDeca
clearButton.TextSize = 18
clearButton.Parent = executorGui

-- Create Execute Clipboard Button
local clipboardButton = Instance.new("TextButton")
clipboardButton.Name = "ClipboardButton"
clipboardButton.Size = UDim2.new(0, 180, 0, 50)
clipboardButton.Position = UDim2.new(0, 230, 1, -60)
clipboardButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
clipboardButton.Text = "Execute Clipboard"
clipboardButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clipboardButton.Font = Enum.Font.LexendDeca
clipboardButton.TextSize = 18
clipboardButton.Parent = executorGui

-- Animation Function
local function animateSidebar(open)
    if open then
        sidebar:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.5, true)
    else
        sidebar:TweenPosition(UDim2.new(-1, 0, 0, 0), "In", "Sine", 0.5, true)
    end
end

-- Toggle Button Logic
local sidebarOpen = false
toggleButton.MouseButton1Click:Connect(function()
    sidebarOpen = not sidebarOpen
    animateSidebar(sidebarOpen)
end)

-- Tab Button Logic
homeTab.MouseButton1Click:Connect(function()
    executorGui.Visible = false
end)

executeTab.MouseButton1Click:Connect(function()
    executorGui.Visible = true
end)

-- Execute Button Logic
executeButton.MouseButton1Click:Connect(function()
    loadstring(scriptBox.Text)()
end)

-- Clear Button Logic
clearButton.MouseButton1Click:Connect(function()
    scriptBox.Text = ""
end)

-- Clipboard Button Logic
clipboardButton.MouseButton1Click:Connect(function()
    local clipboardText = tostring(setclipboard() or "")
    scriptBox.Text = clipboardText
    loadstring(clipboardText)()
end)
