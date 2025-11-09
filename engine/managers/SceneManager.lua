local SceneManager = {}

SceneManager.scenes = {}        -- This will store the scene *classes*, not instances
SceneManager.currentScene = nil -- This will hold the one, active scene *instance*

-- Stores the scene class, ready to be created
function SceneManager.addScene(sceneName, sceneClass)
    if SceneManager.scenes[sceneName] then
        print("Warning: Scene '" .. sceneName .. "' already exists.")

        return
    end

    SceneManager.scenes[sceneName] = sceneClass
end

-- This function now handles creating the new scene
function SceneManager.changeScene(sceneName)
    local sceneClass = SceneManager.scenes[sceneName]

    if sceneClass then
        -- 1. Unload the old scene (if one exists)

        if SceneManager.currentScene and SceneManager.currentScene.unload then
            SceneManager.currentScene:unload()
        end
        -- 2. Create a *new instance* of the scene

        SceneManager.currentScene = sceneClass.new()

        -- 3. Load the new scene

        if SceneManager.currentScene.load then
            SceneManager.currentScene:load()
        end
    else
        error("Scene '" .. sceneName .. "' does not exist.")
    end
end

-- All the functions below are perfect.
-- They just delegate to the active scene instance.

function SceneManager.update(dt)
    if SceneManager.currentScene and SceneManager.currentScene.update then
        SceneManager.currentScene:update(dt)
    end
end

function SceneManager.draw()
    if SceneManager.currentScene and SceneManager.currentScene.draw then
        SceneManager.currentScene:draw()
    end
end

function SceneManager.onKeyPressed(key)
    if SceneManager.currentScene and SceneManager.currentScene.onKeyPressed then
        SceneManager.currentScene:onKeyPressed(key)
    end
end

function SceneManager.onKeyReleased(key)
    if SceneManager.currentScene and SceneManager.currentScene.onKeyReleased then
        SceneManager.currentScene:onKeyReleased(key)
    end
end

function SceneManager.onMousePressed(x, y, button, istouch)
    if SceneManager.currentScene and SceneManager.currentScene.onMousePressed then
        SceneManager.currentScene:onMousePressed(x, y, button, istouch)
    end
end

function SceneManager.onMouseReleased(x, y, button, istouch)
    if SceneManager.currentScene and SceneManager.currentScene.onMouseReleased then
        SceneManager.currentScene:onMouseReleased(x, y, button, istouch)
    end
end

return SceneManager
