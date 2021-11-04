--Takeo Watanabe
CameraShake = Actor:extend()

local t, shakeDuration, shakeMagnitude = 0, -1, 0

function CameraShake:new(x, y)
    CameraShake.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'Background')
    shakeDuration = x
    shakeMagnitude = y
end

function CameraShake:update(dt)
    CameraShake.super.update(self, dt)
    if t < shakeDuration then
        t = t + dt
    end
end

function CameraShake:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  if t < shakeDuration then
    local dx = love.math.random(-shakeMagnitude, shakeMagnitude)
    local dy = love.math.random(-shakeMagnitude, shakeMagnitude)
    love.graphics.translate(dx, dy)
end
end

function CameraShake:startShake(duration, magnitude)
    t, shakeDuration, shakeMagnitude = 0, duration or 1, magnitude or 5
end

return CameraShake