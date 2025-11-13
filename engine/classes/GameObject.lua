local GameObject = {}
GameObject.__index = GameObject

-- The "constructor" for our class
-- NOTICE: x, y, width, and height are GONE
function GameObject:new()
    local obj = setmetatable({}, GameObject)

    obj.active = true
    obj.visible = true
    obj.components = {}

    return obj
end

-- This function is a helper to quickly get the transform,
-- since almost EVERY component will need it.
function GameObject:transform()
    return self.components["Transform"]
end

-- The rest of your functions (add, get, remove, update, draw)
-- are PERFECT. No changes needed.
function GameObject:add(component)
    -- ... (your code is correct) ...
    if not component.name then
        print("ERROR: Component added without a 'name' property.")
        return
    end
    self.components[component.name] = component
    component.gameObject = self
    if component.load then
        component:load()
    end
end

function GameObject:get(componentName)
    -- ... (your code is correct) ...
    return self.components[componentName]
end

function GameObject:remove(componentName)
    -- ... (your code is correct) ...
    local comp = self.components[componentName]
    if comp then
        if comp.unload then
            comp:unload()
        end
        comp.gameObject = nil
        self.components[componentName] = nil
    end
end

function GameObject:update(dt)
    -- ... (your code is correct) ...
    if not self.active then return end
    for name, component in pairs(self.components) do
        if component.update then
            component:update(dt)
        end
    end
end

function GameObject:draw()
    -- ... (your code is correct) ...
    if not self.visible then return end
    for name, component in pairs(self.components) do
        if component.draw then
            component:draw()
        end
    end
end

return GameObject
