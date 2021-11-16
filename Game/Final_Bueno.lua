Final_Bueno = Actor:extend()

function Final_Bueno:new()
    Final_Bueno.super.new(self,WIN_BACKGROUND.WHO,WW/2,WH/2,0,0,0, 'HUD')
end

function Final_Bueno:update()
end

function Final_Bueno:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    love.graphics.draw(WIN_BACKGROUND[WHO],0,0,rr,sx,sy,ox,oy,0,0)
end

function Final_Bueno:mousepressed( x, y, _button, istouch, presses )
    if _button == 1 then Main_FSM:changeState('credits') end
end

function Final_Bueno:mousereleased( x, y, _button, istouch, presses )
end

function Final_Bueno:keypressed(_key)
    if _key == 'space' then Main_FSM:changeState('credits') end
end

function Final_Bueno:keyreleased(_key)
end

return Final_Bueno