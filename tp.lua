-- Function to teleport a random player to the script's parent's position
local function teleportRandomPlayer()
    -- Get all players in the game
    local players = game:GetService("Players"):GetPlayers()
    
    -- Check if there are players in the game
    if #players > 1 then
        -- Choose a random player
        local randomIndex = math.random(1, #players)
        local randomPlayer = players[randomIndex]
        
        -- Teleport the random player to the script's parent's position
        local targetPosition = script.Parent.Position
        if targetPosition then
            randomPlayer.Character:MoveTo(targetPosition)
        else
            warn("Script parent does not have a position property.")
        end
    else
        print("There are not enough players in the game.")
    end
end

-- Execute the function
teleportRandomPlayer()
