Shove = require("engine.libs.shove")
InputManager = require("engine.managers.InputManager")
SceneManager = require("engine.managers.SceneManager")

function love.load()
    Shove.setResolution(640, 360, { fitMethod = "pixel", scalingFilter = "nearest", renderMode = "layer" })
    Shove.setWindowMode(1280, 720, { resizable = true })

    Shove.createLayer("baseLayer")

    InputManager.bindAction('close_game', { 'escape' })

    SceneManager.addScene('MainMenu', require('myGame.MenuScene'))
    SceneManager.addScene('GameScene', require('myGame.GameScene'))

    SceneManager.changeScene('MainMenu')
end

function love.update(dt)
    SceneManager.update(dt)

    if InputManager.isActionPressed('close_game') then
        love.event.quit()
    end

    InputManager.update()
end

function love.draw()
    Shove.beginDraw()
    Shove.beginLayer("baseLayer")
    SceneManager.draw()
    Shove.endLayer()
    Shove.endDraw()
end

function love.keypressed(key)
    SceneManager.onKeyPressed(key)
    InputManager.handleKeypressed(key)
end

function love.keyreleased(key)
    SceneManager.onKeyReleased(key)
    InputManager.handleKeyreleased(key)
end

function love.mousepressed(x, y, button, istouch)
    SceneManager.onMousePressed(x, y, button, istouch)
    InputManager.handleMousepressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
    SceneManager.onMouseReleased(x, y, button, istouch)
    InputManager.handleMousereleased(x, y, button, istouch)
end
