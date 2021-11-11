GanchoGanchoGame = Actor:extend()

local GANCHO_ABIERTO_GANCHOGAME
shadow = {}
local gameStates
local dist
local elPeluche
local gravity
local minPosMoveX, maxPosMoveX, minPosMoveY, maxPosMoveY

local scaleFloat,posYFloat,shadowSpeed


function GanchoGanchoGame:new()

  Scene.getScene():addTimer(10,function() gameStates = gameStates < 2 and 2 end, false)

  self.speed = 100
  self.image = GANCHO_ABIERTO_GANCHOGAME
  GanchoGanchoGame.super.new(self,self.image,WW/2,WH/2,0,0,0, 'Front')

  
  --hardcoded stuff
  gravity = 10
  dist = 0
  gameStates = 1
  minPosMoveX, maxPosMoveX, minPosMoveY, maxPosMoveY = 550,1600,750,950
  scaleFloat,posYFloat,shadowSpeed = 20,0.4,1
  
  
  shadow.img = SOMBRA_GANCHOGAME
  shadow.position = self.position

  
  
end
function GanchoGanchoGame:update(dt)
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
    table.insert(actorList,t)
  end
  
  
  
  if gameStates==3 then
    for _,v in ipairs(actorList) do
        if Actor.dist(shadow,v)< 40 and v:is(Peluche) then 
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
      for _,v in ipairs(actorList) do
        if v==elPeluche then table.remove(actorList,_)
    end
    gameStates = 7
    end
    
  end
  
  
  
  
  print(gameStates)
  

end
function GanchoGanchoGame:draw()
  
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/1920
  local sy = WH/1080
  local rr = 0
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  
  if gameStates > 0 and gameStates <4 then love.graphics.draw(shadow.img,shadow.position.x,shadow.position.y,0,sx,sy,ox,oy,0,0)end
end

function GanchoGanchoGame:mousepressed(x, y, button, istouch,presses )
end

function GanchoGanchoGame:mousereleased(x,y,button,istouch,presses )
end

function GanchoGanchoGame:keypressed(key)
end
function GanchoGanchoGame:keyreleased(key)
end
end

return GanchoGanchoGame
