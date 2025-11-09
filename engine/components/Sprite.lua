local Sprite = {}
Sprite.__index = Sprite

function Sprite.new(imagePath, x, y)
    local image = love.graphics.newImage(imagePath)
    local instance = {
        image = image,
        x = x or 0,
        y = y or 0,
        width = image:getWidth(),
        height = image:getHeight(),
    }
    return setmetatable(instance, Sprite)
end

function Sprite:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

return Sprite
