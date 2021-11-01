--Takeo Watanabe y Jan de Nobel
Menu = Actor:extend()

local function newButton(text, fn)
    return {
        text = text,
        fn = fn,

        now = false,
        last = false
    }
end

function Menu:new()
    self.buttons = {}
    self.font = FONT_OTAKU_BUTTONS
    self.title = "NOMBRE DEL JUEGOS"
    self.ap = false
    --love.graphics.setFont(love.graphics.newFont("/Data/pong.ttf", 70))
    Menu.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    table.insert(self.buttons, newButton(
        "Start Game", 
        function()
            Main_FSM:changeState('play')
        end))
    table.insert(self.buttons, newButton(
        "Settings", 
        function()
            Main_FSM:changeState('settings')
        end))
    table.insert(self.buttons, newButton(
        "Exit", 
        function()
            love.event.quit(0)
        end))
end

function Menu:update(dt)
end

function Menu:draw()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.print(
        self.title,
        FONT_OTAKU_TITLE,
        (WW * 0.5) - FONT_OTAKU_TITLE:getWidth(self.title) * 0.5,
         20 + FONT_OTAKU_TITLE:getHeight(self.title) * 0.5
        )

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot

    local buttonHeigth = 64
    local buttonWidth = WW * (1/3)
    local margin = 16

    local totalHeight = (buttonHeigth + margin) * #self.buttons
    local cursorY = 0

    for i, button in ipairs(self.buttons) do
        button.last = button.now

        local bx = (WW * 0.5) - (buttonWidth * 0.5)
        local by = (WH * 0.5) - (totalHeight * 0.5) + cursorY

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
            (WW * 0.5) - textW * 0.5,
             by + textH * 0.5
            )

        cursorY = cursorY + (buttonHeigth + margin)
    end
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Menu