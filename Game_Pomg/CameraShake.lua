--Takeo Watanabe y Jan de Nobel
Pong_CameraShake = Pong_Actor:extend()

local t, shakeDuration, shakeMagnitude = 0, -1, 0

function Pong_CameraShake:new(x, y)
    Pong_CameraShake.super.new(self,Pong_DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'Background')
end

function Pong_CameraShake:update(dt)
    Pong_CameraShake.super.update(self, dt)
    if t < shakeDuration then
        t = t + dt
    end
end

function Pong_CameraShake:draw()
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

function Pong_CameraShake:startShake(duration, magnitude)
    t, shakeDuration, shakeMagnitude = 0, duration or 1, magnitude or 5
end

return Pong_CameraShake