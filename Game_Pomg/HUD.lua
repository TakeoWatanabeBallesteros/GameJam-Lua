--Takeo Watanabe y Jan de Nobel
Pong_HUD = Pong_Actor:extend()

function Pong_HUD:new(x,y)
  self.p1Points = 0
  self.p2Points = 0
  self.p1Position = Pong_Vector.new(WW/4, WH/10)
  self.p2Position = Pong_Vector.new(WW*2.8/4, WH/10)
  self.blinkp1 = false
  self.blinkp2 = false
  self.timerp1 = 0
  self.timerp2 = 0
  self.gameTime = 30
  Pong_HUD.super.new(self,Pong_DEFAULT_IMAGE,WW/2,WH/2,0,-1,0,'HUD')
  love.graphics.setFont(Pong_SETTINGS_FONT_TITLE)
end

function Pong_HUD:update(dt)
    Pong_HUD.super.update(self,dt)
    if Pong_SETTINGS_GAME_TYPE then
      self.gameTime = self.gameTime - dt
    end
    if self.timerp1 > 0 then
      self.timerp1 = self.timerp1 - dt
      self.blinkp1 = true
    else self.blinkp1 = false
    end
    if self.timerp2 > 0 then
    self.timerp2 = self.timerp2 - dt
    self.blinkp2 = true
    else self.blinkp2 = false
    end
    if type(Pong_SETTINGS_GAME_TYPE) == "boolean" and self.gameTime <= 0 then
      if self.p1Points > self.p2Points then
        Pong_Director.goGameOver('YOU WIN')
      elseif self.p1Points < self.p2Points then
        Pong_Director.goGameOver('YOU LOSE')
      else
        Pong_Director.goGameOver('DRAW')
      end
    elseif type(Pong_SETTINGS_GAME_TYPE) == "number" then 
      if Pong_SETTINGS_GAME_TYPE == self.p1Points then
        Pong_Director.goGameOver('YOU WIN')
      elseif Pong_SETTINGS_GAME_TYPE == self.p2Points then
        Pong_Director.goGameOver('YOU LOSE')
      end
    end
end

function Pong_HUD:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  if(math.floor(love.timer.getTime()) % 2 == 0) or (not self.blinkp1) then
    love.graphics.print(self.p1Points, self.p1Position.x, self.p1Position.y)
  end
  if (math.floor(love.timer.getTime()) % 2 == 0) or (not self.blinkp2) then
    love.graphics.print(self.p2Points, self.p2Position.x, self.p2Position.y)
  end
  if type(Pong_SETTINGS_GAME_TYPE) == "boolean" then
  if not  Pong_SETTINGS_FIELD_SPRITE == Pong_FIELD_DEFAULT_IMAGE then love.graphics.setColor(0, 0, 0, 1) end
  love.graphics.print(math.floor(self.gameTime), (WW * 0.5) - Pong_SETTINGS_FONT_TITLE:getWidth(math.floor(self.gameTime)) * 0.5,
  20 + Pong_SETTINGS_FONT_TITLE:getHeight(math.floor(self.gameTime)) * 0.5)
  love.graphics.setColor(255, 255, 255, 1)
  end
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Pong_HUD