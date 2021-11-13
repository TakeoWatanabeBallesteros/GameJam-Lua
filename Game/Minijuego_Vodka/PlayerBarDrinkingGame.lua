PlayerBarDrinkingGame = Actor:extend()

function PlayerBarDrinkingGame:new()
    PlayerBarDrinkingGame.super.new(self,PLAYERBAR_DRINKINGAME,WW/2,WH/3,0,0,0, 'Middle')
end
function PlayerBarDrinkingGame:update(dt)
end
function PlayerBarDrinkingGame:draw()

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    if (moveStateDrinkingGame == 1 or moveStateDrinkingGame == 2) and GameStateDrinkingGame == "PlayingGame" then love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0) end

end
function PlayerBarDrinkingGame:mousepressed(x, y, button, istouch,presses )
end

function PlayerBarDrinkingGame:mousereleased(x,y,button,istouch,presses )
end

function PlayerBarDrinkingGame:keypressed(key)
end
function PlayerBarDrinkingGame:keyreleased(key)
end
return PlayerBarDrinkingGame