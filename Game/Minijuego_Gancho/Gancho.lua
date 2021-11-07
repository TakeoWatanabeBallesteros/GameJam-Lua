Actor = Actor or require "Scripts/actor"
Timer = Timer or require "Scripts/Timer"
Peluche = Peluche or require "Scripts/Peluche"
Gancho = Actor:extend()
local img
shadow = {}
local gameStates
local dist
local p1,p2,p3,p4,p5,p6
local elPeluche
local gravity
local minPosMoveX, maxPosMoveX, minPosMoveY, maxPosMoveY

local scaleFloat,posYFloat,shadowSpeed

local globalTimer, timeShown

function Gancho:new()

  Scene.getScene():addTimer(10,function() gameStates = gameStates < 2 and 2 end, false)

  img = love.graphics.newImage("Data/mjGanchoTextures/gancho.png")
  imgCerrado = love.graphics.newImage("Data/mjGanchoTextures/ganchoCerrado.png")
  self.speed = 100
  self.position = Vector.new(width/2,-100)
  self.origin = Vector.new(img:getWidth()/2 ,img:getHeight()/2)
  self.scale = Vector.new(0.5, 0.5)
  
  --hardcoded stuff
  gravity = 10
  gameStates = 1
  minPosMoveX, maxPosMoveX, minPosMoveY, maxPosMoveY = 550,1600,750,950
  scaleFloat,posYFloat,shadowSpeed = 20,0.4,1
  
  
  shadow.shadowImg = love.graphics.newImage("Data/mjGanchoTextures/Shadow.png")
  shadow.position = Vector.new(self.position.x,800)
  shadow.ox = shadow.shadowImg:getWidth()/2
  shadow.oy = shadow.shadowImg:getHeight()/2
  shadow.sx = 0.05
  shadow.sy = 0.05
  
  --pelucheSpawner
  p1 = Peluche("oso") --string to define which peluche it is (usar luego para decir por ejemplo: kiero k me cojas el bus laityiar bebé)
  table.insert(actorList,p1)
  
  p2 = Peluche("stitch") --string to define which peluche it is (usar luego para decir por ejemplo: kiero k me cojas el bus laityiar bebé)
  table.insert(actorList,p2)
  
  p3 = Peluche("bambi") --string to define which peluche it is (usar luego para decir por ejemplo: kiero k me cojas el bus laityiar bebé)
  table.insert(actorList,p3)
  
  p4 = Peluche("alex")
  table.insert(actorList,p4)
  
end
function Gancho:update(dt)
  
  timeShown = tostring(math.floor(globalTimer.tAct))

  if gameStates == 1 then 
    
    shadow.position.x = self.position.x
    if shadow.position.y < 800 then minPosMoveX = 350
      else minPosMoveX = 550 end
  if love.keyboard.isDown("a") and self.position.x > minPosMoveX then
    self.position.x = self.position.x - self.speed*dt
  end
  if love.keyboard.isDown("d") and self.position.x < maxPosMoveX then
    self.position.x = self.position.x + self.speed*dt
  end
  if love.keyboard.isDown("w") and shadow.position.y > minPosMoveY then
    self.scale.x = self.scale.x-(dt/scaleFloat)
    self.scale.y = self.scale.y-(dt/scaleFloat)
    self.position.y = self.position.y + posYFloat
    shadow.position.y = shadow.position.y-shadowSpeed
  end  
  if love.keyboard.isDown("s") and shadow.position.y < maxPosMoveY and (shadow.position.x > 550 or shadow.position.y <=800) then
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
function Gancho:draw()
  
  local xx = self.position.x
  local yy = self.position.y
  local ox = self.origin.x
  local oy = self.origin.y
  if gameStates > 0 and gameStates <4 then love.graphics.draw(img,xx,yy,0,self.scale.x,self.scale.y,ox,oy,0,0)end
  if gameStates > 3 and gameStates <6 then love.graphics.draw(imgCerrado,xx,yy,0,self.scale.x,self.scale.y,ox,oy,0,0)end
  if gameStates > 5 then love.graphics.draw(img,xx,yy,0,self.scale.x,self.scale.y,ox,oy,0,0)end

  love.graphics.print("Time left: "..timeShown,300,120,0,2,2,0,0,0)
  
  
  if gameStates > 0 and gameStates <4 then love.graphics.draw(shadow.shadowImg,shadow.position.x,shadow.position.y,0,shadow.sx,shadow.sy,shadow.ox,shadow.oy,0,0)end
end

end

return Gancho
