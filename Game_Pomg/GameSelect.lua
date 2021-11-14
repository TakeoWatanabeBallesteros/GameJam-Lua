--Takeo Watanabe y Jan de Nobel
Pong_GameSelect = Pong_Actor:extend()

local u

local function newButton(text, fn)
    return {
        text = text,
        fn = fn,

        now = false,
        last = false,
        enabled = false
    }
end

function Pong_GameSelect:new()
    self.buttons = {}
    self.font = SETTINGS_FONT_BUTTONS
    self.ap = false
    --love.graphics.setFont(love.graphics.newFont("/Data/pong.ttf", 70))
    Pong_GameSelect.super.new(self,Pong_DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    table.insert(self.buttons, newButton(
        "PvE", 
        function(i)
            self.buttons[u].enabled = true
            u = u==1 and 2 or 1
            self.buttons[u].enabled = false
            Pong_PVP = false
        end))
    table.insert(self.buttons, newButton(
        "BEST OF 5", 
        function()
            Pong_Director.goGame()
            Pong_SETTINGS_GAME_TYPE = 5
        end))
    table.insert(self.buttons, newButton(
        "BEST OF 10", 
        function()
            Pong_Director.goGame()
            Pong_SETTINGS_GAME_TYPE = 10
        end))
        table.insert(self.buttons, newButton(
        "TIME TRIAL", 
        function()
            Pong_Director.goGame()
            Pong_SETTINGS_GAME_TYPE = true
        end))
        table.insert(self.buttons, newButton(
        "Go Menu", 
        function()
            Pong_Director.goMenu()
        end))
end

function Pong_GameSelect:update(dt)
end

function Pong_GameSelect:draw()
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
        u = i 

        local bx = (WW * 0.5) - (buttonWidth * 0.5)
        local by = (WH * 0.5) - (totalHeight * 0.5) + cursorY

        if i == 1 then
            bx = bx - bx/2 - margin
            by = by + by + margin+4
        elseif i == 2 then bx = bx + bx/2 + margin end

        local color = {0.4, 0.4, 0.5, 1.0}

        local mx, my = love.mouse.getPosition()

        local hot = mx > bx and mx < bx + buttonWidth and
                    my > by and my < by + buttonHeigth


        if hot then
            color = {0.8, 0.8, 0.9, 1}
        elseif button.enabled then color = {0.8, 0.8, 0.9, 1}
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
        if button == 1 and hot and (i == 1 or i == 2) and 
        button.now and not button.last then
            button.fn(i)
            Pong_AudioManager.PlaySound(Pong_AUDIO_BUTTON_CLICK, .6, false)
        elseif button.now and not button.last and hot then
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
            (bx+buttonWidth*.5) - textW * 0.5,
             by + textH * 0.5
            )

        cursorY = cursorY + (buttonHeigth + margin)
    end
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
    cursorY = cursorY + (buttonHeigth + margin)
end

return Pong_GameSelect



