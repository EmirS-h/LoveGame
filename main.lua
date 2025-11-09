local InputManager = require("engine.managers.InputManager")
local SceneManager = require("engine.managers.SceneManager")

function love.load()
    -- Make the managers global so all scenes can access them
    -- This is the simplest way to let your menu buttons
    -- call SceneManager.changeScene()

    -- Setup your input bindings
    InputManager.bindAction('ui_confirm', { 'return', 1 })
    InputManager.bindAction('move_left', { 'a', 'left' })
    InputManager.bindAction('move_right', { 'd', 'right' })

    -- 1. Add your scene *classes* to the manager
    -- (Notice we don't call .new() here)
    SceneManager.addScene('MainMenu', require('myGame.MenuScene'))
    -- SceneManager.addScene('Game', require('GameScene')) -- (You'll create this file)
    -- SceneManager.addScene('Options', require('OptionsScene')) -- (And this one, etc.)

    -- 2. Start the game by changing to the first scene
    SceneManager.changeScene('MainMenu')
end

-- All the functions below just delegate to the managers

function love.update(dt)
    -- Always update InputManager first
    InputManager.update()

    -- Then update the current scene
    SceneManager.update(dt)
end

function love.draw()
    SceneManager.draw()
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

-- function love.mousemoved(x, y, dx, dy)
--     InputManager.handleMousemoved(x, y, dx, dy)
--     -- Note: We didn't add onMouseMoved to our SceneManager,
--     -- but you could if your UI needs hover-move events.
-- end
