--Takeo Watanabe
Intro_04 = Actor:extend()

function Intro_04:new()
    self.alpha = 0
    self.timer = 0
    Scene.getScene():addTimer(6, function() Main_FSM:changeState('splash_02') end, false)
    Intro_04.super.new(self,TALKATIVE_LOGO,WW/2,WH/2-50,0,1,1, 'HUD')
end

function Intro_04:update(dt)
    self.timer = self.timer + dt
    self.alpha = self.timer < 3 and self.alpha + dt/2 or self.alpha - dt/2
end

function Intro_04:draw()
    love.graphics.setColor(255, 255, 255, self.alpha)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Intro_04:mousepressed( x, y, _button, istouch, presses )
end
function Intro_04:mousereleased( x, y, _button, istouch, presses )
end
function Intro_04:keypressed(_key)
    if _key == 'space' then
        Scene.getScene():removeActor(Timer)
        Main_FSM:changeState('menu')
        Scene.getScene():removeActor(Intro_04)
    end
end
function Intro_04:keyreleased(_key)
end

return Intro_04