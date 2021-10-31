--Takeo Watanabe
Director = Object:extend()

local fsm = FSM.create({
events = {
    { name = 'startgame',  from = 'none',  to = 'intro' },
    { name = 'tomenu', from = {'intro', 'game'}, to = 'menu' },
    { name = 'togame',  from = {'menu', 'pause', 'none', 'game'}, to = 'game' },
    { name = 'topause', from = 'game', to = 'pause'  },
},
callbacks = {
    onenterintro =  function(self, event, from, to) Scene.getScene():addActor(Intro) end,
    onleaveintro = function(self, event, from, to) Scene.getScene():addActor(Menu) end,
    onentermenu =  function(self, event, from, to) Scene.getScene():removeActor(Intro) end,
    onleavemenu = function(self, event, from, to)  end,
    onentergame = function(self, event, from, to)  end,
    onleavegame = function(self, event, from, to) Scene.getScene():removeAllActors() end,
    onenterpause = function(self, event, from, to) end,
    onleavepause = function(self, event, from, to) end,
}
})

function Director.goIntro()
    fsm:startgame()
end

function Director.goMenu()
    fsm:tomenu()
end

function Director.goGame()
    fsm:togame()
end

function Director.goPause()
    fsm:topause()
end

return Director