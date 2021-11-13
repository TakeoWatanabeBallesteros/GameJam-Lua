--Takeo Watanabe
Intro_01 = Actor:extend()

function Intro_01:new()
    self.alpha = 0
    self.timer = 0
    self.title = 'LOS DE LA B'
    Scene.getScene():addTimer(6, function() Main_FSM:changeState('splash_03') end, false)
    Intro_01.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,1,1, 'HUD')
end

function Intro_01:update(dt)
    self.timer = self.timer + dt
    self.alpha = self.timer < 3 and self.alpha + dt/3 or self.alpha - dt/3
end

function Intro_01:draw()
    love.graphics.setColor(255, 255, 255, self.alpha)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.print(
        self.title,
        FONT_TITLE,
        (WW * 0.5) - FONT_TITLE:getWidth(self.title) * 0.5,
         WH/2 - FONT_TITLE:getHeight(self.title) * 0.5
        )
    love.graphics.setFont(FONT_BUTTONS_BIG)
    love.graphics.print(
        'PRESENTA',
        FONT_BUTTONS_BIG,
        (WW * 0.5) - FONT_BUTTONS_BIG:getWidth('PRESENTA') * 0.5,
         WH/2 + FONT_TITLE:getHeight(self.title) * 0.5
        )
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Intro_01:mousepressed( x, y, _button, istouch, presses )
end
function Intro_01:mousereleased( x, y, _button, istouch, presses )
end
function Intro_01:keypressed(_key)
    if _key == 'space' then
        Main_FSM:changeState('menu')
        Scene.getScene():removeActor(Timer)
        Scene.getScene():removeActor(Intro_01)
    end
end
function Intro_01:keyreleased(_key)
end

return Intro_01