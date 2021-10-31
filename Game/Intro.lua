--Takeo Watanabe
Intro = Actor:extend()

function Intro:new()
    Scene.getScene():addTimer(5, function() Main_FSM:changeState('menu') end, false)
    Intro.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Intro:update(dt)
end

function Intro:draw()
    love.graphics.setColor(255, 255, 255, 1)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.setFont(FONT_OTAKU_TITLE)
    love.graphics.print("AP GAMES", WW/3.7, WH/2.7)
    love.graphics.setFont(FONT_OTAKU_BUTTONS)
    love.graphics.print("PRESENTA", WW/3, WH/2)
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Intro