Menu = Actor:extend()

function Menu:new()
    love.mouse.setVisible(true)
    self.alpha = 0
    self.font = FONT_TITLE
    self.title = "Tecnodates"
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
    Suit.layout:reset(WW/2-(WW/2.3)/2, WH/2.2-(WW/20)*3/2)
    love.graphics.setFont(FONT_BUTTONS)
    if Suit.Button("JUGAR", {id=1}, Suit.layout:row(WW/2.3, WH/20)).hit then
        Main_FSM:changeState('play')
    end
    Suit.layout:reset((WW/2-(WW/5)/2)-(WW/4.2/2), (WH/2.2-(WW/20)*3/2)+WH/10)
    if Suit.Button("PERSONAJES", {id=2}, Suit.layout:row(WW/4.8, WH/20)).hit then
        
    end
    Suit.layout:reset((WW/2-(WW/5)/2)+(WW/4.6)/2, (WH/2.2-(WW/20)*3/2)+WH/10)
    if Suit.Button("MINIJUEGOS", {id=3}, Suit.layout:row(WW/4.8, WH/20)).hit then
        
    end
    Suit.layout:reset((WW/2-(WW/5)/2)-(WW/4.2/2), (WH/2.2-(WW/20)*3/2)+(2*WH/10))
    if Suit.Button("AJUSTES", {id=4}, Suit.layout:row(WW/4.8, WH/20)).hit then
        Main_FSM:changeState('settings')
    end
    Suit.layout:reset((WW/2-(WW/5)/2)+(WW/4.6)/2, (WH/2.2-(WW/20)*3/2)+(2*WH/10))
    if Suit.Button("CREDITOS", {id=5}, Suit.layout:row(WW/4.8, WH/20)).hit then
        
    end
    Suit.layout:reset(WW/2-(WW/2.3)/2, (WH/2.2-(WW/20)*3/2)+(3*WH/10))
    if Suit.Button("SALIR", {id=6}, Suit.layout:row(WW/2.3, WH/20)).hit then
        love.event.quit(0)
    end
    Suit.layout:reset(WW/50, WH/1.07)
    if Suit.Button("ARTE DEL JUEGO", {id=7}, Suit.layout:row(WW/5, WH/20)).hit then
        love.window.minimize( )
        love.system.openURL("https://www.artstation.com/soradoesthings")
    end
    Suit.layout:reset(WW/1.28, WH/1.07)
    if Suit.Button("GITHUB", {id=8}, Suit.layout:row(WW/5, WH/20)).hit then
        love.window.minimize( )
        love.system.openURL("https://github.com/TakeoWatanabeBallesteros/GameJam-Lua")
    end
end

function Menu:draw()
    love.graphics.setColor(255, 255, 255, self.alpha)
    love.graphics.print(
        self.title,
        self.font,
        (WW/2) - self.font:getWidth(self.title) * 0.5,
         (WH/120) + self.font:getHeight(self.title) * 0.5
        )
    love.graphics.setColor(255, 255, 255, self.alpha)
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