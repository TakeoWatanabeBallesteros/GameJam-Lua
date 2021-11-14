PelucheGanchoGame = Actor:extend()

function PelucheGanchoGame:new(nameP)
  math.randomseed(os.time())
  self.name = nameP
  if self.name == "marina" then self.image = GANCHO_PELUCHE_MARINA 
    self.position = Vector.new(WW/1.2,WH/1.19) end
  if self.name == "takeo" then self.image = GANCHO_PELUCHE_TAKEO 
    self.position = Vector.new(WW/4.5,WH/1.44) end
  if self.name == "ricky" then self.image = GANCHO_PELUCHE_RICKY 
  self.position = Vector.new(WW/1.7,WH/1.19) end
  if self.name == "alex" then self.image = GANCHO_PELUCHE_ALEX 
  self.position = Vector.new(WW/2.3,WH/1.3) end
  if self.name == "veronika" then self.image = GANCHO_PELUCHE_VERONIKA 
  self.position = Vector.new(WW/1.5,WH/1.38) end
  if self.name == "arnau" then self.image = GANCHO_PELUCHE_ARNAU 
    self.position = Vector.new(WW/3,WH/1.15) end
  
  PelucheGanchoGame.super.new(self,self.image,self.position.x,self.position.y,1,0,0, 'Middle')
end

function PelucheGanchoGame:update()
  
end

function PelucheGanchoGame:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/1920
  local sy = WH/1080
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