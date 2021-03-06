Timer = Actor:extend()

function Timer:new(time,fun,r)
    self.f = fun
    self.tAct = time
    self.tFin = time
    self.rep = r 
    self.position = Vector.new(-1,-1)
end

function Timer:update(dt)
  self.tAct = self.tAct - dt
  if(self.tAct < 0) then
    self.f()
    if(self.rep) then
      self.tAct = self.tFin
    else
      Scene.getScene():removeThisActor(self)
    end
  end
end

function Timer:getTime()
  return self.tAct
end

function Timer:mousepressed( x, y, _button, istouch, presses )
end

function Timer:mousereleased( x, y, _button, istouch, presses )
end

function Timer:keypressed(_key)
end

function Timer:keyreleased(_key)
end

return Timer