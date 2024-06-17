local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("Riley Hub X")

local KillingCheats = PhantomForcesWindow:NewSection("Auto Parry")


KillingCheats:CreateToggle("Auto Parry", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/datshort1/DatModProVjp/main/AutoParry"))()
end)

KillingCheats:CreateToggle("Auto Parry V2", function()
getgenv().config = getgenv().config or {
    hit_time = 0.5, -- // recommended 0.25 to 0.75 \ --
    
    mode = 'Always', -- // Hold , Toggle , Always \ --
    deflect_type = 'Remote', -- // Key Press , Remote \ --
    notifications = true,
    keybind = Enum.KeyCode.V
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()
end)

KillingCheats:CreateToggle("Auto Parry V3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/autoparry.lua"))()
end)

local AutoClash = PhantomForcesWindow:NewSection("Auto Clash")

AutoClash:CreateToggle("Auto Clash", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/datshort1/DatModProVjp/main/AutoClash"))()
end)

AutoClash:CreateToggle("Auto Clash V2", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/datshort1/AutoParryGod/main/main"))()
end)

AutoClash:CreateToggle("Auto Clash V3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/datshort1/datmodhub/main/AutoClash"))()
end)
