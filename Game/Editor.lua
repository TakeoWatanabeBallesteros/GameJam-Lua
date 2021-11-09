Editor = Actor:extend()

function Editor:new()
    self.font = FONT_OTAKU_BUTTONS
    local b1 = Buttons(false,self.font, 64, 64, false)
    local b2 = Buttons(false,self.font, 256, 64, false)
    Editor.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    --#region AVATAR_BUTTONS
    b1:newButton(
        "<", 
        function()
            if AVATAR_SETTINGS_SKINS >1 then AVATAR_SETTINGS_SKINS = AVATAR_SETTINGS_SKINS -1 
            else AVATAR_SETTINGS_SKINS = #AVATAR_SKINS end
        end,
        WW/6,
        WH/8
        )
    b1:newButton(
        "<", 
        function()
            if AVATAR_SETTINGS_HAIRS >1 then AVATAR_SETTINGS_HAIRS = AVATAR_SETTINGS_HAIRS -1 
            else AVATAR_SETTINGS_HAIRS = #AVATAR_HAIRS end
        end,
        WW/6,
        WH/4.7
        )
    b1:newButton(
        "<", 
        function()
            if AVATAR_SETTINGS_EYES >1 then AVATAR_SETTINGS_EYES = AVATAR_SETTINGS_EYES -1 
            else AVATAR_SETTINGS_EYES = #AVATAR_EYES end
        end,
        WW/6,
        WH/2.7
        )
    b1:newButton(
        "<", 
        function()
            if AVATAR_SETTINGS_CLOTHES >1 then AVATAR_SETTINGS_CLOTHES = AVATAR_SETTINGS_CLOTHES -1 
            else AVATAR_SETTINGS_CLOTHES = #AVATAR_CLOTHES end
        end,
        WW/6,
        WH/1.2
        )
    b1:newButton(
        ">", 
        function()
            if AVATAR_SETTINGS_SKINS < #AVATAR_SKINS then AVATAR_SETTINGS_SKINS = AVATAR_SETTINGS_SKINS +1 
            else AVATAR_SETTINGS_SKINS = 1 end
        end,
        WW/1.95,
        WH/8
        )
    b1:newButton(
        ">", 
        function()
            if AVATAR_SETTINGS_HAIRS <#AVATAR_HAIRS  then AVATAR_SETTINGS_HAIRS = AVATAR_SETTINGS_HAIRS +1 
            else AVATAR_SETTINGS_HAIRS = 1 end
        end,
        WW/1.95,
        WH/4.7
        )
    b1:newButton(
        ">", 
        function()
            if AVATAR_SETTINGS_EYES <#AVATAR_EYES then AVATAR_SETTINGS_EYES = AVATAR_SETTINGS_EYES +1 
            else AVATAR_SETTINGS_EYES = 1 end
        end,
        WW/1.95,
        WH/2.7
        )
    b1:newButton(
        ">", 
        function()
            if AVATAR_SETTINGS_CLOTHES <#AVATAR_CLOTHES then AVATAR_SETTINGS_CLOTHES = AVATAR_SETTINGS_CLOTHES +1 
            else AVATAR_SETTINGS_CLOTHES = 1 end
        end,
        WW/1.95,
        WH/1.2
        )
    --#endregion
    --#region UI_BUTTONS
    b2:newButton(
        "CONTINUAR", 
        function()
            Main_FSM:changeState('intro')
        end,
        WW/1.3,
        WH/1.3
    )
    b2:newButton(
        "MENU", 
        function()
            Main_FSM:changeState('menu')
        end,
        WW/1.3,
        WH/1.3+80
    )
    --#endregion
    
    Scene.getScene():addButton(b1)
    Scene.getScene():addButton(b2)
end

function Editor:update(dt)
end

function Editor:draw()
    love.graphics.setColor(255, 255, 255, 1)
    local sx = WW / DIALOG_BOXES['player_1']:getWidth()
    local sy = WH / DIALOG_BOXES['player_1']:getHeight()
    love.graphics.draw(AVATAR_SKINS[AVATAR_SETTINGS_SKINS], 0, 0, 0,sx, sy)
    love.graphics.draw(AVATAR_EYES[AVATAR_SETTINGS_EYES], 0, 0, 0,sx, sy)
    love.graphics.draw(AVATAR_HAIRS[AVATAR_SETTINGS_HAIRS], 0, 0, 0,sx, sy)
    love.graphics.draw(AVATAR_CLOTHES[AVATAR_SETTINGS_CLOTHES], 0, 0, 0,sx, sy)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot

    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Editor:mousepressed( x, y, _button, istouch, presses )
end
function Editor:mousereleased( x, y, _button, istouch, presses )
end
function Editor:keypressed(_key)
end
function Editor:keyreleased(_key)
end

return Editor