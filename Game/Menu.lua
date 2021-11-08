--Takeo Watanabe y Jan de Nobel
Menu = Actor:extend()

function Menu:new()
    self.alpha = 0
    self.font = FONT_OTAKU_BUTTONS
    local b = Buttons(true,self.font)
    self.title = "NOMBRE DEL JUEGOS"
    --love.graphics.setFont(love.graphics.newFont("/Data/pong.ttf", 70))
    Menu.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    b:newButton(
        "Start Game", 
        function()
            Main_FSM:changeState('play')
        end)
    b:newButton(
        "Settings", 
        function()
            Main_FSM:changeState('settings')
        end)
    b:newButton(
        "Exit", 
        function()
            love.event.quit(0)
        end)
    Scene.getScene():addButton(b)
end

function Menu:update(dt)
    self.alpha = self.alpha < 1 and self.alpha + dt/1.5 or 1
end

function Menu:draw()
    love.graphics.setColor(255, 255, 255, self.alpha)
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
    
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Menu:mousepressed( x, y, _button, istouch, presses )
end

function Menu:mousereleased( x, y, _button, istouch, presses )
end

function Menu:keypressed(_key)
end

function Menu:keyreleased(_key)
end

return Menu