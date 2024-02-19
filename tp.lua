-- Exploit Script to Teleport a Random Player to Your Position
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to get a random player other than yourself
local function getRandomPlayer()
    local players = Players:GetPlayers()
    if #players <= 1 then return nil end -- Returns nil if you're the only player

    local randomPlayer
    repeat
        randomPlayer = players[math.random(1, #players)]
    until randomPlayer ~= LocalPlayer

    return randomPlayer
end

-- Teleport Function
local function teleportRandomPlayerToMe()
    local targetPlayer = getRandomPlayer()
    if not targetPlayer then
        warn("No valid player found to teleport.")
        return
    end

    local character = targetPlayer.Character
    local localCharacter = LocalPlayer.Character
    if character and localCharacter then
        local targetHumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local localHumanoidRootPart = localCharacter:FindFirstChild("HumanoidRootPart")

        if targetHumanoidRootPart and localHumanoidRootPart then
            targetHumanoidRootPart.CFrame = localHumanoidRootPart.CFrame
        else
            warn("Missing HumanoidRootPart for one of the characters.")
        end
    else
        warn("One of the characters is missing.")
    end
end

-- Usage with loadstring (Ensure your exploit tool supports loadstring execution)
local scriptCode = [[
    teleportRandomPlayerToMe()
]]
local execute = loadstring(scriptCode)
execute()
