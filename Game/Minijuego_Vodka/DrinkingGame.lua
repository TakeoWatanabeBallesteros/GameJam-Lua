Actor = Actor or require "Scripts/actor"
Timer = Timer or require "Scripts/Timer"
CameraShake = CameraShake or require "Scripts/CameraShake"
DrinkingGame = Actor:extend()
local background = {}
slider = {}
playerBar = {}
local sadFace
local moveState, lastMoveState
local speed
local shots, tries
local timerGeneral,timeShown
local t,c
local drinksound, backgroundSound, disappointmentSound
local gameStop

function DrinkingGame:new()
  gameStop = false
  timerGeneral = Timer(30,function() gameStop = true end, false)
  table.insert(actorList,timerGeneral)
  
  sadFace = love.graphics.newImage("data/mjVodkaGameTextures/SadFace.png")
  
  
  drinksound = love.audio.newSource("data/mjVodkaGameSounds/drinking.mp3","static")
  disappointmentSound = love.audio.newSource("data/mjVodkaGameSounds/Disappointment.mp3","static") 
  disappointmentSound:setVolume(.1)
  backgroundSound = love.audio.newSource("data/mjVodkaGameSounds/DecapitamoGallina.mp3","static")
  backgroundSound:setVolume(0.1)
  love.audio.play(backgroundSound)
  
  background.img0 = love.graphics.newImage("data/mjvodkaGameTextures/0shots.png")
  background.img1 = love.graphics.newImage("data/mjvodkaGameTextures/1shots.png")
  background.img2 = love.graphics.newImage("data/mjvodkaGameTextures/2shots.png")
  background.img3 = love.graphics.newImage("data/mjvodkaGameTextures/3shots.png")
  background.img4 = love.graphics.newImage("data/mjvodkaGameTextures/4shots.png")
  background.img5 = love.graphics.newImage("data/mjvodkaGameTextures/5shots.png")
  background.img6 = love.graphics.newImage("data/mjvodkaGameTextures/6shots.png")
  background.img7 = love.graphics.newImage("data/mjvodkaGameTextures/7shots.png")
  background.img8 = love.graphics.newImage("data/mjvodkaGameTextures/8shots.png")
  background.img9 = love.graphics.newImage("data/mjvodkaGameTextures/9shots.png")
  background.imgDrinking = love.graphics.newImage("data/mjvodkaGameTextures/Drinking.png")
  background.imgShown = background.img
  
  slider.img = love.graphics.newImage("data/mjvodkaGameTextures/Slider.png")
  
  slider.ox = slider.img:getWidth()/2
  slider.oy = slider.img:getHeight()/2
  slider.x = 300+slider.ox
  slider.y = 530
  
  playerBar.img = love.graphics.newImage("data/mjvodkaGameTextures/playerBar.png")
  playerBar.x = slider.x
  playerBar.y = slider.y
  playerBar.ox = playerBar.img:getWidth()/2
  playerBar.oy = playerBar.img:getHeight()/2
  
  shots = 0
  tries = 0
  speed = 700
  self.points = 0
  
end
function DrinkingGame:update(dt)
  print(self.points.."     "..shots)
  
  timeShown = tostring(math.floor(timerGeneral.tAct))
  print(timeShown)
  if moveState == 1 then playerBar.x = playerBar.x + speed*dt end
  if moveState == 2 then playerBar.x = playerBar.x - speed*dt end
  if moveState == 3 then background.imgShown = background.imgDrinking
  else 
    if shots == 0 then background.imgShown = background.img0 end
    if shots == 1 then background.imgShown = background.img1 end
    if shots == 2 then background.imgShown = background.img2 end
    if shots == 3 then background.imgShown = background.img3 end
    if shots == 4 then background.imgShown = background.img4 end
    if shots == 5 then background.imgShown = background.img5 end
    if shots == 6 then background.imgShown = background.img6 end
    if shots == 7 then background.imgShown = background.img7 end
    if shots == 8 then background.imgShown = background.img8 end
    if shots > 8 then background.imgShown = background.img9 end
    end
  
  if playerBar.x < slider.x + 2 then 
    playerBar.x = slider.x
    moveState = 1
  end
  
  if playerBar.x > slider.x + slider.ox*2 + 2 then 
    playerBar.x = slider.x + slider.ox*2
    moveState = 2
  end
  function love.keypressed(key)
  if key == "space" then
      if moveState == 1 or moveState == 2 then
      speed = speed +220
      tries = tries+1
      if playerBar.x > slider.x+slider.img:getWidth()*0.4 and playerBar.x < slider.x+slider.img:getWidth()*0.6 then
       shots = shots+1
       lastMoveState = moveState
       moveState = 3
       self.points = self.points+3
       love.audio.play(drinksound)
       --c = CameraShake(.2,.4)
       --table.insert(actorList, c)
       t = Timer(3, function() 
       moveState = lastMoveState
        end, false)
       table.insert(actorList,t)
      else
        self.points = self.points -1
        love.audio.play(disappointmentSound)
        --c = CameraShake(.3,1)
        --table.insert(actorList, c)
        
      lastMoveState = moveState
      moveState = 4
       t = Timer(1, function() 
          moveState = lastMoveState
        end, false)
      table.insert(actorList,t)
      end
    end
    end
  end
    
end
function DrinkingGame:draw()
  love.graphics.draw(background.imgShown,80,80,0,.9,.9,0,0,0,0)
  if (moveState == 1 or moveState == 2) then love.graphics.draw(slider.img,slider.x,slider.y,0,1,1,slider.ox,slider.oy,0,0) end
  if (moveState == 1 or moveState == 2) then love.graphics.draw(playerBar.img,playerBar.x,playerBar.y,0,1,1,slider.ox,slider.oy,0,0) end
  if (moveState == 4) then love.graphics.draw(sadFace,550,350,0,1,1,0,0,0,0) end
  love.graphics.print("Time left: "..timeShown,1475,120,0,2,2,0,0,0)
  love.graphics.print("Points: "..self.points,1475,150,0,2,2,0,0,0)
  love.graphics.print("Shots taken: "..shots,1475,180,0,2,2,0,0,0)
  love.graphics.print("Tries: "..tries,1475,210,0,2,2,0,0,0)
end


return DrinkingGame