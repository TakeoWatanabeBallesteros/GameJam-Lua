Editor = Actor:extend()

function Editor:new()
    self.font = FONT_OTAKU_BUTTONS
    self.buttons = Buttons(self.font)
    --love.graphics.setFont(love.graphics.newFont("/Data/pong.ttf", 70))
    Editor.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    self.buttons:newButton(
        "Start Game", 
        function()
            Main_FSM:changeState('play')
        end)
    self.buttons:newButton(
        "Settings", 
        function()
            Main_FSM:changeState('settings')
        end)
    self.buttons:newButton(
        "Exit", 
        function()
            love.event.quit(0)
        end)
end

function Editor:update(dt)
end

function Editor:draw()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.draw(AVATAR_SKINS[1])
    love.graphics.draw(AVATAR_EYES[1])
    love.graphics.draw(AVATAR_HAIRS[1])
    love.graphics.draw(AVATAR_CLOTHES[1])
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    
    --self.buttons:update()
    
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Editor