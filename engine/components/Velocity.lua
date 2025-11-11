local Velocity = {}
Velocity.__index = Velocity

function Velocity:new(vx, vy)
    local comp = setmetatable({},Velocity)
    comp.name = "Velocity"
    comp.gameObject = nil

    comp.velocityX 

return Velocity
