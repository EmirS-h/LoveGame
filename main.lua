Shove = require("engine.libs.shove")
InputManager = require("engine.managers.InputManager")
SceneManager = require("engine.managers.SceneManager")

function love.load()
    -- Initialize Shöve with fixed game resolution and options
    Shove.setResolution(800, 600, { fitMethod = "aspect", scalingFilter = "nearest" })
    -- Set up a resizable window
    Shove.setWindowMode(800, 600, { resizable = true })

    -- Setup your input bindings
    InputManager.bindAction('ui_confirm', { 'return', 1 })
    InputManager.bindAction('move_left', { 'a', 'left' })
    InputManager.bindAction('move_right', { 'd', 'right' })

    SceneManager.addScene('MainMenu', require('myGame.MenuScene'))
    SceneManager.addScene('GameScene', require('myGame.GameScene'))

    SceneManager.changeScene('MainMenu')
end

function love.update(dt)
    InputManager.update()

    SceneManager.update(dt)
end

function love.draw()
    Shove.beginDraw()
    SceneManager.draw()
    Shove.endDraw()
end

function love.keypressed(key)
    InputManager.handleKeypressed(key)
    SceneManager.onKeyPressed(key)
end

function love.keyreleased(key)
    InputManager.handleKeyreleased(key)
    SceneManager.onKeyReleased(key)
end

function love.mousepressed(x, y, button, istouch)
    InputManager.handleMousepressed(x, y, button, istouch)
    SceneManager.onMousePressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
    InputManager.handleMousereleased(x, y, button, istouch)
    SceneManager.onMouseReleased(x, y, button, istouch)
end
