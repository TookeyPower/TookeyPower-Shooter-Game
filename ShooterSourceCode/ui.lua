function drawScore()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: " .. score, 10, 10)
end

function drawDifficulty()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Difficulty: " .. math.floor(difficulty), 10, 70)
end

function menuStuff()
    if gameState == 'menu' then
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.rectangle("fill", 0, 0, 1920, 1080)
        love.graphics.setColor(0, 0, 0)
        love.graphics.printf("SHOOT GAME", 0, 200, 1920, "center")
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Press SPACE to Play", 0, 540 - 15, 1920, "center")
    end
end

function gameStuff()
    if gameState == 'restart' then
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", 0, 0, 1920, 1080)
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Game Over! Press R to Restart", 0, 540 - 30, 1920, "center")
    end
end