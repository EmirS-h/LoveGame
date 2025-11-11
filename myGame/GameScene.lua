local Scene = require("engine.classes.Scene")

local GameScene = {}
GameScene.__index = GameScene

function GameScene.new()
    local instance = Scene.new("GameScene")
    setmetatable(instance,Scene)
    return instance
end