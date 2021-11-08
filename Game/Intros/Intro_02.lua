--Takeo Watanabe
Intro_02 = Actor:extend()

function Intro_02:new()
    self.alpha = 0
    self.timer = 0
    Scene.getScene():addTimer(6, function() Main_FSM:changeState('splash_03') end, false)
    Intro_02.super.new(self,LOVE2D_ICON,WW/2,WH/2,0,1,0, 'HUD')
end

function Intro_02:update(dt)
    self.timer = self.timer + dt
    self.alpha = self.timer < 3 and self.alpha + dt/3 or self.alpha - dt/3
end

function Intro_02:draw()
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

function Intro_02:mousepressed( x, y, _button, istouch, presses )
end
function Intro_02:mousereleased( x, y, _button, istouch, presses )
end
function Intro_02:keypressed(_key)
    if _key == 'space' then
        Scene.getScene():removeActor(Timer)
        Main_FSM:changeState('menu')
        Scene.getScene():removeActor(Intro_02)
    end
end
function Intro_02:keyreleased(_key)
end

return Intro_02