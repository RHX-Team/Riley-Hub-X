loadstring(game:HttpGet("https://raw.githubusercontent.com/RHX-Team/Riley-Hub-X/main/GameList.lua"))()
for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end
