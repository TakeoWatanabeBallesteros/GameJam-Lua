Pong_Manager = Actor:extend()

function Pong_Manager:new()
    require "Engine_Pong/data"
    Pong_Director.goIntro()
    Pong_Manager.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,0,0, 'Background')
end

function Pong_Manager:update(dt)
    Pong_Scene.getScene():update(dt)
end

function Pong_Manager:draw()
    Pong_Scene.getScene():draw()
end

function Pong_Manager:mousepressed(x, y, button, istouch,presses )
end
function Pong_Manager:mousereleased(x,y,button,istouch,presses )
end
function Pong_Manager:keypressed(key)
end
function Pong_Manager:keyreleased(key)
end
return Pong_Manager