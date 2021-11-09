topo = Actor:extend()
local hole
local gamestate
local offsetshadowposy
local randomTime

local globalTimer-- falta un timer global (El jugador juega 30 segundos solo o hasta que llega a 20 topos)
local points

local audioHit,mickeySound

function topo:new()
    topo.super.new(self,TOPO_IMAGE_TOPO_GAME,WW/2,WH/2,0,0,0, "Middle")
    globalTimer = Timer(30,function() gamestate = "EndGame" end, false)
    Scene.getScene():addTimerr(globalTimer)
    audioHit = love.audio.newSource("Data/mjWackAMoleGameSounds/blip.wav","static")
    mickeySound = love.audio.newSource("Data/mjWackAMoleGameSounds/MickeyMouseSong.mp3","static")
    mickeySound:setVolume(.7)
    love.audio.play(mickeySound)
    
    gamestate = {"HitTopo", "TopoOut","SetTimerForNewTopo","SetTopoPos", "EndGame"}
    gamestate = "HitTopo"
    
    math.randomseed(os.time())
    
    for _,v in ipairs(Scene.getScene():getActorList()) do
      if v:is(MAZO_TOPO_GAME) then
      self.mazo = v
      break
    end
  end
  
  
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

  
end
function topo:update(dt)
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
  
  
  
  -- self.pos.y = shadow.pos.y-130
 --print(shadow.position.x.."  "..shadow.position.y)
 --print(self.position.x.."  "..self.position.y)
end
function topo:draw()

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/self.width
    local sy = WH/self.height
    local rr = 0
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
    love.graphics.print(points,WW/2.1, WH/1.1,0,1,1,0,0,0,0)
    love.graphics.print(math.floor(globalTimer:getTime()),WW/2.15, WH/1.04,0,1,1,0,0,0,0)
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
        love.audio.play(audioHit)
      end
  end
end

function topo:mousereleased(x,y,button,istouch,presses )
end

function topo:keypressed(key)
end
function topo:keyreleased(key)
end

  
return topo