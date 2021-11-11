BackgroundGanchoGame = Actor:extend()

function BackgroundGanchoGame:new()
  BackgroundGanchoGame.super.new(self,BACKGROUND_GANCHOGAME,WW/2,WH/2,0,0,0, 'Background')
end
function BackgroundGanchoGame:update()
end
function BackgroundGanchoGame:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/self.width
  local sy = WH/self.height
  local rr = 0
  love.graphics.draw(BACKGROUND_GANCHOGAME,xx,yy,rr,sx,sy,ox,oy,0,0)
  --love.graphics.draw(GANCHO_ABIERTO_GANCHOGAME,WW/2,WH/2,rr,sx,sy,ox,oy,0,0)
end

function BackgroundGanchoGame:mousepressed(x, y, button, istouch,presses )
end

function BackgroundGanchoGame:mousereleased(x,y,button,istouch,presses )
end

function BackgroundGanchoGame:keypressed(key)
end
function BackgroundGanchoGame:keyreleased(key)
end
return BackgroundGanchoGame