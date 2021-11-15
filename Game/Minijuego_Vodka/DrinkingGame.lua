Actor = Actor or require "Scripts/actor"
Timer = Timer or require "Scripts/Timer"
CameraShake = CameraShake or require "Scripts/CameraShake"
DrinkingGame = Actor:extend()
BackgroundDrinkinGame = BackgroundDrinkinGame or require "Game/Minijuego_Vodka/BackgroundDrinkinGame"
SLIDER_DRINKING_GAME = SLIDER_DRINKING_GAME or require "Game/Minijuego_Vodka/SliderDrinkingGame"
PLAYERBAR_DRINKING_GAME = PLAYERBAR_DRINKING_GAME or require "Game/Minijuego_Vodka/PlayerBarDrinkingGame"

moveStateDrinkingGame = 1
local lastmoveStateDrinkingGame

local background,slider,playerBar

local t, globalTimer

GameStateDrinkingGame = GameStateDrinkingGame

function DrinkingGame:new()
  DrinkingGame.super.new(self,SLIDER_DRINKINGAME,WW,-WH,0,0,0, 'HUD')
  GameStateDrinkingGame = {"PlayingGame", "EndGame"}
  GameStateDrinkingGame = "PlayingGame"
  globalTimer = Timer(30,function() GameStateDrinkingGame = "EndGame" end, false)
  Scene.getScene():addTimerObj(globalTimer)

  AudioManager.PlayMusic(BACKGROUND_SOUND_DRINKINGAME,GAME_SETTINGS_VOLUME_MUSIC/6,false)

  self.shots = 0
  self.tries = 0
  self.speed = 700
  self.points = 0

  for _,v in ipairs(Scene.getScene():getActorList()) do
    if v:is(PLAYERBAR_DRINKING_GAME) then
    playerBar = v
    break
  end
end
  for _,v in ipairs(Scene.getScene():getActorList()) do
    if v:is(SLIDER_DRINKING_GAME) then
    slider = v
    break
  end
end
for _,v in ipairs(Scene.getScene():getActorList()) do
  if v:is(BackgroundDrinkinGame) then
  background = v
  break
end
end
  
end
function DrinkingGame:update(dt)

  if GameStateDrinkingGame == "PlayingGame" then
      if moveStateDrinkingGame == 1 then playerBar.position.x = playerBar.position.x + self.speed*dt end
      if moveStateDrinkingGame == 2 then playerBar.position.x = playerBar.position.x - self.speed*dt end
      if moveStateDrinkingGame == 3 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_Drinking
      else 
        if self.shots == 0 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_0 end
        if self.shots == 1 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_1 end
        if self.shots == 2 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_2 end
        if self.shots == 3 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_3 end
        if self.shots == 4 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_4 end
        if self.shots == 5 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_5 end
        if self.shots == 6 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_6 end
        if self.shots == 7 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_7 end
        if self.shots == 8 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_8 end
        if self.shots > 8 then background.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_9 end
      end
  
      if playerBar.position.x < slider.position.x - slider.width*0.4 then 
        playerBar.position.x = slider.position.x - slider.width*0.4+2
        moveStateDrinkingGame = 1
      end
      
      if playerBar.position.x > slider.position.x + slider.width*0.4 then 
        playerBar.position.x = slider.position.x + slider.width*0.4-2
        moveStateDrinkingGame = 2
      end
    elseif GameStateDrinkingGame == "EndGame" then
      AudioManager.StopSound(BACKGROUND_SOUND_DRINKINGAME)
      COMPATIBILIDAD = COMPATIBILIDAD+self.points
      if not MINIGAME then
        love.mouse.setVisible(true)
        Main_FSM:changeState('dialog')
      else Main_FSM:changeState('menu_minigames') MINIGAME = false end
      end
  
    
end
function DrinkingGame:draw()
  if GameStateDrinkingGame == "PlayingGame" then
  love.graphics.print(math.floor(globalTimer:getTime()),WW/2.1, WH/1.15,0,WW/1920,WH/1080,0,0,0,0)
  love.graphics.print("Points: "..self.points,WW/1.2,WH/30,0,WW/1920,WH/1080,0,0,0)
  love.graphics.print("Shots taken: "..self.shots,WW/1.2,WH/10,0,WW/1920,WH/1080,0,0,0)
  love.graphics.print("Tries: "..self.tries,WW/1.2,WH/6,0,WW/1920,WH/1080,0,0,0)
  end
end

function DrinkingGame:mousepressed(x, y, button, istouch,presses )
end

function DrinkingGame:mousereleased(x,y,button,istouch,presses )
end

function DrinkingGame:keypressed(key)
  if GameStateDrinkingGame == "PlayingGame" then
    if key == "space" then
      if moveStateDrinkingGame == 1 or moveStateDrinkingGame == 2 then
      self.speed = self.speed +220
      self.tries = self.tries+1
      if playerBar.position.x > slider.position.x-slider.width*0.1 and playerBar.position.x < slider.position.x+slider.width*0.1 then
       self.shots = self.shots+1
       lastmoveStateDrinkingGame = moveStateDrinkingGame
       moveStateDrinkingGame = 3
       self.points = self.points+3
       AudioManager.PlayMusic(DRINK_SOUND,GAME_SETTINGS_VOLUME_EFFECTS,false)
       --Scene.getScene():addActor(CameraShake(.2,.4))
       t = Timer(3.5,function() moveStateDrinkingGame = lastmoveStateDrinkingGame end, false)
       Scene.getScene():addTimerObj(t)
      else
        self.points = self.points -1
        AudioManager.PlayMusic(DISAPPOINTMENT_SOUND,GAME_SETTINGS_VOLUME_EFFECTS/6,false)
        --Scene.getScene():addActor(CameraShake(.3,.6))

      lastmoveStateDrinkingGame = moveStateDrinkingGame
      moveStateDrinkingGame = 4
      
      t = Timer(1,function() moveStateDrinkingGame = lastmoveStateDrinkingGame end, false)
      Scene.getScene():addTimerObj(t)
      end
    end
    end
  end
  end
  
function DrinkingGame:keyreleased(key)
end


return DrinkingGame