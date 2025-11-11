local GameObject = {}
GameObject.__index = GameObject

-- The "constructor" for our class
function GameObject:new(x, y, width, height)
    -- Create a new instance table
    local obj = setmetatable({}, GameObject)

    -- Core properties
    obj.x = x or 0
    obj.y = y or 0
    obj.width = width or 0
    obj.height = height or 0
    
    obj.active = true
    obj.visible = true

    -- This is where we will store all components
    -- We use a map (key-value) for easy access by name
    obj.components = {}

    return obj
end

--- Adds a new component to the GameObject
-- @param component An instance of a component (e.g., Sprite, Collider)
function GameObject:add(component)
    if not component.name then
        print("ERROR: Component added without a 'name' property.")
        return
    end

    -- Store the component using its name as the key
    self.components[component.name] = component
    
    -- CRITICAL: Give the component a reference back to this GameObject
    -- This lets the component access its owner's x, y, width, etc.
    component.gameObject = self

    -- Call the component's 'load' function if it has one
    if component.load then
        component:load()
    end
end

--- Gets a component by its name
-- @param componentName (string) The name of the component (e.g., "sprite")
-- @return The component instance or nil
function GameObject:get(componentName)
    return self.components[componentName]
end

--- Removes a component by its name
-- @param componentName (string) The name of the component
function GameObject:remove(componentName)
    local comp = self.components[componentName]
    if comp then
        -- Call an 'unload' function if the component has one
        if comp.unload then
            comp:unload()
        end
        -- Remove the reference to the owner
        comp.gameObject = nil
        -- Remove from the components table
        self.components[componentName] = nil
    end
end

--- Called by LÖVE's main update loop
-- This function simply delegates the update to all attached components
function GameObject:update(dt)
    if not self.active then return end

    for name, component in pairs(self.components) do
        if component.update then
            component:update(dt)
        end
    end
end

--- Called by LÖVE's main draw loop
-- This function delegates the drawing to all attached components
function GameObject:draw()
    if not self.visible then return end

    for name, component in pairs(self.components) do
        if component.draw then
            component:draw()
        end
    end
end

return GameObject
