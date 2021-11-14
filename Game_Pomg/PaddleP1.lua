--Takeo Watanabe y Jan de Nobel
Pong_PaddleP1 = Pong_Actor:extend()

function Pong_PaddleP1:new(x,y)
  Pong_PaddleP1.super.new(self,Pong_SETTINGS_PADDLE_SPRITE,Pong_PLAYER_1_INITIAL_X,Pong_PLAYER_1_INITIAL_Y,0,-1,Pong_PADDLE_INITIAL_SPEED, 'Front')
end

function Pong_PaddleP1:update(dt)
  Pong_PaddleP1.super.update(self,dt)
  if love.keyboard.isDown("s") and self.position.y < WH - self.height/2 then
    self.position.y = self.position.y + self.speed*dt
  end
  if love.keyboard.isDown("w") and self.position.y > self.height/2 then
    self.position.y = self.position.y - self.speed*dt
  end
end

function Pong_PaddleP1:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Pong_PaddleP1