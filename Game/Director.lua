function StartGame()
    Main_FSM = StateMachine()
    Main_FSM:addState("null",{})
    Main_FSM:addState("splash",{ enter = onSplashEnter, exit = onSplashExit , from="null"})
    Main_FSM:addState("menu",{ enter= onMenuEnter, exit= onMenuExit, from={"splash", 'settings', 'play'}})
    Main_FSM:addState("settings", {enter=onSettingsEnter, exit=onSettingsExit, from='menu'})
    Main_FSM:addState("play",{ enter= onPlayEnter, exit= onPlayExit, from="menu"})
    Main_FSM:addState("editor", { parent='play', enter=onEditorEnter, exit=onEditorExit, from='play'})
    
    Main_FSM:setInitialState("null")Main_FSM:changeState("splash")
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
    Scene.getScene():addActor(Settings)
  end
  
  function onSettingsExit()
    Scene.getScene():removeActor(Settings)
  end
  
  function onPlayEnter()
  end
  
  function onPlayExit()
  end