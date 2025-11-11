local GameObject = require("engine.classes.GameObject")
local Transform = require("engine.components.Transform")
local Shape = require("engine.components.Shape")

local Player = {}

function Player:new()
    local go = GameObject:new()

    go:add(Transform:new(50,50))
    go:add(Shape:new())
    

    return go
end

return Player