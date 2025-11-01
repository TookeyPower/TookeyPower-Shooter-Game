boxes = {
    {x = 50, y = 50, w = 500, h = 400, color = {0, 0, 0, 0.5}, text = "Speed Boost", cost = 50, description = "Permanently increases your movement speed."},
    {x = 50, y = 500, w = 500, h = 400, color = {0, 0, 0, 0.5}, text = "Piercing Bullets", cost = 100, description = "Bullets pass through enemies."}
}

buyBoxes = {
    {x = 50, y = 350, w = 100, h = 100, color = {0, 1, 0, 0.5}, text = "BUY", IsUnlocked = false, IsHover = false},
    {x = 50, y = 800, w = 100, h = 100, color = {0, 1, 0, 0.5}, text = "BUY", IsUnlocked = false, IsHover = false}
}

function shopStuff()
    if gameState == 'shop' then
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.rectangle("fill", 0, 0, 1920, 1080)
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Shop - Press B to go back", 0, 540 - 15, 1920, "center")
        love.graphics.print("Score: " .. score, 10, 1020)

        for i, box in ipairs(boxes) do
            love.graphics.setFont(love.graphics.newFont(24))
            love.graphics.setColor(box.color)
            love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
            love.graphics.setColor(1, 1, 1)
            love.graphics.printf(box.text, box.x + 10, box.y + 10, box.w - 20, "center")
            love.graphics.printf(box.description, box.x + 10, box.y + 40, box.w - 20, "left")
            love.graphics.printf("Cost: " .. box.cost .. " points", box.x, box.y + box.h - 40, box.w, "center")
        end

        for i, box in ipairs(buyBoxes) do
            love.graphics.setFont(love.graphics.newFont(48))
            love.graphics.setColor(box.color)
            love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
            love.graphics.setColor(1, 1, 1)
            love.graphics.printf(box.text, box.x, box.y + box.h / 2 - 20, box.w, "center")
        end
    end
end

function clickStuff(x, y)
    if gameState == 'shop' then
        for i, box in ipairs(buyBoxes) do
            if x > box.x and x < box.x + box.w and y > box.y and y < box.y + box.h then
                if i == 1 and score >= boxes[1].cost and not box.IsUnlocked then
                    score = score - boxes[1].cost
                    box.IsUnlocked = true
                    box.color = {0, 0, 1, 0.5}
                elseif i == 2 and score >= boxes[2].cost and not box.IsUnlocked then
                    score = score - boxes[2].cost
                    box.IsUnlocked = true
                    box.color = {0, 0, 1, 0.5}
                end
            end
        end
    end
end

function getHover()
    local x, y = love.mouse.getPosition()
    if gameState == 'shop' then
        for i, box in ipairs(buyBoxes) do
            if x > box.x and x < box.x + box.w and y > box.y and y < box.y + box.h then
                box.IsHover = true
                box.color = {1, 1, 0, 0.5}
                love.mouse.setCursor(love.mouse.getSystemCursor("hand"))
            else
                if not box.IsUnlocked then
                    box.IsHover = false
                    box.color = {0, 1, 0, 0.5}
                else
                    box.IsHover = false
                    box.color = {0, 0, 1, 0.5}
                end
            end
        end
    end
end