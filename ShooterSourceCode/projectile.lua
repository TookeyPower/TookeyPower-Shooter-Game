projs = {}
projs.__index = projs
Projs = {}

function projs:new(x, y, w, h, spd, dmg)
    local obj = {}
    setmetatable(obj, projs)
    obj.x = x
    obj.y = y
    obj.w = w
    obj.h = h
    obj.spd = spd
    obj.dmg = dmg
    return obj
end

function projs:draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function shoot()
    local newProj = projs:new(char.x + 25, char.y + 25, 25, 5, 500, 1)
    table.insert(Projs, newProj)
end