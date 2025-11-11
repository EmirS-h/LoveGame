local GameObject = require("engine.classes.GameObject")
local Transform = require("engine.components.Transform")
local Shape = require("engine.components.Shape")
-- Require our new behavior
local ScreenBounce = require("engine.components.ScreenBounce")

local Player = {}

function Player:new()
    local go = GameObject:new()

    -- 1. Add Transform (Position)
    go:add(Transform:new(150, 300))

    -- 2. Add Shape (Visuals) - Red Rectangle
    -- (type, width, height, color)
    go:add(Shape:new("rectangle", 50, 50, {0, 0, 1}))
    
    -- 3. Add Behavior (Logic)
    -- Give it X velocity of 200 and Y velocity of 150
    go:add(ScreenBounce:new(200, 150))
    
    return go
end

return Player
