Data = Data or require "Game/data"

id = '909024282619813918'

function love.load(arg)
  SaveManager:load()
  love.window.setFullscreen(true)
  WW, WH = love.graphics.getDimensions()
  print(WW, WH)
  StartGame()
  love.audio.setVolume(GAME_SETTINGS_VOLUME_MASTER)
  Discord_RPC.initialize(id, true)
  now = os.time(os.date("*t"))
  detailsNow = "In Mainmenu"
  stateNow = ""
  nextPresenceUpdate = 0
end

function discordApplyPresence()
  if Main_FSM.state == "menu" then
    detailsNow = 'In Mainmenu'
    stateNow = ''
  else
    detailsNow = "In Mainmenu"
    stateNow = ""
  end

  presence = {
    largeImageKey = "largeimage",
    largeImageText = "TecnoDates 0.6.0",
    details = detailsNow,
    state = stateNow,
    startTimestamp = now,
  }

  return presence
end

function love.update(dt)
  Scene.getScene():update(dt)
  if nextPresenceUpdate < love.timer.getTime() then
    Discord_RPC.updatePresence(discordApplyPresence())
    nextPresenceUpdate = love.timer.getTime() + 2.0
  end
  Discord_RPC.runCallbacks()
end
--aa
function love.draw()
  Scene.getScene():draw()
  love.graphics.setColor(1,1,1)
  love.graphics.line(WW/2,0, WW/2, WH)
end

--[[ function love.keypressed(key, scancode, isrepeat)
	if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen)
    WW, WH = love.graphics.getDimensions()
	end
end ]]