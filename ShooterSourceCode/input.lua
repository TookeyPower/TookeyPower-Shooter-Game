function handleKeyPress(key)
    if gameState == 'menu' then
        if key == "space" then
            gameState = 'play'
        end
    elseif gameState == 'play' then
        if key == "space" then
            shoot()
        elseif key == "p" then
            gameState = 'shop'
        end
    elseif gameState == 'restart' then
        if key == "r" then
            gameState = 'play'
            char.x = 100
            char.y = 100
            Projs = {}
            Enems = {}
            score = 0
            difficulty = 1
            spawnTimer = 0
            resetUpgrades()
        end
    end

    if gameState == 'shop' and key == "b" then
        gameState = 'play'
    end
end

function updatePlay(dt)
    moveChar(dt)
    updateEnemies(dt)
    
    for i, proj in ipairs(Projs) do
        proj.x = proj.x + proj.spd * dt
        if proj.x > 1920 then
            table.remove(Projs, i)
        end
    end

    checkCollisions()
    checkPlayerDeath()
end