Gancho_Gancho = Actor:extend()

local GANCHO_ABIERTO_GANCHOGAME
shadow = {}
local gameStates
local dist
local elPeluche
local gravity
local minPosMoveX, maxPosMoveX, minPosMoveY, maxPosMoveY

local scaleFloat,posYFloat,shadowSpeed


function Gancho_Gancho:new()
  Scene.getScene():addTimer(10,function() gameStates = gameStates < 2 and 2 end, false)
  self.speed = 100
  Gancho_Gancho.super.new(self,GANCHO_GANCHO_ABIERTO,WW/2,WH/2,1,0,0, 'Front')
  --hardcoded stuff
  gravity = 10
  dist = 0
  gameStates = 1
  minPosMoveX, maxPosMoveX, minPosMoveY, maxPosMoveY = 550,1600,750,950
  scaleFloat,posYFloat,shadowSpeed = 20,0.4,1
  shadow.img = GANCHO_SOMBRA
  shadow.position = self.position
end

function Gancho_Gancho:update(dt)
  --print(self.position.x,shadow.position.y)
  if gameStates == 1 then 
    shadow.position.x = self.position.x
    if shadow.position.y < 800 then minPosMoveX = 350
    else minPosMoveX = 550 end
    if love.keyboard.isDown("a")-- and self.position.x > minPosMoveX 
    then
      self.position.x = self.position.x - self.speed
    end
    if love.keyboard.isDown("d")-- and self.position.x < maxPosMoveX 
    then
      self.position.x = self.position.x + self.speed
    end
    if love.keyboard.isDown("w") --and shadow.position.y > minPosMoveY 
    then
      self.scale.x = self.scale.x-(dt/scaleFloat)
      self.scale.y = self.scale.y-(dt/scaleFloat)
      self.position.y = self.position.y + posYFloat
      shadow.position.y = shadow.position.y-shadowSpeed
    end
    if love.keyboard.isDown("s") --and shadow.position.y < maxPosMoveY and (shadow.position.x > 550 or shadow.position.y <=800)
    then
      self.scale.x = self.scale.x+(dt/scaleFloat)
      self.scale.y = self.scale.y+(dt/scaleFloat)
      self.position.y = self.position.y - posYFloat
      shadow.position.y = shadow.position.y+shadowSpeed
    end
    if love.keyboard.isDown("space") then
      gameStates = 2 
      dist = shadow.position.y-self.position.y
    end
  end
  if gameStates==2 then
    self.position.y = self.position.y +dist*(dt/10)
    --print(self.position.y.."     "..shadow.position.y)
    Scene.getScene():addTimer(5,function() gameStates = 3 end,false)
  end
  if gameStates==3 then
    for _,v in ipairs(Scene.getScene():getActorList()) do
        if Actor.dist(shadow,v)< 40 and v:is(Gancho_Peluche) then
          gameStates = 4
          elPeluche = v
        end
    end
  end
  if gameStates == 4 then
    self.position.y = self.position.y -120*dt
    elPeluche.position.y = elPeluche.position.y -120*dt
    if elPeluche.position.y < 400 then
      gameStates = 5
    end
  end
  if gameStates == 5 then
    self.position.x = self.position.x -120*dt
    elPeluche.position.x = elPeluche.position.x -120*dt
    if elPeluche.position.x < 330 then
            gameStates = 6
    end
  end
  if gameStates == 6 then
    gravity = gravity+dt*100
    elPeluche.position.y = elPeluche.position.y +gravity
    if elPeluche.position.y > 1200 then 
      for _,v in ipairs(Scene.getScene():getActorList()) do
        if v==elPeluche then table.remove(Scene.getScene():getActorList(),_) end
        gameStates = 7
      end
    end
  end
end

function Gancho_Gancho:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/1920
  local sy = WH/1080
  local rr = 0
  love.graphics.draw(self.image,self.position.x,self.position.y,rr,sx,sy,ox,oy,0,0)
  if gameStates > 0 and gameStates <4 then love.graphics.draw(shadow.img,shadow.position.x,shadow.position.y,0,sx,sy,ox,oy,0,0) end
end

function Gancho_Gancho:mousepressed(x, y, button, istouch,presses )
end
function Gancho_Gancho:mousereleased(x,y,button,istouch,presses )
end
function Gancho_Gancho:keypressed(key)
end
function Gancho_Gancho:keyreleased(key)
end

return Gancho_Gancho
