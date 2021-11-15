--Takeo Watanabe y Jan de Nobel
Pong_GameOver = Pong_Actor:extend()


function Pong_GameOver:new()
    self.introDuration = 2
    self.t = 0
    Pong_Intro.super.new(self,Pong_DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Pong_GameOver:update(dt)
    if self.introDuration<=self.t then
        COMPATIBILIDAD = COMPATIBILIDAD +10
        if not MINIGAME then
            Main_FSM:changeState('dialog')
        else Main_FSM:changeState('menu_minigames') end
    end
    self.t = self.t + dt
end

function Pong_GameOver:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.setFont(Pong_FONT_OTAKU_TITLE)
    love.graphics.print("GAME OVER", WW/5, WH/2.7)
    love.graphics.setFont(Pong_FONT_OTAKU_BUTTONS)
    love.graphics.print(Pong_SETTINGS_WIN_OR_LOSE, WW/2.5, WH/2)
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Pong_GameOver