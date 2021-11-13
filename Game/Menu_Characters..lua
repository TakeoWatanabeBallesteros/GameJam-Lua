Menu_Characters = Actor:extend()

function Menu_Characters:new()
    self.font = FONT_BUTTONS_BIG
    Menu_Characters.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Menu_Characters:update(dt)
    Suit.layout:reset(WW/2-WW/5/2, WH-100)
    if Suit.Button("ATRAS", {id=4}, Suit.layout:row(WW/5, WH/20)).hit then
        Main_FSM:changeState('menu')
    end
end

function Menu_Characters:draw()
    love.graphics.setFont(FONT_BUTTONS)
    love.graphics.setColor(255, 255, 255, 1)
    Suit.draw()
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