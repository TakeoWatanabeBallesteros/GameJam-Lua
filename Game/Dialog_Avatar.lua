Dialog_Avatar = Actor:extend()


function Dialog_Avatar:new()
    Dialog_Avatar.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,0,0, 'Front')
end
function Dialog_Avatar:update()
end
function Dialog_Avatar:draw(sprite)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    love.graphics.draw(sprite,0,0,rr,sx,sy,ox,oy,0,0)
end

return Dialog_Avatar