Gancho_Gancho = Actor:extend()

shadow = {}
local gameStates
local elPeluche
local gravity
local globalTimer

local scaleFloat,posYFloat,shadowSpeed,speed,posPeluche
function Gancho_Gancho:new()
  globalTimer = Timer(10,function() if gameStates < 2 then gameStates = 2 end end, false)
  Scene.getScene():addTimerObj(globalTimer)

  speed = 100
  Gancho_Gancho.super.new(self,GANCHO_GANCHO_ABIERTO,WW/2,-WH/6,1,0,0, 'Front')
  gravity = 10
  gameStates = 1
  scaleFloat,posYFloat,shadowSpeed = 10,20,1
  shadow.img = GANCHO_SOMBRA
  shadow.position = Vector.new(self.position.x,self.position.y +WH/1.7)
end

function Gancho_Gancho:update(dt)
  shadow.position.x = self.position.x
  
  if gameStates == 1 then 
    if not love.keyboard.isDown("w") and not love.keyboard.isDown("s") and not love.keyboard.isDown("a") and not love.keyboard.isDown("d")then
      AudioManager.StopSound(GANCHO_AUDIO)
    end
    if love.keyboard.isDown("a") and self.position.x > WW/7.3 then
      self.position.x = self.position.x - speed*dt
    end
    if love.keyboard.isDown("d") and self.position.x < WW/1.2 then
      self.position.x = self.position.x + speed*dt
    end
    if love.keyboard.isDown("w") 
    then
      self.scale.x = self.scale.x-(dt/scaleFloat)
      self.scale.y = self.scale.y-(dt/scaleFloat)
      self.position.y = self.position.y + posYFloat*dt
      shadow.position.y = shadow.position.y-shadowSpeed
    end
    if love.keyboard.isDown("s") --and shadow.position.y < maxPosMoveY and (shadow.position.x > 550 or shadow.position.y <=800)
    then
      self.scale.x = self.scale.x+(dt/scaleFloat)
      self.scale.y = self.scale.y+(dt/scaleFloat)
      self.position.y = self.position.y - posYFloat*dt
      shadow.position.y = shadow.position.y+shadowSpeed
    end
    if love.keyboard.isDown("space") then
      gameStates = 2 
    end
  end
  if gameStates==2 then
    AudioManager.PlayMusic(GANCHO_AUDIO,GAME_SETTINGS_VOLUME_EFFECTS,false)
    if self.position.y< shadow.position.y then
      self.position.y = self.position.y+speed*dt*2
    end
    if self.position.y >= shadow.position.y then
      AudioManager.StopSound(GANCHO_AUDIO)
        posPeluche = shadow.position.y + WH/2.5
      gameStates = 3
    end
  end
  if gameStates==3 then

    shadow.position.y = posPeluche
    for _,v in ipairs(Scene.getScene():getActorList()) do
        if Actor.dist(shadow,v)< 20 and v:is(Gancho_Peluche) then
          gameStates = 4
          elPeluche = v
          self.image = GANCHO_GANCHO_CERRADO
        end
    end
    if elPeluche== nil then 
      gameStates = 7
      elPeluche = nil
    end
  end
  if gameStates == 4 then
    AudioManager.PlayMusic(GANCHO_AUDIO,GAME_SETTINGS_VOLUME_EFFECTS,false)
    self.position.y = self.position.y -120*dt
    elPeluche.position.y = elPeluche.position.y -120*dt
    if elPeluche.position.y < WH/8 then
      gameStates = 5
    end
  end
  if gameStates == 5 then
    self.position.x = self.position.x -120*dt
    elPeluche.position.x = elPeluche.position.x -120*dt
    if elPeluche.position.x < WW/10 then
            gameStates = 6
    end
  end
  if gameStates == 6 then
    AudioManager.StopSound(GANCHO_AUDIO)
    self.image = GANCHO_GANCHO_ABIERTO
    gravity = gravity+dt*100
    elPeluche.position.y = elPeluche.position.y +gravity
    if elPeluche.position.y > WH then 
      for _,v in ipairs(Scene.getScene():getActorList()) do
        if v==elPeluche then table.remove(Scene.getScene():getActorList(),_) end
        gameStates = 7
      end
    end
  end

  if gameStates == 7 then
    if elPeluche == nil then
      --compatibility = -5
      print("SAMADOULAE")
      gameStates = 9
  elseif elPeluche.name == "takeo" then
      --compatibility = +25
      gameStates = 8
      print("HAMZAGAY")
  elseif elPeluche.name == "el que no quiere xd" then
      --compatibility = +10
      gameStates = 8
    end
  end
  if gameStates == 8 then
    --pantalla de victoria?
  end
  if gameStates == 9 then
    if self.position.y > -WH/6 then     self.position.y = self.position.y -120*dt end
    --Pantalla de derrota
  end

end

function Gancho_Gancho:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = WW/1920*self.scale.x
  local sy = WH/1080*self.scale.y
  local ssx = WW/1920
  local ssy = WH/1080
  local rr = 0
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  love.graphics.setColor(255, 0, 0)
  if gameStates < 2 then   love.graphics.print(math.floor(globalTimer:getTime()),WW/7.5, WH/6,0,1,1,0,0,0,0)  end
  if gameStates < 4 then love.graphics.draw(shadow.img,shadow.position.x,shadow.position.y,0,ssx,ssy,ox,oy,0,0) end
end

function Gancho_Gancho:mousepressed(x, y, button, istouch,presses )
end
function Gancho_Gancho:mousereleased(x,y,button,istouch,presses )
end
function Gancho_Gancho:keypressed(key)
if key == "w" then love.audio.play(GANCHO_AUDIO,GAME_SETTINGS_VOLUME_EFFECTS,false) end
if key == "s" then love.audio.play(GANCHO_AUDIO,GAME_SETTINGS_VOLUME_EFFECTS,false) end
if key == "a" then love.audio.play(GANCHO_AUDIO,GAME_SETTINGS_VOLUME_EFFECTS,false) end
if key == "d" then love.audio.play(GANCHO_AUDIO,GAME_SETTINGS_VOLUME_EFFECTS,false) end

end
function Gancho_Gancho:keyreleased(key)
end

return Gancho_Gancho
