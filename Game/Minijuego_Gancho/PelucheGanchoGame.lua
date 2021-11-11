PelucheGanchoGame = Actor:extend()
function PelucheGanchoGame:new(nameP)
  
  self.name = nameP
  if self.name == "oso" then self.image = PELUCHE_MARINA end
  if self.name == "stitch" then self.image = PELUCHE_TAKEO end
  if self.name == "bambi" then self.image = PELUCHE_RICKY end
  if self.name == "alex" then self.image = PELUCHE_ALEX end
  
  self.position = Vector.new(math.random(700,1600),math.random(750,950))
  
  PelucheGanchoGame.super.new(self,self.image,self.position.x,self.position.y,0,0,0, 'Middle')

  end

function PelucheGanchoGame:update()
  
end

function PelucheGanchoGame:draw()
  
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/1920 *0.5
  local sy = WH/1080 *0.5
  local rr = 0
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  
end

function PelucheGanchoGame:mousepressed(x, y, button, istouch,presses )
end

function PelucheGanchoGame:mousereleased(x,y,button,istouch,presses )
end

function PelucheGanchoGame:keypressed(key)
end
function PelucheGanchoGame:keyreleased(key)
end

return PelucheGanchoGame