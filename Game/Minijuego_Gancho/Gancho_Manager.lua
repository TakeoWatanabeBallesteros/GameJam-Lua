Gancho_Manager = Actor:extend()

function Gancho_Manager:new()
    Gancho_Manager.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,0,0, 'Background')
    Scene:getScene():addActorObj(Gancho_Peluche('takeo'))
end

function Gancho_Manager:update()
end

function Gancho_Manager:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/self.width
  local sy = WH/self.height
  local rr = 0
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Gancho_Manager:mousepressed(x, y, button, istouch,presses )
end
function Gancho_Manager:mousereleased(x,y,button,istouch,presses )
end
function Gancho_Manager:keypressed(key)
end
function Gancho_Manager:keyreleased(key)
end
return Gancho_Manager