--Takeo Watanabe y Jan de Nobel
Menu_Avatar = Actor:extend()

function Menu_Avatar:new()
    love.mouse.setVisible(true)
    self.alpha = 0
    self.font = FONT_OTAKU_TITLE
    self.title = 'ESCOGE A TU PERDEDOR'
    Menu.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Menu_Avatar:update(dt)
    self.alpha = self.alpha < 1 and self.alpha + dt/1.5 or 1
    Suit.theme.color = {
        normal  = {bg = { 66/255, 66/255, 66/255, self.alpha}, fg = {188/255,188/255,188/255, self.alpha}},
        hovered = {bg = { 50/255,153/255,187/255, self.alpha}, fg = {255/255,255/255,255/255, self.alpha}},
        active  = {bg = {255/255,153/255,  0/255, self.alpha}, fg = {225/255,225/255,225/255, self.alpha}}
    }
    Suit.layout:reset(WW/2-(WW/1.05)/2, WH/6)
    Suit.layout:padding(40)
    if Suit.Button("Vacio", {id=1}, Suit.layout:row(WW/1.5, WH/5)).hit then
        print('ap')
    end
    if Suit.Button("Vacio", {id=2}, Suit.layout:row()).hit then
        
    end
    if Suit.Button("Vacio", {id=3}, Suit.layout:row()).hit then
        
    end
    Suit.layout:reset((WW/6/2)+WW/1.5, WH/1.33-(WH/19*3/2))
    Suit.layout:padding(50)
    if Suit.Button("CONTINUAR", {id=4}, Suit.layout:row(WW/6, WH/19)).hit then
        Main_FSM:changeState('editor')
    end
    if Suit.Button("BORRAR", {id=5}, Suit.layout:row()).hit then
        
    end
    if Suit.Button("MENU", {id=6}, Suit.layout:row()).hit then
        Main_FSM:changeState('menu')
    end
end

function Menu_Avatar:draw()
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

function Menu_Avatar:mousepressed( x, y, _button, istouch, presses )
end

function Menu_Avatar:mousereleased( x, y, _button, istouch, presses )
end

function Menu_Avatar:keypressed(_key)
end

function Menu_Avatar:keyreleased(_key)
end

return Menu_Avatar