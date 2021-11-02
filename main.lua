--Takeo Watanabe
Data = Data or require "Game/data"

function love.load(arg)
  StartGame()
end

function love.update(dt)
  Scene.getScene():update(dt)
end

function love.draw()
  Scene.getScene():draw()
end

function love.keypressed(key, scancode, isrepeat)
	if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen)
	end
end