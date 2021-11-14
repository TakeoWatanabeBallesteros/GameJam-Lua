Dormir_Manager = Actor:extend()
Dormir_Profe = require("Game/Minijuego_Dormir/Dormir_Profe")

function Dormir_Manager:new()
  Dormir_Manager.super.new(self,DORMIR_BACKGROUND,WW/2,WH/2,0,-1,0, 'Background')
  self.currentState = 'Espaldas'
  self.font = DORMIR_FONT
  self.profe = Dormir_Profe()
  self.pressed = false
  self.alpha = 1
  self.time = 120
  self.percent = 50
end

function Dormir_Manager:update(dt)
    if self.pressed then
        self.alpha = self.alpha > 0 and self.alpha - dt/3 or 0
    else self.alpha = self.alpha < 1 and self.alpha + dt/3 or 1 end
    if self.alpha == 0 then self.percent = self.percent < 100 and self.percent + dt or 100
    elseif self.alpha == 1 then self.percent = self.percent > 0 and self.percent - dt/3 or 0 end
    self.time = self.time > 0 and self.time - dt or 0
    self.profe:update(dt)
end

function Dormir_Manager:draw()
    love.graphics.setColor(255,255,255, self.alpha)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
    
    if self.currentState == 'Espaldas' then
        self.profe:draw(1)
    elseif self.currentState == 'Mirando' then
        self.profe:draw(2)
    elseif self.currentState == 'Enfado' then
        self.profe:draw(3)
    end
    
    love.graphics.setColor(255,0,0, self.alpha)
    love.graphics.print(
        math.floor(self.time),
        self.font,
        (WW/1.2) - self.font:getWidth(math.floor(self.time)) * 0.5,
        (WH/10)
        )
        love.graphics.print(
        math.floor(self.percent)..'%',
        self.font,
        (WW/1.2) - self.font:getWidth(math.floor(self.percent)..'%') * 0.5,
        (WH/10) + self.font:getHeight(math.floor(self.time))*1.5
        )
    love.graphics.setColor(255,255,255, self.alpha)
end

function Dormir_Manager:mousepressed( x, y, _button, istouch, presses )
end

function Dormir_Manager:mousereleased( x, y, _button, istouch, presses )
end

function Dormir_Manager:keypressed(_key)
    if _key == 'space' then
        self.pressed = true
    end
end

function Dormir_Manager:keyreleased(_key)
    if _key == 'space' then
        self.pressed = false
    end
end

return Dormir_Manager