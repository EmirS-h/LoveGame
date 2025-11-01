local InputSystem = {}

function InputSystem.handleMovement(entity, key)
    if key == "w" then
        entity.Direction.dirY = -1
    end

    if key == "a" then
        entity.Direction.dirX = -1
    end

    if key == "s" then
        entity.Direction.dirY = 1
    end

    if key == "d" then
        entity.Direction.dirX = 1
    end
end

function InputSystem.handleStop(entity, key)
    if key == "w" then
        entity.Direction.dirY = 0
    end
    if key == "a" then
        entity.Direction.dirX = 0
    end
    if key == "s" then
        entity.Direction.dirY = 0
    end
    if key == "d" then
        entity.Direction.dirX = 0
    end
end

return InputSystem
