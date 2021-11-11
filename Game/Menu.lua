Menu = Actor:extend()

function Menu:new()
    love.mouse.setVisible(true)
    self.alpha = 0
    self.font = FONT_OTAKU_BUTTONS
    self.title = "NOMBRE DEL JUEGOS"
    --love.graphics.setFont(love.graphics.newFont("/Data/pong.ttf", 70))
    Menu.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Menu:update(dt)
    self.alpha = self.alpha < 1 and self.alpha + dt/1.5 or 1
    Suit.theme.color = {
        normal  = {bg = { 66/255, 66/255, 66/255, self.alpha}, fg = {188/255,188/255,188/255, self.alpha}},
        hovered = {bg = { 50/255,153/255,187/255, self.alpha}, fg = {255/255,255/255,255/255, self.alpha}},
        active  = {bg = {255/255,153/255,  0/255, self.alpha}, fg = {225/255,225/255,225/255, self.alpha}}
    }
    Suit.layout:reset(WW/2-(WW/5)/2, WH/2-(WW/20)*3/2)
    Suit.layout:padding(40)
    if Suit.Button("JUGAR", {id=1}, Suit.layout:row(WW/5, WH/20)).hit then
        Main_FSM:changeState('play')
    end
    if Suit.Button("AJUSTES", {id=2}, Suit.layout:row()).hit then
        Main_FSM:changeState('settings')
    end
    if Suit.Button("SALIR", {id=3}, Suit.layout:row()).hit then
        love.event.quit(0)
    end
end

function Menu:draw()
    love.graphics.setColor(255, 255, 255, self.alpha)
    love.graphics.print(
        self.title,
        FONT_OTAKU_TITLE,
        (WW * 0.5) - FONT_OTAKU_TITLE:getWidth(self.title) * 0.5,
         20 + FONT_OTAKU_TITLE:getHeight(self.title) * 0.5
        )
    Suit.draw()
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