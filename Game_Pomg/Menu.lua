--Takeo Watanabe y Jan de Nobel
Pong_Menu = Pong_Actor:extend()

local function newButton(text, fn)
    return {
        text = text,
        fn = fn,

        now = false,
        last = false
    }
end

function Pong_Menu:new()
    self.buttons = {}
    self.font = Pong_SETTINGS_FONT_BUTTONS
    self.title = Pong_SETTINGS_TITLE
    self.ap = false
    --love.graphics.setFont(love.graphics.newFont("/Data/pong.ttf", 70))
    Pong_Menu.super.new(self,Pong_DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    table.insert(self.buttons, newButton(
        "Start Game", 
        function()
            Pong_Director.goGame()
            Pong_SETTINGS_GAME_TYPE = true
            Pong_PVP = false
        end))
    table.insert(self.buttons, newButton(
        "Settings", 
        function()
            Pong_Director.goSettings()
        end))
    table.insert(self.buttons, newButton(
        "Exit", 
        function()
            --love.event.quit(0)
        end))
end

function Pong_Menu:update(dt)
end

function Pong_Menu:draw()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.print(
        self.title,
        Pong_SETTINGS_FONT_TITLE,
        (WW * 0.5) - Pong_SETTINGS_FONT_TITLE:getWidth(self.title) * 0.5,
         20 + Pong_SETTINGS_FONT_TITLE:getHeight(self.title) * 0.5
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

        

        

        button.now = love.mouse.isDown(1)
        if button.now and not button.last and hot and self.ap then
            button.fn()
            Pong_AudioManager.PlaySound(Pong_AUDIO_BUTTON_CLICK, .6, false)
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
function Pong_Menu:mousepressed( x, y, _button, istouch, presses )
    if _button == 1 then
        self.ap = true
    end
end

function Pong_Menu:mousereleased( x, y, _button, istouch, presses )
    if _button == 1 then
        self.ap = true
    end
end

return Pong_Menu