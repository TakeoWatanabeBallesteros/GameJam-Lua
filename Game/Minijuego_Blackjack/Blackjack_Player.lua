Blackjack_Player = Actor:extend()

function Blackjack_Player:new(x,y)
    self.cards = {}
    Blackjack_Player.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,1,0,0, 'Front')
end

function Blackjack_Player:update(dt)
    Blackjack_Player.super.update(self,dt)
end

function Blackjack_Player:draw()
  love.graphics.setColor(255, 255, 255, 1)
  for index, value in ipairs(self.cards) do
      
  end
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Blackjack_Player:addCard(idx)
    table.insert(self.cards,idx)
end

function Blackjack_Player:mousepressed( x, y, _button, istouch, presses )
end
function Blackjack_Player:mousereleased( x, y, _button, istouch, presses )
end
function Blackjack_Player:keypressed(_key)
end
function Blackjack_Player:keyreleased(_key)
end

return Blackjack_Player