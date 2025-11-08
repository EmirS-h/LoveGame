local Button = require("engine.ui.Button")

Btn1 = Button.new(100, 100, "Click Me!", function()
    print("Button was clicked!")
end)


function love.load()
    love.graphics.setBackgroundColor(0.3, 0.3, 0.75)
end

function love.update(dt)
    Btn1:update(dt)
end

function love.draw()
    Btn1:draw()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.keyreleased(key)

end

function love.mousepressed(x, y, button, istouch)
    Btn1:onMousePressed(x, y, button)
end

function love.mousereleased(x, y, button, istouch)
    Btn1:onMouseReleased(x, y, button)
end

function love.quit()

end

function love.focus(f)
    if f then
        print("Game has gained focus")
    else
        print("Game has lost focus")
    end
end
