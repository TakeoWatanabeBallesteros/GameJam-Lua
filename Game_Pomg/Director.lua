--Takeo Watanabe y Jan de Nobel
Pong_Director = Pong_Object:extend()

local fsm = Pong_FSM.create({
events = {
    { name = 'startgame',  from = {'none'},  to = 'intro' },
    { name = 'tomenu', from = {'intro', 'game', 'leaderboard', 'gameover', 'settings', 'gameselect'}, to = 'menu' },
    { name = 'togameselect', from = 'menu', to = 'gameselect'},
    { name = 'togame',  from = {'gamneover', 'pause', 'gameselect', 'none', 'menu'}, to = 'game' },
    { name = 'topause', from = 'game', to = 'pause'  },
    { name = 'tosettings', from = 'menu', to = 'settings' },
    { name = 'toleaderboard', from = {'menu', 'gameover'}, to='leaderboard'},
    { name = 'togameover', from = 'game', to = 'gameover'},
    { name = 'tonone', from = 'gameover', to = 'none'}
},
callbacks = {
    onenterintro =  function(self, event, from, to) Pong_Scene.getScene():addActor(Pong_Intro) end,
    onleaveintro = function(self, event, from, to)  Pong_Scene.getScene():removeActor(Pong_Intro) end,
    onentermenu =  function(self, event, from, to) Pong_Scene.getScene():addActor(Pong_Menu) end,
    onleavemenu = function(self, event, from, to)  Pong_Scene.getScene():removeActor(Pong_Menu) end,
    onentergameselect =  function(self, event, from, to) Pong_Scene.getScene():removeActor(Pong_Menu) end,
    onleavegameselect = function(self, event, from, to) Pong_Scene.getScene():removeActor(Pong_GameSelect)
        if to == 'menu' then
            Pong_Scene.getScene():addActor(Pong_Menu)
        end
    end,
    onentergame = function(self, event, from, to)  Pong_Scene.getScene():addActor(Pong_CameraShake)
        Pong_Scene.getScene():addActor(Pong_Field)
        Pong_Scene.getScene():addActor(Pong_HUD)
        Pong_Scene.getScene():addActor(Pong_PaddleP1)
        Pong_Scene.getScene():addActor(Pong_PaddleP2)
        Pong_Scene.getScene():addActor(Pong_Ball)  
        Pong_AudioManager.PlaySound(Pong_SETTINGS_AUDIO_GAME_MUSIC, .2, true) end,
    onleavegame = function(self, event, from, to)
        Pong_Scene.getScene():removeActor(Pong_CameraShake)
        Pong_Scene.getScene():removeActor(Pong_Field)
        Pong_Scene.getScene():removeActor(Pong_HUD)
        Pong_Scene.getScene():removeActor(Pong_PaddleP1)
        Pong_Scene.getScene():removeActor(Pong_PaddleP2)
        Pong_Scene.getScene():removeActor(Pong_Ball) end,
    onenterpause =    function(self, event, from, to) print('pause') end,
    onentersettings = function(self, event, from, to) Pong_Scene.getScene():addActor(Pong_Settings) end,
    onleavesettings = function(self, event, from, to) Pong_Scene.getScene():removeActor(Pong_Settings) end,
    onenterleaderboard =    function(self, event, from, to) print('leaderboard') end,
    ontogameover = function(self, event, from, to, string) Pong_SETTINGS_WIN_OR_LOSE = string end,
    onentergameover = function(self, event, from, to) Pong_AudioManager.StopSound(Pong_SETTINGS_AUDIO_GAME_MUSIC) Pong_Scene.getScene():addActor(Pong_GameOver) end,
    onleavegameover = function(self, event, from, to)   Pong_Scene.getScene():removeActor(Pong_GameOver) end,
}
})

function Pong_Director.goIntro()
    fsm:startgame()
end

function Pong_Director.goMenu()
    fsm:tomenu()
end

function Pong_Director.goGameSelect()
    fsm:togameselect()
end

function Pong_Director.goGame()
    fsm:togame()
end

function Pong_Director.goPause()
    fsm:topause()
end

function Pong_Director.goSettings()
    fsm:tosettings()
end

function Pong_Director.goLeaderBoard()
    fsm:toleaderboard()
end

function Pong_Director.goGameOver(string)
    fsm:togameover(string)
end
function Pong_Director.goNone(string)
    fsm:tonone(string)
end

return Pong_Director