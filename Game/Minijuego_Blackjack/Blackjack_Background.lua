Blackjack_Background = Actor:extend()

function Blackjack_Background:new(x,y)
    Blackjack_Background.super.new(self,BLACKJACK_BACKGROUND,WW/2,WH/2,1,0,0, 'Background')
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
  local sx = WW/self.width
  local sy = WH/self.height
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  love.graphics.draw(CARD_BACK, WW/3-CARD_BACK:getWidth()/2, WH/10-CARD_BACK:getHeight()/2 ,0, WW/1920, WH/1080)
end

function Blackjack_Background:mousepressed( x, y, _button, istouch, presses )
end
function Blackjack_Background:mousereleased( x, y, _button, istouch, presses )
end
function Blackjack_Background:keypressed(_key)
end
function Blackjack_Background:keyreleased(_key)
end

return Blackjack_Background