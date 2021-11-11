Gancho_Background = Actor:extend()

function Gancho_Background:new()
  Gancho_Background.super.new(self,GANCHO_BACKGROUND,WW/2,WH/2,0,0,0, 'Background')
end
function Gancho_Background:update()
end
function Gancho_Background:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/self.width
  local sy = WH/self.height
  local rr = 0
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Gancho_Background:mousepressed(x, y, button, istouch,presses )
end

function Gancho_Background:mousereleased(x,y,button,istouch,presses )
end

function Gancho_Background:keypressed(key)
end
function Gancho_Background:keyreleased(key)
end
return Gancho_Background