local Transform = {}
Transform.__index = Transform

function Transform:new(x, y, angle, sx, sy)
    local comp = setmetatable({}, Transform)
    
    comp.name = "Transform" -- The name we'll use to get it
    comp.gameObject = nil
    
    -- Position
    comp.x = x or 0
    comp.y = y or 0
    
    -- Rotation
    comp.angle = angle or 0
    
    -- Scale
    comp.scaleX = sx or 1
    comp.scaleY = sy or 1

    return comp
end

return Transform
