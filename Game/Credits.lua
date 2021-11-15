Credits = Actor:extend()

function Credits:new()
    Credits.super.new(self,CREDITS,WW/2,0,0,0,0, 'Front', true)
    self.speed = 50
end

function Credits:update(dt)
    self.position.y = self.position.y - dt * self.speed
    if self.position.y <= -4000+WH then Main_FSM:changeState('menu') end
end

function Credits:draw(sprite)
    love.graphics.setColor(255, 255, 255, 1)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = 1
    local rr = 0
    love.graphics.draw(self.image,WW/2,yy,rr,sx,sy,ox,oy,0,0)
end

function Credits:mousepressed( x, y, _button, istouch, presses )
end

function Credits:mousereleased( x, y, _button, istouch, presses )
end

function Credits:keypressed(_key)
    if _key == 'escape' then Main_FSM:changeState('menu') end
    if _key == 'space' then self.speed = 120 end
end

function Credits:keyreleased(_key)
    if _key == 'space' then self.speed = 50 end
end

return Credits