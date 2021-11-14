--Takeo Watanabe y Jan de Nobel
Pong_Intro = Pong_Actor:extend()

function Pong_Intro:new()
    self.introDuration = 5
    self.t = 0
    Pong_Intro.super.new(self,Pong_DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Pong_Intro:update(dt)
    if self.introDuration<=self.t then
        Pong_Director.goMenu()
    end
    self.t = self.t + dt
end

function Pong_Intro:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.setFont(Pong_FONT_OTAKU_TITLE)
    love.graphics.print("TU P*** MADRE GAMES", WW/2-Pong_FONT_OTAKU_TITLE:getWidth("TU P*** MADRE GAMES")/2, WH/2.7)
    love.graphics.setFont(Pong_FONT_OTAKU_BUTTONS)
    love.graphics.print("NO LA TUYA BRO", WW/3, WH/2)
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Pong_Intro