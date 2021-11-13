SliderDrinkingGame = Actor:extend()

function SliderDrinkingGame:new()
    SliderDrinkingGame.super.new(self,SLIDER_DRINKINGAME,WW/2,WH/3,0,0,0, 'Middle')
end
function SliderDrinkingGame:update(dt)
end
function SliderDrinkingGame:draw()

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    if (moveStateDrinkingGame == 1 or moveStateDrinkingGame == 2) and GameStateDrinkingGame == "PlayingGame" then love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0) end
end
function SliderDrinkingGame:mousepressed(x, y, button, istouch,presses )
end

function SliderDrinkingGame:mousereleased(x,y,button,istouch,presses )
end

function SliderDrinkingGame:keypressed(key)
end
function SliderDrinkingGame:keyreleased(key)
end
return SliderDrinkingGame