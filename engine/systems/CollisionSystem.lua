local CollisionSystem = {}

function CollisionSystem.checkOverlap(entityA, entityB)
    local pA, cA = entityA.Position, entityA.Collider
    local pB, cB = entityB.Position, entityB.Collider

    local isSeperated = (pA.x + cA.width < pB.x or
        pB.x + cB.width < pA.x or
        pA.y + cA.height < pB.y or
        pB.y + cB.height < pA.y)

    return not isSeperated
end

return CollisionSystem
