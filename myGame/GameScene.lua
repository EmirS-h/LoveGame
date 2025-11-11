local Scene = require("engine.classes.Scene")
local Player = require

local GameScene = {}
GameScene.__index = GameScene

function GameScene.new()
    local instance = Scene.new("GameScene")
    setmetatable(instance,Scene)
    return instance
end

function GameScene:load()
    print("Loaded GameScene")

    
end

