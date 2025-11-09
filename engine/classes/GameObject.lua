local GameObject = {}
GameObject.__index = GameObject

function GameObject.new(x, y)
    local instance = {
        x = x or 0,
        y = y or 0,
        components = {},
    }
    return setmetatable(instance, GameObject)
end

function GameObject:addComponent(component)
    table.insert(self.components, component)
end

function GameObject:removeComponent(component)
    for i, comp in ipairs(self.components) do
        if comp == component then
            table.remove(self.components, i)
            return
        end
    end
end

function GameObject:update(dt)
    for _, component in ipairs(self.components) do
        if component.update then
            component:update(dt)
        end
    end
end

function GameObject:draw()
    for _, component in ipairs(self.components) do
        if component.draw then
            component:draw()
        end
    end
end

return GameObject
