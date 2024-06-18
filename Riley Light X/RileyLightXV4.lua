-- Create GUI elements
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui")
local sidebar = Instance.new("Frame")
local homeTab = Instance.new("TextButton")
local executeTab = Instance.new("TextButton")
local executorGui = Instance.new("Frame")
local homeGui = Instance.new("Frame")
local executeButton = Instance.new("TextButton")
local clearButton = Instance.new("TextButton")
local executeClipboardButton = Instance.new("TextButton")
local scriptBox = Instance.new("TextBox")
local welcomeLabel = Instance.new("TextLabel")
local creditsBox = Instance.new("TextBox")
local toggleButton = Instance.new("ImageButton")
local backButton = Instance.new("TextButton")

-- Set properties for GUI elements
screenGui.Name = "ExecutorGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

sidebar.Name = "Sidebar"
sidebar.Parent = screenGui
sidebar.Position = UDim2.new(-0.2, 0, 0, 0) -- Start off-screen
sidebar.Size = UDim2.new(0.2, 0, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

homeTab.Name = "HomeTab"
homeTab.Parent = sidebar
homeTab.Size = UDim2.new(1, 0, 0, 60)
homeTab.Text = "Home"
homeTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

executeTab.Name = "ExecuteTab"
executeTab.Parent = sidebar
executeTab.Size = UDim2.new(1, 0, 0, 60)
executeTab.Position = UDim2.new(0, 0, 0, 60)
executeTab.Text = "Execute"
executeTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

executorGui.Name = "ExecutorGui"
executorGui.Parent = screenGui
executorGui.Position = UDim2.new(0.2, 0, 0, 0)
executorGui.Size = UDim2.new(0.8, 0, 1, 0)
executorGui.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
executorGui.Visible = false

homeGui.Name = "HomeGui"
homeGui.Parent = screenGui
homeGui.Position = UDim2.new(0.2, 0, 0, 0)
homeGui.Size = UDim2.new(0.8, 0, 1, 0)
homeGui.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

scriptBox.Name = "ScriptBox"
scriptBox.Parent = executorGui
scriptBox.Position = UDim2.new(0, 10, 0, 10)
scriptBox.Size = UDim2.new(1, -20, 0.7, -20)
scriptBox.MultiLine = true
scriptBox.ClearTextOnFocus = false
scriptBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptBox.Font = Enum.Font.SourceSans
scriptBox.TextSize = 18

executeButton.Name = "ExecuteButton"
executeButton.Parent = executorGui
executeButton.Position = UDim2.new(0, 10, 0.75, 10)
executeButton.Size = UDim2.new(0.3, -10, 0.1, -10)
executeButton.Text = "Execute"
executeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.Font = Enum.Font.LexendDeca
executeButton.TextSize = 18

clearButton.Name = "ClearButton"
clearButton.Parent = executorGui
clearButton.Position = UDim2.new(0.35, 10, 0.75, 10)
clearButton.Size = UDim2.new(0.3, -10, 0.1, -10)
clearButton.Text = "Clear"
clearButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
clearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clearButton.Font = Enum.Font.LexendDeca
clearButton.TextSize = 18

executeClipboardButton.Name = "ExecuteClipboardButton"
executeClipboardButton.Parent = executorGui
executeClipboardButton.Position = UDim2.new(0.7, 10, 0.75, 10)
executeClipboardButton.Size = UDim2.new(0.3, -10, 0.1, -10)
executeClipboardButton.Text = "Execute Clipboard"
executeClipboardButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
executeClipboardButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeClipboardButton.Font = Enum.Font.LexendDeca
executeClipboardButton.TextSize = 18

welcomeLabel.Name = "WelcomeLabel"
welcomeLabel.Parent = homeGui
welcomeLabel.Position = UDim2.new(0.5, -100, 0.3, 0)
welcomeLabel.Size = UDim2.new(0, 200, 0, 50)
welcomeLabel.Text = "Welcome to Executor"
welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
welcomeLabel.Font = Enum.Font.LexendDeca
welcomeLabel.TextSize = 24
welcomeLabel.TextScaled = true

creditsBox.Name = "CreditsBox"
creditsBox.Parent = homeGui
creditsBox.Position = UDim2.new(0.5, -100, 0.4, 0)
creditsBox.Size = UDim2.new(0, 200, 0, 100)
creditsBox.Text = "Developer: YourName\nDescription: YourDescription"
creditsBox.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
creditsBox.Font = Enum.Font.LexendDeca
creditsBox.TextSize = 18
creditsBox.TextScaled = true
creditsBox.TextWrapped = true

toggleButton.Name = "ToggleButton"
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0.9, 0, 0.9, 0)
toggleButton.BackgroundTransparency = 1
toggleButton.Image = "rbxassetid://YOUR_IMAGE_ASSET_ID" -- Replace with your image asset ID

backButton.Name = "BackButton"
backButton.Parent = sidebar
backButton.Size = UDim2.new(1, 0, 0, 60)
backButton.Position = UDim2.new(0, 0, 0.9, -60)
backButton.Text = "Back"
backButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
backButton.TextColor3 = Color3.fromRGB(255, 255, 255)
backButton.Font = Enum.Font.LexendDeca
backButton.TextSize = 18

-- Function to show Executor GUI
local function showExecutorGui()
    homeGui.Visible = false
    executorGui.Visible = true
end

-- Function to show Home GUI
local function showHomeGui()
    executorGui.Visible = false
    homeGui.Visible = true
end

-- Function to execute script from ScriptBox
local function executeScript()
    local scriptText = scriptBox.Text
    local loadstringFunction, errorMessage = loadstring(scriptText)
    if loadstringFunction then
        local success, result = pcall(loadstringFunction)
        if not success then
            warn("Error executing script: " .. result)
        end
    else
        warn("Error loading script: " .. errorMessage)
    end
end

-- Function to clear ScriptBox
local function clearScriptBox()
    scriptBox.Text = ""
end

-- Function to execute script from clipboard
local function executeClipboardScript()
    local clipboardText = game:GetService("ClipboardService"):GetText()
    local loadstringFunction, errorMessage = loadstring(clipboardText)
    if loadstringFunction then
        local success, result = pcall(loadstringFunction)
        if not success then
            warn("Error executing clipboard script: " .. result)
        end
    else
        warn("Error loading clipboard script: " .. errorMessage)
    end
end

-- Function to toggle sidebar visibility with slide animation
local function toggleSidebar()
    if sidebar.Position == UDim2.new(-0.2, 0, 0, 0) then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(sidebar, tweenInfo, {Position = UDim2.new(0, 0, 0, 0)})
        tween:Play()
    else
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(sidebar, tweenInfo, {Position = UDim2.new(-0.2, 0, 0, 0)})
        tween:Play()
    end
end

-- Function to hide sidebar with slide animation
local function hideSidebar()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(sidebar, tweenInfo, {Position = UDim2.new(-0.2, 0, 0, 0)})
    tween:Play()
end

-- Connect action buttons to functions
executeButton.MouseButton1Click:Connect(executeScript)
clearButton.MouseButton1Click:Connect(clearScriptBox)
executeClipboardButton.MouseButton1Click:Connect(executeClipboardScript)

-- Connect tab buttons to functions
homeTab.MouseButton1Click:Connect(showHomeGui)
executeTab.MouseButton1Click:Connect(showExecutorGui)

-- Connect toggle button to toggleSidebar function
toggleButton.MouseButton1Click:Connect(toggleSidebar)

-- Connect back button to hideSidebar function
backButton.MouseButton1Click:Connect(hideSidebar)

-- Make toggle button draggable
local function makeDraggable(gui)
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

makeDraggable(toggleButton)
