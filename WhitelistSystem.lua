local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- URL for the loadstring script
local loadstringUrl = "https://your-loadstring-url.com/script.lua" -- Replace with your actual loadstring URL

-- Whitelist system website URL and JSON link
local whitelistWebsiteUrl = "https://your-website.com/whitelist.html" -- Replace with your actual whitelist system website URL
local whitelistJsonLink = "https://your-website.com/whitelist.json" -- Replace with the URL where whitelist.json is hosted

-- Create GUI elements
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local statusLabel = Instance.new("TextLabel")
local copyLinkButton = Instance.new("TextButton")
local submitButton = Instance.new("TextButton")

-- Set properties for ScreenGui
screenGui.Name = "WhitelistGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Set properties for Frame
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- Set properties for Title Label
titleLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
titleLabel.Text = "Whitelist System"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.Parent = frame

-- Set properties for Status Label
statusLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
statusLabel.Position = UDim2.new(0.1, 0, 0.3, 0)
statusLabel.Text = "Status: Checking..."
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.TextScaled = true
statusLabel.Parent = frame

-- Set properties for Copy Link Button
copyLinkButton.Size = UDim2.new(0.4, 0, 0.1, 0)
copyLinkButton.Position = UDim2.new(0.1, 0, 0.5, 0)
copyLinkButton.Text = "Copy Whitelist System Link"
copyLinkButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
copyLinkButton.TextColor3 = Color3.new(1, 1, 1)
copyLinkButton.TextScaled = true
copyLinkButton.Parent = frame

-- Set properties for Submit Button
submitButton.Size = UDim2.new(0.4, 0, 0.1, 0)
submitButton.Position = UDim2.new(0.5, 0, 0.7, 0)
submitButton.Text = "Submit"
submitButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
submitButton.TextColor3 = Color3.new(1, 1, 1)
submitButton.TextScaled = true
submitButton.Parent = frame

-- Function to check whitelist status
local function checkWhitelist()
    statusLabel.Text = "Status: Checking..."

    -- Example: Check if player is whitelisted based on whitelistJsonLink
    local whitelisted = false
    local success, jsonData = pcall(function()
        return HttpService:GetAsync(whitelistJsonLink)
    end)

    if success then
        local whitelistData = HttpService:JSONDecode(jsonData)
        -- Implement logic to check if player is whitelisted based on whitelistData
        whitelisted = true -- Example: Assume whitelisted for demonstration
    else
        warn("Error loading JSON data:", jsonData)
    end

    if whitelisted then
        statusLabel.Text = "Status: Whitelisted!"
        wait(2) -- Optional delay to show the status before proceeding

        -- Redirect to whitelist system website
        player:Kick("You have been redirected to the Whitelist System website.")
        game:GetService("GuiService"):OpenBrowserWindow(whitelistWebsiteUrl)

        -- Load the loadstring script
        loadstring(game:HttpGet(loadstringUrl))()
    else
        statusLabel.Text = "Status: Not Found"
    end
end

-- Connect button click to checkWhitelist function
submitButton.MouseButton1Click:Connect(checkWhitelist)

-- Function to copy whitelist system link to clipboard
copyLinkButton.MouseButton1Click:Connect(function()
    local clipboard = game:GetService("GuiService"):GetClipboard()
    clipboard:Set(whitelistWebsiteUrl)
    print("Link copied to clipboard:", whitelistWebsiteUrl)
end)
