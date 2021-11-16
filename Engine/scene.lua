--Takeo Watanabe
Scene = Object:extend()

local sInstance

function Scene.getScene()
  if(not sInstance) then
    sInstance=Scene()
    return sInstance
  else
    return sInstance
  end
end

function Scene:new()
  self.actors = {}
end

function Scene:addActor(type)
    if type then
      local a=type()
      table.insert(self.actors,a)
    end
end

function Scene:addActorObj(o)
  table.insert(self.actors,o)
end

function Scene:addSplashScreen(s)
  table.insert(self.actors,s)
end

function Scene:addButton(button)
  table.insert(self.actors,button)
end

function Scene:addDialog(dialog)
  table.insert(self.actors,dialog)
end
function Scene:addActorWithPos(type, x, y, fx, fy)
  if type then
    local a=type(x, y, fx, fy)
    table.insert(self.actors,a)
  end
end

function Scene:addTimer(seconds, callback, loop)
  table.insert(self.actors,Timer(seconds, callback, loop))
end

function Scene:addTimerObj(t)
  table.insert(self.actors,t)
end

function Scene:removeActor(type)
  for _,v in ipairs(self:getActorList()) do
    if v:is(type) then
      table.remove(self.actors,_)
      break
    end
  end
end

function Scene:removeThisActor(obj)
  for _,v in ipairs(self:getActorList()) do
    if v == obj then
      table.remove(self.actors,_)
      break
    end
  end
end

function Scene:removeAllActors()
  for k in pairs (self.actors) do
    self.actors[k] = nil
end
end

function Scene:getActorList()
    return self.actors
end

function Scene:getActor(actor)
  for _,v in ipairs(self.actors) do
    if v:is(actor) then
      return v
    end
  end
end

function Scene:update(dt)
  for _,v in ipairs(self:getActorList()) do
    v:update(dt)
  end
end

function Scene:draw()
  for key, value in ipairs(LAYERS) do
    for _,v in ipairs(self:getActorList()) do
      if v.layer == value then v:draw() end
    end
  end
  Suit.draw()
end

function love.mousepressed( x, y, _button, istouch, presses )
  for index, value in ipairs(Scene.getScene():getActorList()) do
    if value then value:mousepressed(x, y, _button, istouch, presses) end
  end
end

function love.mousereleased( x, y, _button, istouch, presses )
  for index, value in ipairs(Scene.getScene():getActorList()) do
    if value then value:mousereleased( x, y, _button, istouch, presses ) end
  end
end

function love.keypressed(key)
  for index, value in ipairs(Scene.getScene():getActorList()) do
    if value then value:keypressed(key) end
  end
end

function love.keyreleased(key)
  for index, value in ipairs(Scene.getScene():getActorList()) do
    if value then value:keyreleased(key) end
  end
end

return Scene