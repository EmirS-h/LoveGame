local RenderSystem = {}

function RenderSystem.draw(entity)
    if entity.Position and entity.Collider then
        if entity.isColliding then
            love.graphics.setColor(1, 0, 0) -- Red for colliding
        else
            love.graphics.setColor(0, 1, 0) -- Green for normal
        end

        love.graphics.rectangle("fill", entity.Position.x, entity.Position.y, entity.Collider.width,
        entity.Collider.height)
    end
end

return RenderSystem
