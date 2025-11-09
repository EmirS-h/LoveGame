local Scale = {}

function Scale.new(sx, sy)
    return {
        sx = sx or 1,
        sy = sy or 1
    }
end

return Scale
