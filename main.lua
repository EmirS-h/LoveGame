local Position = require "engine.components.Position"
local Velocity = require "engine.components.Velocity"
local Direction = require "engine.components.Direction"
local Collider = require "engine.components.Collider"

local MovementSystem = require "engine.systems.MovementSystem"
local RenderSystem = require "engine.systems.RenderSystem"
local InputSystem = require "engine.systems.InputSystem"
local CollisionSystem = require "engine.systems.CollisionSystem"

Player = {
    Position = Position.new(100, 100),
    Velocity = { maxSpeed = 200 },
    Direction = Direction.new(),
    Collider = Collider.new(50, 50)
}

Enemy = {
    Position = Position.new(100, 300),
    Velocity = { maxSpeed = 100 },
    Direction = Direction.new(1, 0),
    Collider = Collider.new(50, 50)
}

Entities = { Player, Enemy }

function love.load()
    print("Hello, Love2D!")
end

function love.update(dt)
    -- 1. Run Movement System
    for _, entity in ipairs(Entities) do
        entity.isColliding = false -- Reset collision state

        MovementSystem.run(entity, dt)
    end

    -- 2. Run Collision Detection (Nested Loop)
    for i, entityA in ipairs(Entities) do
        -- The inner loop must start at the index AFTER entityA
        for j = i + 1, #Entities do
            local entityB = Entities[j]

            -- Your collision check goes here
            if CollisionSystem.checkOverlap(entityA, entityB) then
                entityA.isColliding = true
                entityB.isColliding = true
            end
        end
    end
end

function love.draw()
    for _, entity in ipairs(Entities) do
        RenderSystem.draw(entity)
    end
end

function love.keypressed(key)
    InputSystem.handleMovement(Player, key)
end

function love.keyreleased(key)
    InputSystem.handleStop(Player, key)
end
