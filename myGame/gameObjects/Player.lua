local GameObject = require("engine.classes.GameObject")
local Transform = require("engine.components.Transform")
local Shape = require("engine.components.Shape")

local Player = {}

function Player:new()
    local go = GameObject:new()

    go:addComponent(Shape:new())
    go:addComponent(Transform:new(50,50))

    return go
end

return Player