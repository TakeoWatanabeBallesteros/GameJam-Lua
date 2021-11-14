Dormir_Manager = Actor:extend()
Dormir_Profe = require("Game/Minijuego_Dormir/Dormir_Profe")

function Dormir_Manager:new()
  Dormir_Manager.super.new(self,DORMIR_BACKGROUND,WW/2,WH/2,0,-1,0, 'Background')
  self.currentState = 'Espaldas'
  self.font = DORMIR_FONT
  self.profe = Dormir_Profe()
  self.pressed = false
  self.alpha = 1
  self.time = 120
  self.percent = 50
  self.skip = false
  self.lost = false
  self.timeToTurn = 0
  self.ap = 0
end

function Dormir_Manager:update(dt)
    math.randomseed(os.time())
    if not self.skip then

    else
    if self.timeToTurn == 0 then
        if self.ap > 0 then
            self.ap = self.ap > 0 and self.ap - dt or 0
            self.currentState = 'Mirando'

        else
            AudioManager.PlayMusic(DORMIR_ESCRIBIR, GAME_SETTINGS_VOLUME_EFFECTS, true)
            self.currentState = 'Espaldas'
            self.timeToTurn = math.random(10,20)
            self.ap = math.random(3,7)
        end
    elseif self.timeToTurn < 2 then
        AudioManager.StopSound(DORMIR_ESCRIBIR)
    end
    if self.pressed then
        self.alpha = self.alpha > 0 and self.alpha - dt/3 or 0
    else self.alpha = self.alpha < 1 and self.alpha + dt/3 or 1 end
    if self.alpha == 0 then self.percent = self.percent < 100 and self.percent + dt*2 or 100
    elseif self.alpha == 0 then self.percent = self.percent > 0 and self.percent - dt/3 or 0 
        if self.currentState == 'Mirando' then self.lost = true end
    end
    self.time = self.time > 0 and self.time - dt or 0
    self.timeToTurn = self.timeToTurn > 0 and self.timeToTurn - dt or 0
    self.profe:update(dt)
    if self.time == 0 or self.percent == 100 or self.lost then 
        AudioManager.StopSound(DORMIR_ESCRIBIR)
        if not MINIGAME then
            Main_FSM:changeState('dialog')
        else Main_FSM:changeState('menu') MINIGAME = false end
    end
end
end

function Dormir_Manager:draw()
    love.graphics.setColor(255,255,255, self.alpha)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
    
    if self.currentState == 'Espaldas' then
        self.profe:draw(1)
    elseif self.currentState == 'Mirando' then
        self.profe:draw(2)
    elseif self.currentState == 'Enfado' then
        self.profe:draw(3)
    end
    
    love.graphics.setColor(255,0,0, self.alpha)
    love.graphics.print(
        math.floor(self.time),
        self.font,
        (WW/1.2) - self.font:getWidth(math.floor(self.time)) * 0.5,
        (WH/10)
        )
        love.graphics.print(
        math.floor(self.percent)..'%',
        self.font,
        (WW/1.2) - self.font:getWidth(math.floor(self.percent)..'%') * 0.5,
        (WH/10) + self.font:getHeight(math.floor(self.time))*1.5
        )
    love.graphics.setColor(255,255,255, self.alpha)
    love.graphics.setBackgroundColor(0, 0, 0)
    if not self.skip then love.graphics.draw(MINIGAMES_TUTORIALS.clase, 0, 0, 0, sx, sy) end
end

function Dormir_Manager:mousepressed( x, y, _button, istouch, presses )
end

function Dormir_Manager:mousereleased( x, y, _button, istouch, presses )
end

function Dormir_Manager:keypressed(_key)
    if _key == 'space' then 
        self.skip = true
        self.pressed = true
    end
end

function Dormir_Manager:keyreleased(_key)
    if _key == 'space' then
        self.pressed = false
    end
end

return Dormir_Manager