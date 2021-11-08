Buttons = Object:extend()

function Buttons:new(fade, font, Width, Height, margin)
    if fade then self.alpha = 0 else self.alpha = 1 end
    self.buttons = {}
    self.width = Width or WW * (1/3)
    self.height = Height or 64
    self.font = font
    self.ap = false
    self.margin = margin or true
    self.layer = "Buttons"
end


function Buttons:update(dt)
    self.alpha = self.alpha < 1 and self.alpha + dt/1.5 or 1
end

function Buttons:draw() 
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
    
        local color = {0.4, 0.4, 0.5, self.alpha}
    
        local mx, my = love.mouse.getPosition()
    
        local hot = mx > bx and mx < bx + buttonWidth and
                    my > by and my < by + buttonHeigth
    
        if hot then
            color = {0.8, 0.8, 0.9, self.alpha}
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
    
        love.graphics.setColor(0, 0, 0, self.alpha)
    
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

function Buttons:mousepressed( x, y, _button, istouch, presses )
        if _button == 1 then
            self.ap = true
        end
end

function Buttons:mousereleased( x, y, _button, istouch, presses )
        if _button == 1 then
            self.ap = true
        end
end

function Buttons:keypressed(_key)
end

function Buttons:keyreleased(_key)
end

return Buttons

