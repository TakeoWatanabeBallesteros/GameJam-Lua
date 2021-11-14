--Takeo Watanabe y Jan de Nobel
Pong_Actor = Pong_Object:extend()


function Pong_Actor:new(image,x,y,fx,fy,speed,layer)
    self.position = Pong_Vector.new(x or 0, y or 0)
    self.scale = Pong_Vector.new(1,1)
    self.forward = Pong_Vector.new(fx or 1,fy or 0)
    self.speed = speed or 0
    self.image = image or love.graphics.newImage(Pong_DEFAULT_IMAGE)
    self.origin = Pong_Vector.new(self.image:getWidth()/2 ,self.image:getHeight()/2)
    self.height = self.image:getHeight()
    self.width  = self.image:getWidth()
    self.layer = layer or Pong_LAYERS[3]
end

function Pong_Actor:update(dt)
end

function Pong_Actor:draw()
end

function Pong_Actor.dist(a,b)
  v=b.position - a.position
  return v:len()
end

function Pong_Actor.intersect(a, b)
  --With locals it's common usage to use underscores instead of camelCasing
  local ax = a.position.x
  local ay = a.position.y
  local aw = a.width
  local ah = a.height

  local bx = b.position.x
  local by = b.position.y
  local bw = b.width
  local bh = b.height

  if ax+aw > bx and ax < bx+bw and ay+ah > by and ay < by+bh then
    return true
  else
    return false
  end
end

return Pong_Actor