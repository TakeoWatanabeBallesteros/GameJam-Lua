--Takeo Watanabe
Data = Data or require "Game/data"

function love.load(arg)
  Main_FSM = StateMachine()
  Main_FSM:addState("null",{})
  Main_FSM:addState("splash",{ enter = onSplashEnter, exit = onSplashExit , from="null"})
  Main_FSM:addState("menu",{ enter= onMenuEnter, exit= onMenuExit, from={"splash", 'settings', 'play'}})
  Main_FSM:addState("settings", {enter=onSettingsEnter, exit=onSettingsExit, from='menu'})
  Main_FSM:addState("play",{ enter= onPlayEnter, exit= onPlayExit, from="menu"})
  Main_FSM:setInitialState("null")Main_FSM:changeState("splash")
end

function love.update(dt)
  Scene.getScene():update(dt)
end

function love.draw()
  Scene.getScene():draw()
end

function onSplashEnter()
  Scene.getScene():addActor(Intro)
end

function onSplashExit()
  Scene.getScene():removeActor(Intro)
end

function onMenuEnter()
  Scene.getScene():addActor(Menu)
end

function onMenuExit()
  Scene.getScene():removeActor(Menu)
end

function onSettingsEnter()
end

function onSettingsExit()
end

function onPlayEnter()
end

function onPlayExit()
end