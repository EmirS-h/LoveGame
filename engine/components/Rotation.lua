local Rotation = {}

function Rotation.new(angle)
    return {
        angle = angle or 0
    }
end

return Rotation
