--Takeo Watanabe y Jan de Nobel
Pong_Scene = Pong_Object:extend()

local sInstance

function Pong_Scene.getScene()
  if(not sInstance) then
    sInstance=Pong_Scene()
    return sInstance
  else
    return sInstance
  end
end

function Pong_Scene:new()
  self.actors = {}
end

function Pong_Scene:addActor(type)
    if type then
      local a=type()
      table.insert(self.actors,a)
    end
end

function Pong_Scene:removeActor(type)
  for _,v in ipairs(self:getActorList()) do
    if v:is(type) then
      table.remove(self.actors,_)
      break
    end
  end
end

function Pong_Scene:getActorList()
    return self.actors
end

function Pong_Scene:update(dt)
  for _,v in ipairs(self:getActorList()) do
    v:update(dt)
  end
end

function Pong_Scene:draw()
  for key, value in ipairs(Pong_LAYERS) do
    for _,v in ipairs(self:getActorList()) do
      if v.layer == value then v:draw() end
    end
  end
end

function Pong_Scene:mousepressed(x, y, _button, istouch, presses)
  for _,v in ipairs(self:getActorList()) do
    if v:is(Pong_Menu) or v:is(Pong_Settings) then v:mousepressed(x, y, _button, istouch, presses) end
  end
end

function Pong_Scene:mousereleased(x, y, _button, istouch, presses)
  for _,v in ipairs(self:getActorList()) do
    if v:is(Pong_Menu) or v:is(Pong_Settings) then v:mousereleased(x, y, _button, istouch, presses) end
  end
end

return Pong_Scene