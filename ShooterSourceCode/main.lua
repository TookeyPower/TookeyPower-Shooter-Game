function love.load()
    love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
    love.window.setMode(1920, 1080)
    local sfont = love.graphics.newFont(60)
    love.graphics.setFont(sfont)
    
    require("gamestate")
    require("player")
    require("projectile")
    require("enemy")
    require("shop")
    require("ui")
    require("input")
    
    initGame()
end

function love.update(dt)
    if gameState == 'play' then
        updatePlay(dt)
    elseif gameState == 'restart' then
        -- restart doesn't update
    end
    borderCheck()
    getHover()
end

function love.draw()
    if gameState == 'menu' then
        menuStuff()
    elseif gameState == 'play' then
        drawChar()
        for i, proj in ipairs(Projs) do
            proj:draw()
        end
        for i, enemy in ipairs(Enems) do
            enemy:draw()
        end
        drawScore()
        drawDifficulty()
    elseif gameState == 'restart' then
        drawChar()
        for i, proj in ipairs(Projs) do
            proj:draw()
        end
        for i, enemy in ipairs(Enems) do
            enemy:draw()
        end
        drawScore()
        gameStuff()
        drawDifficulty()
    end
    if gameState == 'shop' then
        shopStuff()
    end
end

function love.keypressed(key)
    handleKeyPress(key)
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        clickStuff(x, y)
    end
end