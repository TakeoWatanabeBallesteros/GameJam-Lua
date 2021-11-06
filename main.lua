--Takeo Watanabe
Data = Data or require "Game/data"

function love.load(arg)
  love.window.setFullscreen(true)
  WW, WH = love.graphics.getDimensions()
  StartGame()
  love.audio.setVolume(.6)
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