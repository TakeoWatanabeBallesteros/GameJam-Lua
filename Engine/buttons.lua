Buttons = Object:extend()

function Buttons:new(font, Width, Height, margin)
    self.buttons = {}
    self.width = Width or WW * (1/3)
    self.height = Height or 64
    self.font = font
    self.ap = false
    self.margin = margin or true
end

function Buttons:update()
    local buttonHeigth = self.height
    local buttonWidth = self.width
    local margin = 16
    
    local totalHeight = (buttonHeigth + margin) * #self.buttons
    local cursorY = 0
    
    for i, button in ipairs(self.buttons) do
        button.last = button.now
    
        local bx = button.bx or (WW * 0.5)
        local by
        if self.margin then by = button.by or (WH * 0.5) - (totalHeight * 0.5) + cursorY
        else by = button.by or (WH * 0.5) end 

        bx = bx - (buttonWidth * 0.5)
    
        local color = {0.4, 0.4, 0.5, 1.0}
    
        local mx, my = love.mouse.getPosition()
    
        local hot = mx > bx and mx < bx + buttonWidth and
                    my > by and my < by + buttonHeigth
    
        if hot then
            color = {0.8, 0.8, 0.9, 1}
        end
    
        function love.mousepressed( x, y, _button, istouch, presses )
            if _button == 1 then
                self.ap = true
            end
        end
    
        function love.mousereleased( x, y, _button, istouch, presses )
            if _button == 1 then
                self.ap = true
            end
        end
    
        button.now = love.mouse.isDown(1)
        if button.now and not button.last and hot and self.ap then
            button.fn()
            AudioManager.PlaySound(AUDIO_BUTTON_CLICK, .6, false)
        end
    
        love.graphics.setColor(unpack(color))
        love.graphics.rectangle(
            "fill",
            bx,
            by,
            buttonWidth,
            buttonHeigth
        )
    
        love.graphics.setColor(0, 0, 0, 1)
    
        local textW = self.font:getWidth(button.text)
        local textH = self.font:getHeight(button.text)
        love.graphics.print(
            button.text,
            self.font,
            bx + buttonWidth * 0.5 - textW * 0.5,
            by + textH * 0.5
            )
    
        if self.margin then cursorY = cursorY + (buttonHeigth + margin) end
    end
end

function Buttons:newButton(text, fn, x, y)
    table.insert(self.buttons, {
        text = text,
        fn = fn,

        now = false,
        last = false,
        bx = x or nil,
        by = y or nil
    })
end

return Buttons

