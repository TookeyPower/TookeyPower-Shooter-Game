gameState = 'menu'
difficulty = 1

function initGame()
    gameState = 'menu'
    score = 0
    spawnTimer = 0
    spawnrate = 0.5
    difficulty = 1
    Projs = {}
    Enems = {}
end

function resetUpgrades()
    for i, box in ipairs(buyBoxes) do
        box.IsUnlocked = false
        box.color = {0, 1, 0, 0.5}
    end
end