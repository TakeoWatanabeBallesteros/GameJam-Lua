Menu_Characters = Actor:extend()

function Menu_Characters:new()
    self.font = FONT_BUTTONS_BIG
    Menu_Characters.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Menu_Characters:update(dt)
    Suit.layout:reset(WW/2-WW/5/2, WH-100)
    if Suit.Button("ATRAS", {id=7}, Suit.layout:row(WW/5, WH/20)).hit then
        Main_FSM:changeState('menu')
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_INFO_SILUETA.alex.normal, {id = 1, mask =    CHARACTERS_INFO_SILUETA.alex.mask, hovered = CHARACTERS_INFO_SILUETA.alex.hovered, active = CHARACTERS_INFO_SILUETA.alex.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_INFO_SILUETA.ricky.normal, {id = 2,   mask = CHARACTERS_INFO_SILUETA.ricky.mask, hovered = CHARACTERS_INFO_SILUETA.ricky.hovered, active = CHARACTERS_INFO_SILUETA.ricky.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_INFO_SILUETA.takeo.normal, {id = 3,   mask = CHARACTERS_INFO_SILUETA.takeo.mask, hovered = CHARACTERS_INFO_SILUETA.takeo.hovered, active = CHARACTERS_INFO_SILUETA.takeo.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_INFO_SILUETA.arnau.normal, {id = 4,   mask = CHARACTERS_INFO_SILUETA.arnau.mask, hovered = CHARACTERS_INFO_SILUETA.arnau.hovered, active = CHARACTERS_INFO_SILUETA.arnau.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_INFO_SILUETA.marina.normal, {id = 5, mask =  CHARACTERS_INFO_SILUETA.marina.mask, hovered = CHARACTERS_INFO_SILUETA.marina.hovered, active = CHARACTERS_INFO_SILUETA.marina.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_INFO_SILUETA.vero.normal, {id = 6,    mask = CHARACTERS_INFO_SILUETA.vero.mask, hovered = CHARACTERS_INFO_SILUETA.vero.hovered, active = CHARACTERS_INFO_SILUETA.vero.active}, Suit.layout:row(WW,WH)).hit then

    end
end

function Menu_Characters:draw()
    love.graphics.setBackgroundColor(230/255, 196/255, 214/255)
    love.graphics.setFont(FONT_BUTTONS)
    love.graphics.setColor(255, 255, 255, 1)
    Suit.draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = self.rot
    
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Menu_Characters:mousepressed( x, y, _button, istouch, presses )
end

function Menu_Characters:mousereleased( x, y, _button, istouch, presses )
end

function Menu_Characters:keypressed(_key)
end

function Menu_Characters:keyreleased(_key)
end



return Menu_Characters