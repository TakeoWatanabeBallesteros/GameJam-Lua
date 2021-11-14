--Takeo Watanabe y Jan de Nobel
Pong_PaddleP2 = Pong_Actor:extend()


function Pong_PaddleP2:new(x,y)
  Pong_PaddleP2.super.new(self,Pong_SETTINGS_PADDLE_SPRITE,Pong_PLAYER_2_INITIAL_X,Pong_PLAYER_2_INITIAL_Y,0,-1,Pong_PADDLE_INITIAL_SPEED-10, 'Front')
  self.ball = nil
end

function Pong_PaddleP2:update(dt)
  if not self.ball then
    for _, v in pairs(Pong_Scene.getScene():getActorList()) do
      if v:is(Pong_Ball) then self.ball = v end
    end
  end
  Pong_PaddleP2.super.update(self,dt)
  if Pong_PVP then
    if love.keyboard.isDown("down") and self.position.y < WH - Pong_PADDLE_HEIGHT/2 then
      self.position.y = self.position.y + self.speed*dt
    end
    if love.keyboard.isDown("up") and self.position.y > Pong_PADDLE_HEIGHT/2 then
      self.position.y = self.position.y - self.speed*dt
    end
  else
    self:cpuMovement(dt)
  end
end

function Pong_PaddleP2:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Pong_PaddleP2:cpuMovement(dt)
  if math.cos(Pong_Vector.ang(self.ball.forward)) > 0 then
    if self.position.y < self.ball.position.y - Pong_PADDLE_HEIGHT*.6 then self.position.y = self.position.y + self.speed * dt
    elseif self.position.y > self.ball.position.y + Pong_PADDLE_HEIGHT*.6 then self.position.y = self.position.y - self.speed * dt
    elseif self.position.y < self.ball.position.y - Pong_PADDLE_HEIGHT*.2 then self.position.y = self.position.y + self.speed * .7 * dt
    elseif self.position.y > self.ball.position.y + Pong_PADDLE_HEIGHT*.2 then self.position.y = self.position.y - self.speed * .7 * dt
    end
  end
end

return Pong_PaddleP2