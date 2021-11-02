Actor = Actor or require "Scripts/actor"
Peluche = Actor:extend()
function Peluche:new(nameP)
  
  self.name = nameP
  if self.name == "oso" then self.image = love.graphics.newImage("Textures/Peluche1.png") end
  if self.name == "stitch" then self.image = love.graphics.newImage("Textures/Peluche2.png") end
  if self.name == "bambi" then self.image = love.graphics.newImage("Textures/Peluche3.png") end
  
  self.position = Vector.new(math.random(700,1600),math.random(750,950))
  for _,v in ipairs(actorList) do
    while (Actor.dist(self,v) <100 ) do  self.position = Vector.new(math.random(700,1600),math.random(750,950)) end
  end
  
  self.origin = Vector.new(self.image:getWidth()/1.8,self.image:getHeight()/1.3)
  self.scale = Vector.new(0.5, 0.5)
  end

function Peluche:update()
  --print(shadow.y.."   "..self.position.y)
  --print(shadow.x.."   "..self.position.x)
  
end

function Peluche:draw()
  
  local xx = self.position.x
  local yy = self.position.y
  local ox = self.origin.x
  local oy = self.origin.y
  love.graphics.draw(self.image,xx,yy,0,self.scale.x,self.scale.y,ox,oy,0,0)
  
end
return Peluche