Menu_Minigames = Actor:extend()

function Menu_Minigames:new()
    self.font = FONT_BUTTONS_BIG
    Menu_Minigames.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Menu_Minigames:update(dt)
    Suit.layout:reset(WW/2-WW/5/2, WH-100)
    if Suit.Button("ATRAS", {id=4}, Suit.layout:row(WW/5, WH/20)).hit then
        Main_FSM:changeState('menu')
    end
end

function Menu_Minigames:draw()
    love.graphics.setFont(FONT_BUTTONS)
    love.graphics.setColor(255, 255, 255, 1)
    Suit.draw()
end

function Menu_Minigames:mousepressed( x, y, _button, istouch, presses )
end

function Menu_Minigames:mousereleased( x, y, _button, istouch, presses )
end

function Menu_Minigames:keypressed(_key)
end

function Menu_Minigames:keyreleased(_key)
end

return Menu_Minigames