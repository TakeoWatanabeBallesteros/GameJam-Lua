--Takeo Watanabe
Intro = Actor:extend()

function Intro:new()
    self.alpha = 1
    Scene.getScene():addTimer(3, function() Main_FSM:changeState('splash_02') end, false)
    Intro.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,1,1, 'HUD')
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
    local rr = self.rot
    love.graphics.print(
        'AP GAMES',
        FONT_OTAKU_TITLE,
        (WW * 0.5) - FONT_OTAKU_TITLE:getWidth('AP GAMES') * 0.5,
         WH/2 - FONT_OTAKU_TITLE:getHeight('AP GAMES') * 0.5
        )
    love.graphics.setFont(FONT_OTAKU_BUTTONS)
    love.graphics.print(
        'PRESENTA',
        FONT_OTAKU_BUTTONS,
        (WW * 0.5) - FONT_OTAKU_BUTTONS:getWidth('PRESENTA') * 0.5,
         WH/2 + FONT_OTAKU_TITLE:getHeight('AP GAMES') * 0.5
        )
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Intro