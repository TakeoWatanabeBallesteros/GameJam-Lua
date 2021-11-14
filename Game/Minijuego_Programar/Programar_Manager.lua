--actually it's just an array of screens whit a diferent word, read when the player press the space and then check if he did it
--when the sprite with the line of code whas the correct, easy game
--need to load the screens but the base of loop printing is done IMO
Programar_Manager_ = Actor:extend()

function Programar_Manager_:new()
    local states = {'Start','Moving', 'Correct', 'Incorrect', 'Finish'}
    self.currentState = 'Moving'
    self.screens = {{'print', 2}, {'while', 1}, {'repeat', 2}, {'code',2}, {'float',2}} --1 is correct and 2 is incorrect
    self.index = 1
   Programar_Manager_.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,1,0,0, 'Background')
   self.errores = 0
   self.i =1
   self.timer = 20
   self.skip = false
   self.timer2 = 0
end

function Programar_Manager_:update(dt)
    if not self.skip then

    else
    self.timer = self.timer > 0 and self.timer - dt or 0
    self.timer2 = self.timer2 > 0 and self.timer2 - dt or 0
    if self.timer2 == 0 then
        self.timer2 = 0.3
        self:ChangeScreen()
    end
end
end

function Programar_Manager_:draw()
  love.graphics.setColor(255, 255, 255, 1)
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/1920
  local sy = WH/1080
  local rr = 0
  self:CodeLinesDraw()
  if self.errores < 3 then
        for i = self.errores+ 1 , 3, 1 do
            love.graphics.draw(PROGRAMAR_VIDAS[i],0,0,rr,sx,sy)
        end
    end
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  love.graphics.setColor(255,255,255, self.alpha)
    love.graphics.setBackgroundColor(0, 0, 0)
  if not self.skip then love.graphics.draw(MINIGAMES_TUTORIALS.programar, 0, 0, 0, sx, sy) end
end

function Programar_Manager_:CodeLinesDraw()
    local sx = WW/1920
    local sy = WH/1080
    love.graphics.draw(PROGRAMAR_SCREENS[self.i][self.index],0,0,0,sx,sy)
end

function Programar_Manager_:ChangeScreen()
    if self.currentState == 'Moving' then
    self.index = self.index < #self.screens and self.index + 1 or 1
    self.drawing = self.screens[self.index]
    end
end

function Programar_Manager_:mousepressed( x, y, _button, istouch, presses )
end
function Programar_Manager_:mousereleased( x, y, _button, istouch, presses )
end
function Programar_Manager_:keypressed(_key)
    if _key == 'space' then
        if self.index == 1 and self.skip then
            AudioManager.PlaySound(PROGRAMAR_BIEN, GAME_SETTINGS_VOLUME_EFFECTS, false)
            --self.currentState = 'Correct'
            if self.i ==2 then 
                COMPATIBILIDAD = COMPATIBILIDAD +10
                Scene.getScene():removeActor(Timer)
                self.currentState = 'Finish'
                if not MINIGAME then
                    Main_FSM:changeState('dialog')
                else  Main_FSM:changeState('menu') MINIGAME = false  end
            end
            if self.i ==1 then self.i = 2 end
        elseif self.skip or (self.skip and self.timer == 0) then
            --self.currentState = 'Incorrect'
            AudioManager.PlaySound(PROGRAMAR_MAL, GAME_SETTINGS_VOLUME_EFFECTS, false)
            self.errores = self.errores < 3 and self.errores + 1 or 3
            if self.errores ==3 then
                Scene.getScene():removeActor(Timer)
                print("Bad")
                self.currentState = 'Finish'
                if not MINIGAME then
                    Main_FSM:changeState('dialog')
                else  Main_FSM:changeState('menu') MINIGAME = false  end
            end
        elseif not self.skip then
            self.skip = true
        end
    end
end
function Programar_Manager_:keyreleased(_key)
end

return Programar_Manager_