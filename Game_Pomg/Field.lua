--Takeo Watanabe y Jan de Nobel
Pong_Field = Pong_Actor:extend()

function Pong_Field:new(x,y)
  Pong_Field.super.new(self,Pong_SETTINGS_FIELD_SPRITE,WW/2,WH/2,1,0,0, 'Background')
end

function Pong_Field:update(dt)
  Pong_Field.super.update(self,dt)
end

function Pong_Field:draw()
  love.graphics.setColor(255, 255, 255, 1)
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/self.width
  local sy = WH/self.height
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Pong_Field