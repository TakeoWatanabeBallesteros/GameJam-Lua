--Takeo Watanabe
Intro_03 = Actor:extend()

function Intro_03:new()
    self.alpha = 0
    self.timer = 0
    Scene.getScene():addTimer(5, function() Main_FSM:changeState('splash_02') end, false)
    Intro_03.super.new(self,YARN_ICON,WW/2,WH/2-50,0,1,1, 'HUD')
end

function Intro_03:update(dt)
    self.timer = self.timer + dt
    self.alpha = self.timer < 3 and self.alpha + dt/2 or self.alpha - dt/2
end

function Intro_03:draw()
    love.graphics.setColor(255, 255, 255, self.alpha)
    love.graphics.print(
        'MADE WITH YARNEDITOR',
        FONT_TITLE_2,
        (WW * 0.5) - FONT_TITLE_2:getWidth('MADE WITH YARNEDITOR') * 0.5,
         WH/2 + self.width*0.5 - FONT_TITLE_2:getHeight('MADE WITH YARNEDITOR') * 0.5
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

function Intro_03:mousepressed( x, y, _button, istouch, presses )
end
function Intro_03:mousereleased( x, y, _button, istouch, presses )
end
function Intro_03:keypressed(_key)
    if _key == 'space' then
        Scene.getScene():removeActor(Timer)
        Main_FSM:changeState('menu')
        Scene.getScene():removeActor(Intro_03)
    end
end
function Intro_03:keyreleased(_key)
end

return Intro_03