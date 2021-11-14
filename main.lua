Data = Data or require "Game/data"

local appId = require("applicationId")

function love.load(arg)
  SaveManager:load()
  love.window.setFullscreen(true)
  WW, WH = love.graphics.getDimensions()
  print(WW, WH)
  StartGame()
  love.audio.setVolume(GAME_SETTINGS_VOLUME_MASTER)
  Discord_RPC.initialize(appId, true)
  now = os.time(os.date("*t"))
  detailsNow = "In Mainmenu"
  stateNow = ""
  nextPresenceUpdate = 0
  SPRITES_MAPPING_1()
end

function discordApplyPresence()
  if Main_FSM.state == "menu" then
    detailsNow = 'In Mainmenu'
    stateNow = ''
  elseif Main_FSM.state == "menu_characters" then
    detailsNow = 'In Menu Characters'
    stateNow = ''
  elseif Main_FSM.state == "menu_minigames" then
    detailsNow = 'In Menu Minigames'
    stateNow = ''
  elseif Main_FSM.state == "menu_avatar" then
    detailsNow = 'In Avatar Selection'
    stateNow = ''
  elseif Main_FSM.state == "editor" then
    detailsNow = 'In Avatar Editor'
    stateNow = ''
  elseif Main_FSM.state == "settings" then
    detailsNow = 'In Settings'
    stateNow = ''
  else
    detailsNow = "Playing"
    stateNow = ""
  end

  presence = {
    largeImageKey = "largeimage",
    largeImageText = "TecnoDates 0.8.0",
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
end

function love.quit()
  Discord_RPC.shutdown()
end

--[[ function love.keypressed(key, scancode, isrepeat)
	if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen)
    WW, WH = love.graphics.getDimensions()
	end
end ]]