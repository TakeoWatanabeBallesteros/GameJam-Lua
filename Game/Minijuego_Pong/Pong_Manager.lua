Pong_Manager = Actor:extend()

function Pong_Manager:new()
    require "Engine_Pong/data"
    self.skip = false
    Pong_Manager.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,0,0, 'Background')
end

function Pong_Manager:update(dt)
    if not self.skip then

    else
    Pong_Director.goIntro()
    Pong_Scene.getScene():update(dt)
    end
end

function Pong_Manager:draw()
    love.graphics.setColor(255,255,255, self.alpha)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    Pong_Scene.getScene():draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    if not self.skip then love.graphics.draw(MINIGAMES_TUTORIALS.pong, 0, 0, 0, sx, sy) end
end

function Pong_Manager:mousepressed(x, y, button, istouch,presses )
end
function Pong_Manager:mousereleased(x,y,button,istouch,presses )
end
function Pong_Manager:keypressed(key)
    if key == 'space' then self.skip = true end
end
function Pong_Manager:keyreleased(key)
end
return Pong_Manager