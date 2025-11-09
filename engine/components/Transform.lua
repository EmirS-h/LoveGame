local Transform = {}

function Transform.new(position, rotation, scale)
    return
    {
        position = position or { x = 0, y = 0 },
        rotation = rotation or 0,
        scale = scale or { sx = 1, sy = 1 }
    }
end

return Transform
