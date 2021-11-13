Beatemup_Background = Actor:extend()

function BeatemUp_Background:new(x,y)
    BeatemUp_Background.super.new(self,BLACKJACK_BACKGROUND,WW/2,WH/2,0,0,0, 'Background')
end

function BeatemUp_Background:update(dt)
    BeatemUp_Background.super.update(self,dt)
end

function BeatemUp_Background:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/self.width
  local sy = WH/self.height
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function BeatemUp_Background:mousepressed( x, y, _button, istouch, presses )
end
function BeatemUp_Background:mousereleased( x, y, _button, istouch, presses )
end
function BeatemUp_Background:keypressed(_key)
end
function BeatemUp_Background:keyreleased(_key)
end

return BeatemUp_Background