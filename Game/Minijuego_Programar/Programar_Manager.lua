--actually it's just an array of screens whit a diferent word, read when the player press the space and then check if he did it
--when the sprite with the line of code whas the correct, easy game
--need to load the screens but the base of loop printing is done IMO
Programar_Manager = Actor:extend()

function Programar_Manager:new()
    local states = {'Start','Moving', 'Correct', 'Incorrect', 'Finish'}
    self.currentState = 'Start'
    self.screens = {{'print', 2}, {'while', 1}, {'repeat', 2}, {'code',2}, {'float',2}} --1 is correct and 2 is incorrect
    self.index = 1
   Programar_Manager.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,1,0,0, 'Background')
   self.errores = 0
end

function Programar_Manager:update(dt)
    if self.currentState == 'Start' then
        self.currentState = 'Moving'
        Programar_Manager.ChangeScreen()
    end
end

function Programar_Manager:draw()
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
end

function Programar_Manager:CodeLinesDraw()
    local sx = WW/1920
    local sy = WH/1080
    love.graphics.draw(PROGRAMAR_SCREENS[2][self.index],0,0,0,sx,sy)
end

function Programar_Manager.ChangeScreen()
    local o = Scene.getScene():getActor(Programar_Manager)
    if o.currentState == 'Moving' then
    o.index = o.index < #o.screens and o.index + 1 or 1
    o.drawing = o.screens[o.index]
    Scene.getScene():addTimer(0.3, function() Programar_Manager.ChangeScreen() end, false)
    end
end

function Programar_Manager:mousepressed( x, y, _button, istouch, presses )
end
function Programar_Manager:mousereleased( x, y, _button, istouch, presses )
end
function Programar_Manager:keypressed(_key)
    if _key == 'space' then
        if self.index == 1 then
            --self.currentState = 'Correct'
            print("good")
        else
            --self.currentState = 'Incorrect'
            print("Bad")
            self.errores = self.errores < 3 and self.errores + 1 or 3
        end
        --self.currentState = 'Finish'
    end
end
function Programar_Manager:keyreleased(_key)
end

return Programar_Manager