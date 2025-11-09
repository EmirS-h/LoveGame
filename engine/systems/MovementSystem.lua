local MovementSystem = {}

function MovementSystem.run(entity, dt)
    local p = entity.Position
    local v = entity.Velocity
    local d = entity.Direction

    -- 1. Component Filtering: Check for all required components
    if p and v and d then
        local dirX, dirY = d.dirX, d.dirY
        local maxSpeed = v.maxSpeed

        -- 2. Calculate magnitude of the direction vector
        local magnitude = math.sqrt(dirX * dirX + dirY * dirY)

        -- 3. Apply movement only if the magnitude is not zero (i.e., player is moving)
        if magnitude ~= 0 then
            -- Calculate corrected speed components
            local vx = dirX / magnitude * maxSpeed
            local vy = dirY / magnitude * maxSpeed

            -- Apply the final position change
            p.x = p.x + vx * dt
            p.y = p.y + vy * dt
        end
    end
end

return MovementSystem
