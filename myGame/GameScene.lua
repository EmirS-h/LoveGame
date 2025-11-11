local Scene = require("engine.classes.Scene")
local Player = require("myGame.gameObjects.Player")

local GameScene = {}
GameScene.__index = GameScene
setmetatable(GameScene,Scene)
local player

function GameScene.new()
    local instance = Scene.new("GameScene")
    setmetatable(instance,GameScene)
    return instance
end

function GameScene:load()
    print("Loaded GameScene")

    player = Player:new()

    self:addGameObject(player)
end

function GameScene:draw()
    love.graphics.clear(1,0,0)
    Scene.draw(self)
end

return GameScene
