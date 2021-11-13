function StartGame()
    Main_FSM = StateMachine()
    Main_FSM:addState("null",{})
    Main_FSM:addState("splash_01",{ enter = onSplash_01Enter, exit = onSplash_01Exit , from="null"})
    Main_FSM:addState("splash_02",{ enter = onSplash_02Enter, exit = onSplash_02Exit , from="splash_03"})
    Main_FSM:addState("splash_03",{ enter = onSplash_03Enter, exit = onSplash_03Exit , from="splash_01"})
    Main_FSM:addState("menu",{ enter= onMenuEnter, exit= onMenuExit, from={"splash_01", "splash_02", "splash_03", 'settings', 'menu_avatar', 'menu_characters', 'menu_minigames'}})
    Main_FSM:addState("menu_characters", {enter=onMenu_CharactersEnter, exit=onMenu_CharactersExit, from='menu'})
    Main_FSM:addState("menu_minigames", {enter=onMenu_MinigamesEnter, exit=onMenu_MinigamesExit, from='menu'})
    Main_FSM:addState("settings", {enter=onSettingsEnter, exit=onSettingsExit, from='menu'})
    Main_FSM:addState("play",{ enter= onPlayEnter, exit= onPlayExit, from="menu"})
    Main_FSM:addState("menu_avatar", { parent='play', enter=onMenu_AvatarEnter, exit=onMenu_AvatarExit, from={'play', 'editor'}})
    Main_FSM:addState("editor", { parent='play', enter=onEditorEnter, exit=onEditorExit, from='menu_avatar'})
    Main_FSM:addState("intro",{ enter= onIntroEnter, exit= onIntroExit, from={'editor', 'menu_avatar'}})
    


    Main_FSM:addState("topo",{ enter= onTopoEnter, exit= onTopoExit, from="null"}) 
    Main_FSM:addState("vodka",{ enter= onDrinkingGameEnter, exit= onDrinkingGameExit, from="null"})
    Main_FSM:addState("blackjack", {enter = onBlackjackEnter, exit= onBlackjackExit, from='null'})
    Main_FSM:addState("gancho", {enter = onGanchoEnter, exit= onGanchoExit, from='null'})
    Main_FSM:addState("programar", {enter = onProgramarEnter, exit= onBlackjackExit, from='null'})

    Main_FSM:setInitialState("null")Main_FSM:changeState("splash_01")
end
function onSplash_01Enter()
    love.mouse.setVisible(false)
    local s = SplashLib.new({background={0, 0, 0}})
    s.onDone = function() Main_FSM:changeState('splash_03') Scene.getScene():removeThisActor(s) end
    Scene.getScene():addSplashScreen(s)
  end
  
  function onSplash_01Exit()
    
  end

  function onSplash_02Enter()
    local s = SplashLib.new({fill = 'rain'})
    s.onDone = function() Main_FSM:changeState('menu') Scene.getScene():removeThisActor(s) end
    Scene.getScene():addSplashScreen(s)
  end
  
  function onSplash_02Exit()
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
  end
  
  function onSettingsEnter()
    Scene.getScene():addActor(Settings)
  end
  
  function onSettingsExit()
    Scene.getScene():removeActor(Settings)
  end
  
  function onPlayEnter()
    Main_FSM:changeState("menu_avatar")
  end
  
  function onPlayExit()
  end

  function onMenu_AvatarEnter()
    Scene.getScene():addActor(Menu_Avatar)
  end

  function onMenu_AvatarExit()
    Scene.getScene():removeActor(Menu_Avatar)
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
    Scene.getScene():addActor(Topo_State_Manager)
  end

  function onTopoExit()
    Scene.getScene():removeActor(Topo_State_Manager)
    Scene.getScene():removeActor(BACKGROUND_TOPO_GAME)
    Scene.getScene():removeActor(MAZO_TOPO_GAME)
    Scene.getScene():removeActor(TOPO_TOPO_GAME)
  end

  function onBlackjackEnter()
    Scene.getScene():addActor(Blackjack_Background)
    Scene.getScene():addActor(Blackjack_Player)
    Scene.getScene():addActor(Blackjack_Dealer)
    Scene.getScene():addActor(Blackjack_Manager)
  end

  function onProgramarEnter()
    Scene.getScene():addActor(Programar_Manager)
  end
  
  function onDrinkingGameEnter()
    Scene:getScene():addActor(BACKGROUND_DRINKING_GAME)
    Scene:getScene():addActor(SLIDER_DRINKING_GAME)
    Scene:getScene():addActor(PLAYERBAR_DRINKING_GAME)
    Scene:getScene():addActor(DRINKING_GAME)

  end

  function onDrinkingGameExit()
    Scene:getScene():removeActor(BACKGROUND_DRINKING_GAME)
    Scene:getScene():removeActor(SLIDER_DRINKING_GAME)
    Scene:getScene():removeActor(PLAYERBAR_DRINKING_GAME)
    Scene:getScene():removeActor(DRINKING_GAME)
  end

  function onGanchoEnter()
    Scene:getScene():addActor(Gancho_Background)
    Scene:getScene():addActor(Gancho_Gancho)
    Scene:getScene():addActor(Gancho_Manager)
  end

  function onGanchoExit()
    Scene:getScene():removeActor(Gancho_Background)
    Scene:getScene():removeActor(Gancho_Gancho)
  end
