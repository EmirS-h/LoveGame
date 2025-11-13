-- We need to load the base Scene class to "inherit" from it
local SceneManager = require("engine.managers.SceneManager")
local Scene = require('engine.classes.Scene')
-- We need to load our Button class to create UI
local Button = require('engine.ui.Button')

-- 1. Create the new class and set up inheritance
local MainMenuScene = {}
MainMenuScene.__index = MainMenuScene
setmetatable(MainMenuScene, Scene) -- This is the inheritance part

-- 2. Create the 'new' constructor for this specific scene
function MainMenuScene.new()
    -- Call the base Scene.new() to get the default instance
    local instance = Scene.new("Main Menu")

    -- Set the metatable to our MainMenuScene
    setmetatable(instance, MainMenuScene)

    -- You could add new properties here if you wanted
    -- instance.backgroundImage = love.graphics.newImage('menu_bg.png')

    return instance
end

-- 3. Override the 'load' function to add menu-specific objects
function MainMenuScene:load()
    print("Main Menu Scene Loaded")

    -- Create a "Start Game" button
    local startButton = Button.new(150, 200, "Start Game", function() SceneManager.changeScene("GameScene") end)

    -- Create a "Quit" button
    local quitButton = Button.new(150, 300, "Quit Game")

    -- Add the buttons to this scene's uiElements list
    self:addUIElement(startButton)
    self:addUIElement(quitButton)
end

-- 4. Override the 'unload' function to clean up (optional)
function MainMenuScene:unload()
    print("Main Menu Scene Unloaded")

    -- Call the base class's unload function to clear the tables
    -- This uses our fix from earlier
    Scene.unload(self)
end

-- 5. Override the 'draw' function to add a background (optional)
function MainMenuScene:draw()
    -- Draw a simple background color
    love.graphics.clear(0.1, 0.1, 0.1)

    -- (Optional) Draw a background image
    -- if self.backgroundImage then
    --     love.graphics.draw(self.backgroundImage, 0, 0)
    -- end

    -- Call the base Scene:draw() to draw all
    -- gameObjects and uiElements on top of the background
    Scene.draw(self)
end

return MainMenuScene
