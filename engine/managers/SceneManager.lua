local SceneManager = {}

SceneManager.scenes = {}
SceneManager.currentScene = nil

function SceneManager.addScene(name, scene)
    SceneManager.scenes[name] = scene
end

function SceneManager.changeScene(name)
    if SceneManager.scenes[name] then
        SceneManager.currentScene = SceneManager.scenes[name]
    else
        error("Scene '" .. name .. "' does not exist.")
    end
end

function SceneManager.update(dt)
    if SceneManager.currentScene and SceneManager.currentScene.update then
        SceneManager.currentScene:update(dt)
    end
end

return SceneManager
