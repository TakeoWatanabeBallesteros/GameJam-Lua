--Takeo Watanabe
Data = Data or require "Game/data"

function love.load(arg)
  love.window.setFullscreen(true)
  WW, WH = love.graphics.getDimensions()
  print(WW, WH)
  love.mouse.setVisible(false)
  StartGame()
  love.audio.setVolume(GAME_SETTINGS_VOLUME)
end

function love.update(dt)
  Scene.getScene():update(dt)
end
--aa
function love.draw()
  Scene.getScene():draw()
end

--[[ function love.keypressed(key, scancode, isrepeat)
	if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen)
    WW, WH = love.graphics.getDimensions()
	end
end ]]