topo = Actor:extend()
local hole
local gamestate
local offsetshadowposy
local randomTime

local globalTimer-- falta un timer global (El jugador juega 30 segundos solo o hasta que llega a 20 topos)
local points


function topo:new()
    love.mouse.setVisible(false)
    topo.super.new(self,TOPO_IMAGE_TOPO_GAME,WW/2,WH/2,0,0,0, "Middle")
    self.time = 30
    Scene.getScene():addTimerObj(globalTimer)
    AudioManager.PlayMusic(MICKEY_MUSIC_TOPO,GAME_SETTINGS_VOLUME_MUSIC,false)
    
    gamestate = {"HitTopo", "TopoOut","SetTimerForNewTopo","SetTopoPos", "EndGame"}
    gamestate = "HitTopo"
    
    math.randomseed(os.time())
    
    self.mazo = Scene.getScene():getActor(MAZO_TOPO_GAME)
  
  
    offsetshadowposy = 130--necesario para colliders
    
    
    hole = math.random(1,11)
  if hole == 1 then self.position.x = WW/4.15 self.position.y = WH/7.1 end
  if hole == 2 then self.position.x = WW/7.9 self.position.y = WH/2.45 end
  if hole == 3 then self.position.x = WW/4.95 self.position.y = WH/1.345 end
  if hole == 4 then self.position.x = WW/3.01 self.position.y = WH/1.83 end
  if hole == 5 then self.position.x = WW/2.45 self.position.y = WH/3.82 end
  if hole == 6 then self.position.x = WW/1.86 self.position.y = WH/2 end
  if hole == 7 then self.position.x = WW/1.85 self.position.y = WH/1.26 end
  if hole == 8 then self.position.x = WW/1.58 self.position.y = WH/5.1 end
  if hole == 9 then self.position.x = WW/1.182 self.position.y = WH/4.8 end
  if hole == 10 then self.position.x = WW/1.33 self.position.y = WH/2.3 end
  if hole == 11 then self.position.x = WW/1.238 self.position.y = WH/1.38 end
  
  points = 0

  self.skip = false
  
end

function topo:update(dt)
  if not self.skip then

  else
  self.time = self.time > 0 and self.time - dt or 0
  if self.time == 0 then 
    gamestate = "EndGame" 
  end
  if gamestate == "TopoOut" then
       self.position.x = -300
       self.position.y = 0
       gamestate = "SetTimerForNewTopo"
       hole = math.random(1,11)
       randomTime = math.random(0,100)
  end
  if gamestate == "SetTimerForNewTopo" then
    Scene.getScene():addTimer(randomTime/100, function()gamestate = "SetTopoPos" end, false)
  end
  
  if gamestate == "SetTopoPos" then
    
     
  if hole == 1 then self.position.x = WW/4.15 self.position.y = WH/7.1 end
  if hole == 2 then self.position.x = WW/7.9 self.position.y = WH/2.45 end
  if hole == 3 then self.position.x = WW/4.95 self.position.y = WH/1.345 end
  if hole == 4 then self.position.x = WW/3.01 self.position.y = WH/1.83 end
  if hole == 5 then self.position.x = WW/2.45 self.position.y = WH/3.82 end
  if hole == 6 then self.position.x = WW/1.86 self.position.y = WH/2 end
  if hole == 7 then self.position.x = WW/1.85 self.position.y = WH/1.26 end
  if hole == 8 then self.position.x = WW/1.58 self.position.y = WH/5.1 end
  if hole == 9 then self.position.x = WW/1.182 self.position.y = WH/4.8 end
  if hole == 10 then self.position.x = WW/1.33 self.position.y = WH/2.3 end
  if hole == 11 then self.position.x = WW/1.238 self.position.y = WH/1.38 end
     
     gamestate = "HitTopo"
  end
  
  
end
end
function topo:draw()

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/self.width
    local sy = WH/self.height
    local rr = 0
    if gamestate ~= "EndGame"  then
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
    love.graphics.print("TOPOS MUERTOS (ABONO): "..points,WW/2.4, WH/100)
    love.graphics.setColor(255, 0, 0)
    love.graphics.print(math.floor(self.time),WW/2.1, WH/1.09)
    love.graphics.setColor(255, 255, 255)
    else
      COMPATIBILIDAD = COMPATIBILIDAD + points
      AudioManager.StopSound(MICKEY_MUSIC_TOPO)
      Scene.getScene():removeActor(Timer)
      love.mouse.setVisible(false)
      if not MINIGAME then
        Main_FSM:changeState('dialog')
    else Main_FSM:changeState('menu_minigames') MINIGAME = false end
    end
    love.graphics.setColor(255,255,255, self.alpha)
    love.graphics.setBackgroundColor(0, 0, 0)
    if not self.skip then love.graphics.draw(MINIGAMES_TUTORIALS.topo, 0, 0, 0, sx, sy) end
end

function topo:dist(b)
  b.position.y = b.position.y +offsetshadowposy
  v=b.position - self.position
  return v:len()
end
function topo:mousepressed(x, y, button, istouch,presses )
  if gamestate == "HitTopo" then
      if button == 1 and self:dist(self.mazo)<60 then gamestate = "TopoOut" 
        points = points+1
        AudioManager.PlayMusic(HIT_TOPO_SOUND,GAME_SETTINGS_VOLUME_EFFECTS,false)
      end
  end
end

function topo:mousereleased(x,y,button,istouch,presses )
end

function topo:keypressed(key)
  if key == 'space' then self.skip = true self.mazo.bool = true end
end
function topo:keyreleased(key)
end

  
return topo