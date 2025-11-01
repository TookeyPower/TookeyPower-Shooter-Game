enems = {}
enems.__index = enems
Enems = {}

function enems:new(x, y, w, h, spd, hp)
    local obj = {}
    setmetatable(obj, enems)
    obj.x = x
    obj.y = y
    obj.w = w
    obj.h = h
    obj.spd = spd
    obj.hp = hp
    obj.spawnrate = spawnrate
    return obj
end

function enems:draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function updateEnemies(dt)
    difficulty = difficulty + dt * 0.1
    spawnTimer = spawnTimer + dt
    
    if spawnTimer >= spawnrate then
        spawnTimer = 0
        local newEnemy = enems:new(1920, math.random(50, 1030), 50, 50, 150 * difficulty)
        table.insert(Enems, newEnemy)
    end

    for i, enemy in ipairs(Enems) do
        enemy.x = enemy.x - enemy.spd * dt
        if enemy.x + enemy.w < 0 then
            table.remove(Enems, i)
            score = 0
        end
    end
end

function checkCollisions()
    for i, proj in ipairs(Projs) do
        for j, enemy in ipairs(Enems) do
            if proj.x < enemy.x + enemy.w and
               proj.x + proj.w > enemy.x and
               proj.y < enemy.y + enemy.h and
               proj.y + proj.h > enemy.y then
                score = score + 1
                table.remove(Enems, j)
                if not buyBoxes[2].IsUnlocked then
                    table.remove(Projs, i)
                end
                break
            end
        end
    end
end

function checkPlayerDeath()
    for i, enemy in ipairs(Enems) do
        if char.x < enemy.x + enemy.w and
           char.x + 50 > enemy.x and
           char.y < enemy.y + enemy.h and
           char.y + 50 > enemy.y then
            score = 0
            table.remove(Enems, i)
            gameState = 'restart'
            difficulty = 1
            resetUpgrades()
            break
        end
    end

    for i, enemy in ipairs(Enems) do
        if enemy.x < 0 then
            score = 0
            table.remove(Enems, i)
            gameState = 'restart'
            difficulty = 1
            resetUpgrades()
            break
        end
    end
end