BackgroundDrinkinGame = Actor:extend()

function BackgroundDrinkinGame:new()
    self.BACKGROUND_DRINKINGAME_Shown = BACKGROUND_DRINKINGAME_0
    BackgroundDrinkinGame.super.new(self,self.BACKGROUND_DRINKINGAME_Shown,WW/2,WH/2,0,0,0, 'Background')
end
function BackgroundDrinkinGame:update(dt)
end
function BackgroundDrinkinGame:draw()

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/self.width
    local sy = WH/self.height
    local rr = 0
    love.graphics.draw(self.BACKGROUND_DRINKINGAME_Shown,xx,yy,rr,sx,sy,ox,oy,0,0)
    if (moveStateDrinkingGame == 4) then love.graphics.draw(SAD_FACE_DRINKINGAME,WW/3,WH/3.5,0,1,1,0,0,0,0) end
end
function BackgroundDrinkinGame:mousepressed(x, y, button, istouch,presses )
end

function BackgroundDrinkinGame:mousereleased(x,y,button,istouch,presses )
end

function BackgroundDrinkinGame:keypressed(key)
end
function BackgroundDrinkinGame:keyreleased(key)
end
return BackgroundDrinkinGame