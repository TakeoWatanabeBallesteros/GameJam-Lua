Data = Data or require "Game/data"

function love.load(arg)
  SaveManager:load()
  love.window.setFullscreen(true)
  WW, WH = love.graphics.getDimensions()
  print(WW, WH)
  StartGame()
  love.audio.setVolume(GAME_SETTINGS_VOLUME_MASTER)
end

function love.update(dt)
  Scene.getScene():update(dt)
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