function StartGame()
    Main_FSM = StateMachine()
    Main_FSM:addState("null",{})
    Main_FSM:addState("splash_01",{ enter = onSplash_01Enter, exit = onSplash_01Exit , from="null"})
    Main_FSM:addState("splash_02",{ enter = onSplash_02Enter, exit = onSplash_02Exit , from="splash_04"})
    Main_FSM:addState("splash_03",{ enter = onSplash_03Enter, exit = onSplash_03Exit , from="splash_01"})
    Main_FSM:addState("splash_04",{ enter = onSplash_04Enter, exit = onSplash_04Exit , from="splash_03"})
    Main_FSM:addState("menu",{ enter= onMenuEnter, exit= onMenuExit, from={"splash_01", "splash_02", "splash_03", 'splash_04', 'settings', 'menu_avatar', 
                                                                                    'menu_characters', 'menu_minigames', 'intro', 'pong',
                                                                                    "topo", "vodka", "blackjack", "gancho", "programar","dormir", 'chao', 'final'}})
    Main_FSM:addState("menu_characters", {enter=onMenu_CharactersEnter, exit=onMenu_CharactersExit, from='menu'})
    Main_FSM:addState("menu_minigames", {enter=onMenu_MinigamesEnter, exit=onMenu_MinigamesExit, from={'menu','pong',
    "topo", "vodka", "blackjack", "gancho", "programar","dormir"}})
    Main_FSM:addState("settings", {enter=onSettingsEnter, exit=onSettingsExit, from='menu'})
    Main_FSM:addState("play",{ enter= onPlayEnter, exit= onPlayExit, from="menu"})
    Main_FSM:addState("menu_avatar", { parent='play', enter=onMenu_AvatarEnter, exit=onMenu_AvatarExit, from={'play', 'editor'}})
    Main_FSM:addState("editor", { parent='play', enter=onEditorEnter, exit=onEditorExit, from='menu_avatar'})
    Main_FSM:addState("intro",{ enter= onIntroEnter, exit= onIntroExit, from={'editor', 'menu_avatar'}})
    Main_FSM:addState("character_select",{ enter= onCharacter_SelectEnter, exit= onCharacter_SelectExit, from={'intro'}})
    Main_FSM:addState("dialog",{ enter= onDialogEnter, exit= onDialogExit,from={'editor', "character_select",'menu_avatar', 'pong',
    "topo", "vodka", "blackjack", "gancho", "programar","dormir"}})

    Main_FSM:addState("chao",{ enter= onChaoEnter, exit= onChaoExit, from={'dialog','null'}}) 
    Main_FSM:addState("final",{ enter= onFinalEnter, exit= onFinalExit, from={'dialog', 'null'}})



    Main_FSM:addState("topo",{ enter= onTopoEnter, exit= onTopoExit, from={'dialog', 'menu_minigames'}}) 
    Main_FSM:addState("vodka",{ enter= onDrinkingGameEnter, exit= onDrinkingGameExit, from={'dialog', 'menu_minigames'}})
    Main_FSM:addState("blackjack", { enter = onBlackjackEnter, exit= onBlackjackExit, from={'dialog', 'menu_minigames'}})
    Main_FSM:addState("gancho", { enter = onGanchoEnter, exit= onGanchoExit, from={'dialog', 'menu_minigames'}})
    Main_FSM:addState("programar", { enter = onProgramarEnter, exit= onProgramarExit, from={'dialog', 'menu_minigames'}})
    Main_FSM:addState("dormir", { enter = onDormirEnter, exit= onDormirExit, from={'dialog', 'menu_minigames'}})
    Main_FSM:addState("pelea", { enter = onPeleaEnter, exit= onPeleaExit, from={'dialog', 'menu_minigames'}})
    Main_FSM:addState("pong", { enter = onPongEnter, exit= onPongExit, from={'dialog', 'menu_minigames'}})

    Main_FSM:setInitialState("null") Main_FSM:changeState('splash_01')
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
  Scene.getScene():addActor(Intro_02)  
  local s = SplashLib.new({fill = 'rain'})
  s.onDone = function() Main_FSM:changeState('menu') Scene.getScene():removeThisActor(s) Scene.getScene():removeActor(Intro_02) end
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

function onSplash_04Enter()
  Scene.getScene():addActor(Intro_04)
end
  
function onSplash_04Exit()
  Scene.getScene():removeActor(Intro_04)
end
  
function onMenuEnter()
  Scene.getScene():addActor(Menu)
end
  
function onMenuExit()
  Scene.getScene():removeActor(Menu)
end

function onMenu_MinigamesEnter()
  Scene.getScene():addActor(Menu_Minigames)
  Scene:getScene():removeActor(Pong_Manager)
end

function onMenu_MinigamesExit()
  Scene.getScene():removeActor(Menu_Minigames)
end

function onMenu_CharactersEnter()
  Scene.getScene():addActor(Menu_Characters)
end
  
function onMenu_CharactersExit()
  Scene.getScene():removeActor(Menu_Characters)
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
end

function onIntroEnter()
  ON_PAUSE = false
  local d = Dialog('Data/Dialogues/Intro.json')
  Scene.getScene():addDialog(d)
  COMPATIBILIDAD = 50
end

function onIntroExit()
  ON_PAUSE = true
  Scene.getScene():removeActor(Dialog)
end

function onCharacter_SelectEnter()
  Scene.getScene():addActor(Characters_Selection)
end

function onCharacter_SelectExit()
  Scene.getScene():removeActor(Characters_Selection)
end

function onDialogEnter()
  ON_PAUSE = false
end

function onDialogExit()
end

function onTopoEnter()
  Scene.getScene():addActor(BACKGROUND_TOPO_GAME)
  Scene.getScene():addActor(MAZO_TOPO_GAME)
  Scene.getScene():addActor(TOPO_TOPO_GAME)
  Scene.getScene():addActor(Topo_State_Manager)
  ON_PAUSE = true
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
  ON_PAUSE = true
end

function onBlackjackExit()
  Scene.getScene():removeActor(Blackjack_Background)
  Scene.getScene():removeActor(Blackjack_Player)
  Scene.getScene():removeActor(Blackjack_Dealer)
  Scene.getScene():removeActor(Blackjack_Manager)
end

function onProgramarEnter()
  Scene.getScene():addActor(Programar_Manager_)
  ON_PAUSE = true
end

function onProgramarExit()
  Scene.getScene():removeActor(Programar_Manager_)
end

function onDormirEnter()
  Scene.getScene():addActor(Dormir_Manager)
  ON_PAUSE = true
end

function onDormirExit()
  Scene.getScene():removeActor(Dormir_Manager)
end

function onPongEnter()
  Scene:getScene():addActor(Pong_Manager)
  ON_PAUSE = true
end

function onPongExit()
  Scene:getScene():removeActor(Pong_Manager)
end

function onDrinkingGameEnter()
  Scene:getScene():addActor(BACKGROUND_DRINKING_GAME)
  Scene:getScene():addActor(SLIDER_DRINKING_GAME)
  Scene:getScene():addActor(PLAYERBAR_DRINKING_GAME)
  Scene:getScene():addActor(DRINKING_GAME)
  ON_PAUSE = true
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
  ON_PAUSE = true
end

function onGanchoExit()
  Scene:getScene():removeActor(Gancho_Background)
  Scene:getScene():removeActor(Gancho_Gancho)
  Scene:getScene():removeActor(Gancho_Manager)
end

function onPeleaEnter()
  Scene.getScene():addActor(BeatemUp_Background)
  Scene.getScene():addActor(BeatemUp_Manager)
end

function onPeleaExit()
end

function onChaoEnter()
  Scene.getScene():removeActor(Dialog)
  Scene.getScene():addActor(Final_Malo)
  ON_PAUSE = true
end

function onChaoExit()
  Scene.getScene():removeActor(Final_Malo)
end

function onFinalEnter()
  Scene.getScene():removeActor(Dialog)
  Scene.getScene():addActor(Final_Malo)
  ON_PAUSE = true
end

function onFinalExit()
  Scene.getScene():removeActor(Final_Malo)
end
