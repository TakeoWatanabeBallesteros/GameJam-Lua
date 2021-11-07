--Takeo Watanabe
Intro = Actor:extend()

function Intro:new()
    self.alpha = 0
    self.timer = 0
    Scene.getScene():addTimer(6, function() Main_FSM:changeState('menu') end, false)
    Intro.super.new(self,YARN_ICON,WW/2,WH/2-50,0,1,1, 'HUD')
end

function Intro:update(dt)
    self.timer = self.timer + dt
    self.alpha = self.timer < 3 and self.alpha + dt/3 or self.alpha - dt/3
end

function Intro:draw()
    love.graphics.setColor(255, 255, 255, self.alpha)
    love.graphics.print(
        'MADE WITH YARNEDITOR',
        FONT_OTAKU_TITLE,
        (WW * 0.5) - FONT_OTAKU_TITLE:getWidth('MADE WITH YARNEDITOR') * 0.5,
         WH/2 + self.width*0.5 - FONT_OTAKU_TITLE:getHeight('MADE WITH YARNEDITOR') * 0.5
        )
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