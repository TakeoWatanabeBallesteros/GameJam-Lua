Actor = Actor or require "Scripts/actor"
local Timer = Actor:extend()

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
      for k,v in pairs(Scene.getScene():getActorList()) do
        if v==self then 
          e = k
        end
      end
      if(e~=nil) then
        table.remove(Scene.getScene():getActorList(),e)
      end
    end
  end
end

return Timer