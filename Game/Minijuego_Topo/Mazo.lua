Mazo = Actor:extend()
local mx,my 

function Mazo:new()
    Mazo.super.new(self,MazoNoHit_IMAGE_TOPO_GAME,WW/2,WH/2,0,0,0, "Front")
    self.shadow = SHADOW_IMAGE_TOPO_GAME
    self.skip = false
end
function Mazo:update(dt)
      mx,my = love.mouse.getPosition()
      self.position.x = mx-self.origin.x/5
      self.position.y = my-self.origin.y/3 

end
function Mazo:draw()

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    
    
    local sx = WW/self.width*0.4
    local sy = WH/self.height*0.4
    
    local rr = 0
    if self.skip then
    love.graphics.draw(self.shadow,xx,yy,rr,sx,sy,ox,oy,0,0)
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
    end
  end

function Mazo:mousepressed(x, y, button, istouch)
      if button == 1 then 
        self.image = MazoHit_IMAGE_TOPO_GAME
      end
end

function Mazo:mousereleased(x,y,button,istouch)
    if button == 1 then 
     self.image = MazoNoHit_IMAGE_TOPO_GAME
    end
end

function Mazo:keypressed(key)
end
function Mazo:keyreleased(key)
end
return Mazo