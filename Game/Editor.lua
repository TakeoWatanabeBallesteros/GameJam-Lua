Editor = Actor:extend()

function Editor:new()
    self.font = FONT_OTAKU_BUTTONS
    local b2 = Buttons(false,self.font, 256, 64, false)
    Editor.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Editor:update(dt)
    self:AvatarButtons()
    self:UI_BUTTONS()
end

function Editor:draw()
    love.graphics.setColor(255, 255, 255, 1)
    local sx = WW / AVATAR_SKINS[AVATAR_SETTINGS_SKINS]:getWidth()
    local sy = WH / AVATAR_SKINS[AVATAR_SETTINGS_SKINS]:getHeight()
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
    Suit:draw()
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Editor:AvatarButtons()
    Suit.layout:reset(WW/6-(WW/30/2), WH/10)
    if Suit.Button("<", {id=1}, Suit.layout:row(WW/30, WH/16.875)).hit then
        if AVATAR_SETTINGS_SKINS >1 then AVATAR_SETTINGS_SKINS = AVATAR_SETTINGS_SKINS -1 
        else AVATAR_SETTINGS_SKINS = #AVATAR_SKINS end
    end
    Suit.layout:padding((WH/4.7)-(WH/10)-(WH/16.875))
    if Suit.Button("<", {id=2}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_HAIRS >1 then AVATAR_SETTINGS_HAIRS = AVATAR_SETTINGS_HAIRS -1 
        else AVATAR_SETTINGS_HAIRS = #AVATAR_HAIRS end
    end
    Suit.layout:padding((WH/2.7)-(WH/4.8)-(WH/16.875))
    if Suit.Button("<", {id=3}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_EYES >1 then AVATAR_SETTINGS_EYES = AVATAR_SETTINGS_EYES -1 
        else AVATAR_SETTINGS_EYES = #AVATAR_EYES end
    end
    Suit.layout:padding((WH/1.2)-(WH/2.7)-(WH/16.875))
    if Suit.Button("<", {id=4}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_CLOTHES >1 then AVATAR_SETTINGS_CLOTHES = AVATAR_SETTINGS_CLOTHES -1 
        else AVATAR_SETTINGS_CLOTHES = #AVATAR_CLOTHES end
    end
    Suit.layout:reset(WW/1.95-(WW/30/2), WH/10)
    if Suit.Button(">", {id=5}, Suit.layout:row(WW/30, WH/16.875)).hit then
        if AVATAR_SETTINGS_SKINS < #AVATAR_SKINS then AVATAR_SETTINGS_SKINS = AVATAR_SETTINGS_SKINS +1 
        else AVATAR_SETTINGS_SKINS = 1 end
    end
    Suit.layout:padding((WH/4.7)-(WH/10)-(WH/16.875))
    if Suit.Button(">", {id=6}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_HAIRS <#AVATAR_HAIRS  then AVATAR_SETTINGS_HAIRS = AVATAR_SETTINGS_HAIRS +1 
        else AVATAR_SETTINGS_HAIRS = 1 end
    end
    Suit.layout:padding((WH/2.7)-(WH/4.8)-(WH/16.875))
    if Suit.Button(">", {id=7}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_EYES <#AVATAR_EYES then AVATAR_SETTINGS_EYES = AVATAR_SETTINGS_EYES +1 
        else AVATAR_SETTINGS_EYES = 1 end
    end
    Suit.layout:padding((WH/1.2)-(WH/2.7)-(WH/16.875))
    if Suit.Button(">", {id=8}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_CLOTHES <#AVATAR_CLOTHES then AVATAR_SETTINGS_CLOTHES = AVATAR_SETTINGS_CLOTHES +1 
        else AVATAR_SETTINGS_CLOTHES = 1 end
    end
    
end

function Editor:UI_BUTTONS()
    Suit.layout:reset(WW/1.3-(WW/5/2), WH/1.3)
    Suit.layout:padding(40)
    if Suit.Button("CONTINUAR", {id=9}, Suit.layout:row(WW/5, WH/20)).hit then
        if AVATAR_SELECTED == 1 then SaveManager:saveAvatar_1()
        elseif AVATAR_SELECTED == 2 then SaveManager:saveAvatar_2()
        elseif AVATAR_SELECTED == 3 then SaveManager:saveAvatar_3() end
        Main_FSM:changeState('intro')
    end
    if Suit.Button("ATRAS", {id=10}, Suit.layout:row()).hit then
        Main_FSM:changeState('menu_avatar')
    end
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