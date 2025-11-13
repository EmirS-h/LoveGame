local Transform = {}
Transform.__index = Transform

function Transform:new(x, y, angle, sx, sy)
    local comp = setmetatable({}, self)

    comp.name = "Transform"
    comp.gameObject = nil

    comp.x = x or 0
    comp.y = y or 0

    comp.angle = angle or 0

    comp.scaleX = sx or 1
    comp.scaleY = sy or 1

    return comp
end

return Transform
