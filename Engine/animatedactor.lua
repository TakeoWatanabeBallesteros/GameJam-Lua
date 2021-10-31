local AnimatedActor = Object:extend()

function AnimatedActor:new(image,x,y,fx,fy,speed,numFrames,fr, loop, layer)
    self.position = Vector.new(x or 0, y or 0)
    self.scale = Vector.new(1,1)
    self.forward = Vector.new(fx or 1,fy or 0)
    self.rot = Vector.ang(self.forward)
    self.speed = speed or 30
    self.image = image or love.graphics.newImage(DEFAULT_IMAGE)
    self.origin = Vector.new(self.image:getWidth()/(2*numFrames) ,self.image:getHeight()/(2*numFrames))
    self.height = self.image:getHeight()
    self.width  = self.image:getWidth()
    self.frames = {}
    self.nFrames = numFrames or 1
    self.frameRate = fr or 12
    self.actFrame = 1
    self.loop = loop or false
    local xx=0
    local yy=0
    local h= self.image:getHeight()
    local w= self.image:getWidth()/self.nFrames
    for i=1,numFrames do
      self.frames[i] =love.graphics.newQuad( xx, yy, w, h, self.image:getWidth(), self.image:getHeight())
      xx = xx + w
    end
    self.layer = layer or LAYERS[3]
end

function AnimatedActor:update(dt)
  if self.actFrame <= self.nFrames then
    self.actFrame = self.actFrame + self.frameRate*dt
  elseif self.loop then
    self.actFrame =1
  else
    Scene.getScene():removeThisActor(self)
  end
end

function AnimatedActor:draw()
 end

return AnimatedActor