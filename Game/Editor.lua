Editor = Actor:extend()

function Editor:new()
    self.font = FONT_OTAKU_BUTTONS
    self.avatar_buttons = Buttons(self.font, 64, 64, false)
    self.ui_buttons = Buttons(self.font, 256, 64, true)
    Editor.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    --#region AVATAR_BUTTONS
    self.avatar_buttons:newButton(
        "<", 
        function()
            if AVATAR_SETTINGS_SKINS >1 then AVATAR_SETTINGS_SKINS = AVATAR_SETTINGS_SKINS -1 
            else AVATAR_SETTINGS_SKINS = #AVATAR_SKINS end
        end,
        WW/6,
        WH/8
        )
    self.avatar_buttons:newButton(
        "<", 
        function()
            if AVATAR_SETTINGS_HAIRS >1 then AVATAR_SETTINGS_HAIRS = AVATAR_SETTINGS_HAIRS -1 
            else AVATAR_SETTINGS_HAIRS = #AVATAR_HAIRS end
        end,
        WW/6,
        WH/4.7
        )
    self.avatar_buttons:newButton(
        "<", 
        function()
            if AVATAR_SETTINGS_EYES >1 then AVATAR_SETTINGS_EYES = AVATAR_SETTINGS_EYES -1 
            else AVATAR_SETTINGS_EYES = #AVATAR_EYES end
        end,
        WW/6,
        WH/2.7
        )
    self.avatar_buttons:newButton(
        "<", 
        function()
            if AVATAR_SETTINGS_CLOTHES >1 then AVATAR_SETTINGS_CLOTHES = AVATAR_SETTINGS_CLOTHES -1 
            else AVATAR_SETTINGS_CLOTHES = #AVATAR_CLOTHES end
        end,
        WW/6,
        WH/1.2
        )
    self.avatar_buttons:newButton(
        ">", 
        function()
            if AVATAR_SETTINGS_SKINS < #AVATAR_SKINS then AVATAR_SETTINGS_SKINS = AVATAR_SETTINGS_SKINS +1 
            else AVATAR_SETTINGS_SKINS = 1 end
        end,
        WW/1.95,
        WH/7
        )
    self.avatar_buttons:newButton(
        ">", 
        function()
            if AVATAR_SETTINGS_HAIRS <#AVATAR_HAIRS  then AVATAR_SETTINGS_HAIRS = AVATAR_SETTINGS_HAIRS +1 
            else AVATAR_SETTINGS_HAIRS = 1 end
        end,
        WW/1.95,
        WH/4.7
        )
    self.avatar_buttons:newButton(
        ">", 
        function()
            if AVATAR_SETTINGS_EYES <#AVATAR_EYES then AVATAR_SETTINGS_EYES = AVATAR_SETTINGS_EYES +1 
            else AVATAR_SETTINGS_EYES = 1 end
        end,
        WW/1.95,
        WH/2.7
        )
    self.avatar_buttons:newButton(
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
    self.ui_buttons:newButton(
        "CONTINUAR", 
        function()
            if AVATAR_SETTINGS_SKINS >1 then AVATAR_SETTINGS_SKINS = AVATAR_SETTINGS_SKINS -1 
            else AVATAR_SETTINGS_SKINS = #AVATAR_SKINS end
        end,
        WW/6,
        WH/8
    )
    --#endregion

end

function Editor:update(dt)
end

function Editor:draw()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.draw(AVATAR_SKINS[AVATAR_SETTINGS_SKINS])
    love.graphics.draw(AVATAR_EYES[AVATAR_SETTINGS_EYES])
    love.graphics.draw(AVATAR_HAIRS[AVATAR_SETTINGS_HAIRS])
    love.graphics.draw(AVATAR_CLOTHES[AVATAR_SETTINGS_CLOTHES])
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    
    self.avatar_buttons:update()
    self.ui_buttons:update()

    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Editor