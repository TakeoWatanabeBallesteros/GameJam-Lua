Characters_Selection = Actor:extend()

function Characters_Selection:new()
    self.font = FONT_BUTTONS_BIG
    Characters_Selection.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Characters_Selection:update(dt)
    Suit.layout:reset(WW/2-WW/5/2, WH-100)
    if Suit.Button("ATRAS", {id=4}, Suit.layout:row(WW/5, WH/20)).hit then
        Main_FSM:changeState('menu')
    end
end

function Characters_Selection:draw()
    love.graphics.setColor(255, 255, 255, 1)
    Suit.draw()
end

function Characters_Selection:mousepressed( x, y, _button, istouch, presses )
end

function Characters_Selection:mousereleased( x, y, _button, istouch, presses )
end

function Characters_Selection:keypressed(_key)
end

function Characters_Selection:keyreleased(_key)
end

return Characters_Selection