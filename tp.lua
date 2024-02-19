-- Function to teleport a random player to the executor of the script
local function teleportRandomPlayer()
    -- Get all players in the game
    local players = game:GetService("Players"):GetPlayers()
    
    -- Check if there are players in the game
    if #players > 1 then
        -- Choose a random player
        local randomIndex = math.random(1, #players)
        local randomPlayer = players[randomIndex]
        
        -- Teleport the random player to the executor of the script
        randomPlayer.Character:MoveTo(script.Parent.Position)
        
        -- Notify the player they've been teleported
        local notification = Instance.new("Message")
        notification.Text = "You've been teleported!"
        notification.Parent = randomPlayer.PlayerGui
        
        -- Optional: You can add a delay and then remove the notification
        wait(3)
        notification:Destroy()
    else
        print("There are not enough players in the game.")
    end
end

-- Execute the function
teleportRandomPlayer()
