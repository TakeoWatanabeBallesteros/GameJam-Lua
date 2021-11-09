function StartGame()
    Main_FSM = StateMachine()
    Main_FSM:addState("null",{})
    Main_FSM:addState("splash_01",{ enter = onSplash_01Enter, exit = onSplash_01Exit , from="null"})
    Main_FSM:addState("splash_02",{ enter = onSplash_02Enter, exit = onSplash_02Exit , from="splash_01"})
    Main_FSM:addState("splash_03",{ enter = onSplash_03Enter, exit = onSplash_03Exit , from="splash_02"})
    Main_FSM:addState("menu",{ enter= onMenuEnter, exit= onMenuExit, from={"splash_01", "splash_02", "splash_03", 'settings', 'editor'}})
    Main_FSM:addState("settings", {enter=onSettingsEnter, exit=onSettingsExit, from='menu'})
    Main_FSM:addState("play",{ enter= onPlayEnter, exit= onPlayExit, from="menu"})
    Main_FSM:addState("editor", { parent='play', enter=onEditorEnter, exit=onEditorExit, from='play'})
    Main_FSM:addState("intro",{ enter= onIntroEnter, exit= onIntroExit, from="editor"})
    
    Main_FSM:setInitialState("null")Main_FSM:changeState("splash_01")
end
function onSplash_01Enter()
    local s = SplashLib.new({background={0, 0, 0}})
    s.onDone = function() Main_FSM:changeState('splash_02') Scene.getScene():removeThisActor(s) end
    Scene.getScene():addSplashScreen(s)
  end
  
  function onSplash_01Exit()
    
  end

  function onSplash_02Enter()
    Scene.getScene():addActor(Intro_01)
  end
  
  function onSplash_02Exit()
    Scene.getScene():removeActor(Intro_01)
  end

  function onSplash_03Enter()
    Scene.getScene():addActor(Intro_03)
  end
  
  function onSplash_03Exit()
    Scene.getScene():removeActor(Intro_03)
  end
  
  function onMenuEnter()
    Scene.getScene():addActor(Menu)
  end
  
  function onMenuExit()
    Scene.getScene():removeActor(Menu)
    Scene.getScene():removeActor(Buttons)
  end
  
  function onSettingsEnter()
    Scene.getScene():addActor(Settings)
  end
  
  function onSettingsExit()
    Scene.getScene():removeActor(Settings)
    Scene.getScene():removeActor(Buttons)
  end
  
  function onPlayEnter()
    Main_FSM:changeState("editor")
  end
  
  function onPlayExit()
  end

  function onEditorEnter()
    Scene.getScene():addActor(Editor)
  end

  function onEditorExit()
    Scene.getScene():removeActor(Editor)
    Scene.getScene():removeActor(Buttons)
    Scene.getScene():removeActor(Buttons)
  end

  function onIntroEnter()
    local d = Dialog('Data/Dialogues/Intro.json')
    Scene.getScene():addDialog(d)
  end

  function onIntroExit()

  end

  
  function onTopoEnter()
    Scene.getScene():addActor(BACKGROUND_TOPO_GAME)
    Scene.getScene():addActor(MAZO_TOPO_GAME)
    Scene.getScene():addActor(TOPO_TOPO_GAME)
  end

  function onTopoExit()
    Scene.getScene():removeActor(BACKGROUND_TOPO_GAME)
    Scene.getScene():removeActor(MAZO_TOPO_GAME)
    Scene.getScene():removeActor(TOPO_TOPO_GAME)


  end
