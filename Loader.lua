wait(1.2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/RileyBeeOrion/Riley-Hub-X/main/GameList.lua"))()
for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end
game.StarterGui:SetCore("SendNotification", {
Title = "Riley Hub X",
Text = "Riley Hub X Has Loaded",
Duration = 5,
})
game.StarterGui:SetCore("SendNotification", {
Title = "Riley Hub X",
Text = "Riley Hub X Might Not Support The Game You Are Playing",
Duration = 5,
})
