Final_Malo = Actor:extend()

function Final_Malo:new()
    Final_Malo.super.new(self,LOSE_BACKGROUND.WHO,WW/2,WH/2,0,0,0, 'HUD')
end

function Final_Malo:update()
end

function Final_Malo:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Final_Malo:mousepressed( x, y, _button, istouch, presses )
end

function Final_Malo:mousereleased( x, y, _button, istouch, presses )
end

function Final_Malo:keypressed(_key)
    if _key == 'space' then Main_FSM:changeState('menu') end
end

function Final_Malo:keyreleased(_key)
end

return Final_Malo