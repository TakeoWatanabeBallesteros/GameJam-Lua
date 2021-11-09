Minijuego_Blackjack_Background = Actor:extend()

function Minijuego_Blackjack_Background:new(x,y)
    Minijuego_Blackjack_Background.super.new(self,SETTINGS_FIELD_SPRITE,WW/2,WH/2,1,0,0, 'Background')
end

function Minijuego_Blackjack_Background:update(dt)
    Minijuego_Blackjack_Background.super.update(self,dt)
end

function Field:draw()
  love.graphics.setColor(255, 255, 255, 1)
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Field