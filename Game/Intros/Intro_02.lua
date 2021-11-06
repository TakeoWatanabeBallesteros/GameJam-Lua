--Takeo Watanabe
Intro = Actor:extend()

function Intro:new()
    self.alpha = 1
    Scene.getScene():addTimer(3, function() Main_FSM:changeState('splash_03') end, false)
    Intro.super.new(self,LOVE2D_ICON,WW/2,WH/2,0,1,0, 'HUD')
end

function Intro:update(dt)
    self.alpha = self.alpha - dt/3
end

function Intro:draw()
    love.graphics.setColor(255, 255, 255, self.alpha)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = 0
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Intro