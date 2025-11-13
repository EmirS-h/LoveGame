local Button = {}

Button.__index = Button

function Button.new(x, y, text, onPressed, onReleased, onMouseEnter, onMouseLeave)
    local instance = {
        text = text or "Button",
        x = x or 0,
        y = y or 0,
        width = 100,
        height = 50,
        borderRadius = 4,
        isBeingHovered = false,
        isBeingHeldDown = false,
        onPressed = onPressed or function() print(text .. " has no onPressedHandler") end,
        onReleased = onReleased or function() print(text .. " has no onReleasedHandler") end,
        onMouseEnter = onMouseEnter or function() print(text .. " has no onMouseOverHandler") end,
        onMouseLeave = onMouseLeave or function() print(text .. " has no onMouseLeaveHandler") end,
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
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, self.borderRadius)
    love.graphics.printf(self.text, self.x, self.y + (self.height / 2) - 10, self.width, "center")

    -- 3. Reset the color to white so we don't affect
    --    other things being drawn after this button.
    love.graphics.setColor(1, 1, 1)
end

function Button:update(dt)
    local mouseInViewport, mx, my = Shove.mouseToViewport()
    -- 1. Check the mouse's current hover status
    local isHovered = self:isHovered(mx, my)

    -- 2. Compare current status to the stored state
    if isHovered then
        -- Mouse is currently over the button
        if self.isBeingHovered == false then
            -- It *just entered* this frame
            self.onMouseEnter()
            self.isBeingHovered = true
        end
        -- (If isHovered is true and was already true, do nothing)
    else
        -- Mouse is NOT currently over the button
        if self.isBeingHovered == true then
            -- It *just left* this frame
            self.onMouseLeave()
            self.isBeingHovered = false
        end
        -- (If isHovered is false and was already false, do nothing) section.
        -- Also, if the mouse leaves while being held down, reset the held state
        if self.isBeingHeldDown then
            self.isBeingHeldDown = false
        end
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
        if self.isBeingHovered then
            self.onReleased()
        end
        self.isBeingHeldDown = false
    end
end

function Button:onKeyPressed(key)

end

function Button:onKeyReleased(key)

end

return Button
