Actor = Actor or require "Scripts/actor"
Background = Actor:extend()

local background

function Background:new()
  background = love.graphics.newImage("Textures/background.png")
end
function Background:update()
end
function Background:draw()
  love.graphics.draw(background,100,0,0,0.9,0.9,0,0,0,0)
end
return Background