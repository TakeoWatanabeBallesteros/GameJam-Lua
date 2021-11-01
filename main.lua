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
