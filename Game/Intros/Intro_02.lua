--Takeo Watanabe
Intro_02 = Actor:extend()

function Intro_02:new()
    self.alpha = 0
    self.timer = 0
    self.draw_ = false
    self.font = FONT_TITLE
    self.title = "Tecno Dates"
    Intro_02.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,1,0, 'HUD')
end

function Intro_02:update(dt)
    self.timer = self.timer < 1 and self.timer + dt or 1
    if self.timer == 1 then self.draw_ = true end
end

function Intro_02:draw()
    love.graphics.setColor(255, 255, 255, 1)
    if self.draw_ then love.graphics.print(
        self.title,
        self.font,
        (WW/2) - self.font:getWidth(self.title) * 0.5,
         (WH/2.2)
        ) end
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
        Main_FSM:changeState('menu')
        Scene.getScene():removeActor(Intro_02)
    end
end
function Intro_02:keyreleased(_key)
end

return Intro_02