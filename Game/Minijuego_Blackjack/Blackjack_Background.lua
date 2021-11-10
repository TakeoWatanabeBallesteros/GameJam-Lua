Blackjack_Background = Actor:extend()

function Blackjack_Background:new(x,y)
    Blackjack_Background.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,1,0,0, 'Background')
end

function Blackjack_Background:update(dt)
    Blackjack_Background.super.update(self,dt)
end

function Blackjack_Background:draw()
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

return Blackjack_Background