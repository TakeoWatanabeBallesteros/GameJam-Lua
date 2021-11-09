Background = Actor:extend()


function Background:new()
    Background.super.new(self,BACKGROUND_IMAGE_TOPO_GAME,WW/2,WH/2,0,0,0, 'Background')
end
function Background:update()
end
function Background:draw()

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/self.width
    local sy = WH/self.height
    local rr = 0
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end
function Background:mousepressed(x, y, button, istouch)
end

function Background:mousereleased(x,y,button,istouch)
end

function Background:keypressed(key)
end
function Background:keyreleased(key)
end
return Background