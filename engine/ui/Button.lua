local Button = {}

Button.__index = Button

function Button.new(x, y, text, onPressed)
    local instance = {
        text = text or "Button",
        x = x or 0,
        y = y or 0,
        width = 100,
        height = 50,
        onPressed = onPressed or function() print("Button has no onClickHandler") end,
        isBeingHovered = false,
        isBeingHeldDown = false,
    }
    return setmetatable(instance, Button)
end

function Button:draw()
    -- 1. Set the color based on the button's state
    if self.isBeingHeldDown then
        love.graphics.setColor(0.4, 0.4, 0.4) -- Dark gray (when pressed)
    elseif self.isBeingHovered then
        love.graphics.setColor(0.7, 0.7, 0.7) -- Light gray (when hovered)
    else
        love.graphics.setColor(1, 1, 1)       -- White (normal)
    end

    -- 2. Draw the button
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, 4)
    love.graphics.printf(self.text, self.x, self.y + (self.height / 2) - 10, self.width, "center")

    -- 3. Reset the color to white so we don't affect
    --    other things being drawn after this button.
    love.graphics.setColor(1, 1, 1)
end

function Button:update(dt)
    if self:isHovered(love.mouse.getX(), love.mouse.getY()) then
        self.isBeingHovered = true
    else
        self.isBeingHovered = false
    end
end

function Button:isHovered(px, py)
    return px >= self.x and px <= self.x + self.width and
        py >= self.y and py <= self.y + self.height
end

function Button:onMousePressed(x, y, button, istouch)
    if button == 1 and self.isBeingHovered then
        self.onPressed()
        self.isBeingHeldDown = true
        return
    end
end

function Button:onMouseReleased(x, y, button, istouch)
    if button == 1 and self.isBeingHeldDown then
        self.isBeingHeldDown = false
        print("Mouse button released on button")
    end
end

return Button
