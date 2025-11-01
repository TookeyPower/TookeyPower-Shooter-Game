char = { x = 100, y = 100, spd = 300 }

function borderCheck()
    if char.x < 0 then char.x = 0 end
    if char.y < 0 then char.y = 0 end
    if char.x > 1920 - 50 then char.x = 1920 - 50 end
    if char.y > 1080 - 50 then char.y = 1080 - 50 end
end

function drawChar()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", char.x, char.y, 50, 50)
end

function moveChar(dt)
    if love.keyboard.isDown("w") then char.y = char.y - char.spd * dt end
    if love.keyboard.isDown("s") then char.y = char.y + char.spd * dt end
    if love.keyboard.isDown("a") then char.x = char.x - char.spd * dt end
    if love.keyboard.isDown("d") then char.x = char.x + char.spd * dt end
    
    if love.keyboard.isDown("lshift") then char.spd = 600 else char.spd = 400 end
    if love.keyboard.isDown("lshift") and buyBoxes[1].IsUnlocked then char.spd = 800 end
end

function getCharX() return char.x end
function getCharY() return char.y end
function setCharPos(x, y) char.x = x char.y = y end