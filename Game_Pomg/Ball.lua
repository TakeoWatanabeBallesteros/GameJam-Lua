--Takeo Watanabe y Jan de Nobel
Pong_Ball = Pong_Actor:extend()


function Pong_Ball:new(x,y)
  for _,v in ipairs(Pong_Scene.getScene():getActorList()) do
    if v:is(Pong_HUD) then
      self.hud = v
    elseif v:is(Pong_PaddleP1) then
      self.paddle1 = v
    elseif v:is(Pong_PaddleP2) then
      self.paddle2 = v
    elseif v:is(Pong_CameraShake) then
      self.camerashake = v
    end
  end
  Pong_Ball.super.new(self,Pong_SETTING_BALL_SPRITE,WW/2,WH/2,-1,0,Pong_BALL_INITIAL_SPEED, 'Front')
end

function Pong_Ball:update(dt)
  Pong_Ball.super.update(self,dt)
  self.position = self.position + self.forward * self.speed * dt
  self:CheckColision(self.paddle1.position.x-self.paddle1.width/2, self.paddle1.position.y-self.paddle1.height/2)
  self:CheckColision(self.paddle2.position.x-self.paddle2.width/2, self.paddle2.position.y-self.paddle2.height/2)
  self:CheckWallColision(dt)
end

function Pong_Ball:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Pong_Ball:CheckColision(paddleX, paddleY)
  local deltaX = self.position.x - math.max(paddleX, math.min(self.position.x, paddleX + Pong_PADDLE_WIDTH))
  local deltaY = self.position.y - math.max(paddleY, math.min(self.position.y, paddleY + Pong_PADDLE_HEIGHT))
  if math.pow(deltaX,2) + math.pow(deltaY, 2) <= math.pow(self.width/2, 2) then
    self:CheckAngle(paddleY, deltaY)
    Pong_AudioManager.PlaySound(Pong_SETTINGS_AUDIO_PONG_PADDLE, .6, false)
  end
end

function Pong_Ball:CheckAngle(paddleY, deltaY)
  local relativeY
  if (deltaY==0) then
    relativeY = self.position.y
    local relativeIntersectY = (paddleY + (Pong_PADDLE_HEIGHT/2)) - relativeY
    local normalizedRelativeIntersectY = (relativeIntersectY/(Pong_PADDLE_HEIGHT/2))
    self.forward = math.cos(Pong_Vector.ang(self.forward)) < 0 and Pong_Vector.angToVect(normalizedRelativeIntersectY * Pong_BALL_MAX_BOUNCE_ANGLE) or Pong_Vector.angToVect((normalizedRelativeIntersectY * Pong_BALL_MAX_BOUNCE_ANGLE)+math.pi)
  elseif (math.pow(deltaY, 2)>0 and math.pow(deltaY, 2)<100 and paddleY<WW/2) then self.forward = self.position.y>paddleY and Pong_Vector.angToVect(math.pi*7/4) or Pong_Vector.angToVect(math.pi/4)
  elseif (math.pow(deltaY, 2)>0 and math.pow(deltaY, 2)<100 and paddleY>WW/2) then self.forward = self.position.y>paddleY and Pong_Vector.angToVect(math.pi*5/4) or Pong_Vector.angToVect(math.pi*3/4)
  end
  if self.position.x<WW/2 then self.position.x = self.position.x + 2
  else self.position.x = self.position.x - 2
  end
  self.speed = self.speed + 5
end

function Pong_Ball:CheckWallColision(dt)
  if self.position.y<self.width/2 or self.position.y+self.width/2>WH then
    Pong_AudioManager.PlaySound(Pong_SETTINGS_AUDIO_PONG_WALL, .6, false)
    self.forward = Pong_Vector.angToVect(-Pong_Vector.ang(self.forward))
    if self.position.y<self.width/2 then self.position.y = self.position.y + 2
    else self.position.y = self.position.y - 2
    end
  elseif self.position.x < 0 then 
    self.hud.p2Points = self.hud.p2Points + 1
    self.hud.timerp2 = 3
    self:Restart(Pong_Vector.new(1,0))
  elseif self.position.x>self.width/2+WW then
    self.hud.p1Points = self.hud.p1Points + 1
    self.hud.timerp1 = 3
    self:Restart(Pong_Vector.new(-1,0))
  end
end

function Pong_Ball:Restart(forward)
  if self.hud.p1Points ~= Pong_SETTINGS_GAME_TYPE and self.hud.p2Points ~= Pong_SETTINGS_GAME_TYPE then self.camerashake:startShake(1, 2) end
  Pong_AudioManager.PlaySound(Pong_SETTINGS_AUDIO_PONG_GOAL, .6, false)
  self.paddle1.position.x = Pong_PLAYER_1_INITIAL_X
  self.paddle1.position.y = Pong_PLAYER_1_INITIAL_Y
  self.paddle2.position.x = Pong_PLAYER_2_INITIAL_X
  self.paddle2.position.y = Pong_PLAYER_2_INITIAL_Y
  self.forward = forward
  self.position.x=WW*.5
  self.position.y=WH*.5
  self.speed = Pong_BALL_INITIAL_SPEED
end

return Pong_Ball