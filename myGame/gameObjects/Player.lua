local GameObject = require("engine.classes.GameObject")
local Transform = require("engine.components.Transform")
local Shape = require("engine.components.Shape")

local Player = {}

function Player:new()
    local go = GameObject:new()

    go:add(Transform:new(150,300))
    go:add(Shape:new(nil,100,200))
    
    return go
end

return Player