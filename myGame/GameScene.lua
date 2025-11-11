local Scene = require("engine.classes.Scene")
local Player = require("myGame.gameObjects.Player")

local GameScene = {}
GameScene.__index = GameScene

local player

function GameScene.new()
    local instance = Scene.new("GameScene")
    setmetatable(instance,Scene)
    return instance
end

function GameScene:load()
    print("Loaded GameScene")

    player = Player:new()

    self:addGameObject(player)
end

return GameScene
