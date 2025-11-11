-- /components/Shape.lua

local Shape = {}
Shape.__index = Shape

--- Creates a new drawable shape
-- @param shapeType "rectangle" or "circle"
-- @param width The width of the shape
-- @param height The height (or radius for a circle)
-- @param color A table {r, g, b, a} with values from 0 to 1
function Shape:new(shapeType, width, height, color)
    local comp = setmetatable({}, Shape)
    
    comp.name = "shape"
    comp.gameObject = nil
    
    comp.shapeType = shapeType or "rectangle"
    comp.width = width or 50
    comp.height = height or 50
    comp.color = color or {1, 1, 1, 1} -- Default to white

    -- Offset for drawing, so x,y is the center
    comp.offsetX = comp.width / 2
    comp.offsetY = comp.height / 2

    return comp
end

function Shape:draw()
    -- Get the transform component from our owner
    local t = self.gameObject:transform()
    if not t then 
        print("WARN: Shape component has no Transform to draw at!")
        return 
    end

    -- Save the current graphics state
    love.graphics.push()
    
    -- Apply the full transform from the Transform component
    love.graphics.translate(t.x, t.y)
    love.graphics.rotate(t.angle)
    love.graphics.scale(t.scaleX, t.scaleY)
    
    -- Set the color
    local c = self.color
    love.graphics.setColor(c[1], c[2], c[3], c[4] or 1)

    -- Draw the shape centered at (0,0) relative to the transform
    if self.shapeType == "rectangle" then
        love.graphics.rectangle(
            "fill", 
            -self.offsetX, -- Draw from -width/2
            -self.offsetY, -- Draw from -height/2
            self.width, 
            self.height
        )
    elseif self.shapeType == "circle" then
        love.graphics.circle("fill", 0, 0, self.width / 2)
    end
    
    -- Reset color and transform state
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.pop()
end

return Shape
