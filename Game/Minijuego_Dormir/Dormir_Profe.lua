Dormir_Profe = Actor:extend()


function Dormir_Profe:new()
  Dormir_Profe.super.new(self,DORMIR_PROFE_SPRITES[1],WW/2,WH/2,0,-1,0, 'Front')
end

function Dormir_Profe:update(dt)

end

function Dormir_Profe:draw(indx)
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/1920
  local sy = WH/1080
  local rr = 0
  
  love.graphics.draw(DORMIR_PROFE_SPRITES[indx],xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Dormir_Profe