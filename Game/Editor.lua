Editor = Actor:extend()

function Editor:new()
    self.font = FONT_OTAKU_BUTTONS
    local b2 = Buttons(false,self.font, 256, 64, false)
    Editor.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    self.name = {text=AVATAR_SETTINGS_NAME}
end

function Editor:update(dt)
    self:AvatarButtons()
    self:UI_BUTTONS()
end

function Editor:draw()
    love.graphics.setColor(255, 255, 255, 1)
    local sx = WW / AVATAR_SKINS[AVATAR_SETTINGS_SKIN]:getWidth()
    local sy = WH / AVATAR_SKINS[AVATAR_SETTINGS_SKIN]:getHeight()
    love.graphics.draw(AVATAR_SKINS[AVATAR_SETTINGS_SKIN], 0, 0, 0,sx, sy)
    love.graphics.draw(AVATAR_EYES[AVATAR_SETTINGS_EYE], 0, 0, 0,sx, sy)
    love.graphics.draw(AVATAR_HAIRS[AVATAR_SETTINGS_HAIR], 0, 0, 0,sx, sy)
    love.graphics.draw(AVATAR_CLOTHES[AVATAR_SETTINGS_CLOTH], 0, 0, 0,sx, sy)
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
        if AVATAR_SETTINGS_SKIN >1 then AVATAR_SETTINGS_SKIN = AVATAR_SETTINGS_SKIN -1 
        else AVATAR_SETTINGS_SKIN = #AVATAR_SKINS end
    end
    Suit.layout:padding((WH/4.7)-(WH/10)-(WH/16.875))
    if Suit.Button("<", {id=2}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_HAIR >1 then AVATAR_SETTINGS_HAIR = AVATAR_SETTINGS_HAIR -1 
        else AVATAR_SETTINGS_HAIR = #AVATAR_HAIRS end
    end
    Suit.layout:padding((WH/2.7)-(WH/4.8)-(WH/16.875))
    if Suit.Button("<", {id=3}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_EYE >1 then AVATAR_SETTINGS_EYE = AVATAR_SETTINGS_EYE -1 
        else AVATAR_SETTINGS_EYE = #AVATAR_EYES end
    end
    Suit.layout:padding((WH/1.2)-(WH/2.7)-(WH/16.875))
    if Suit.Button("<", {id=4}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_CLOTH >1 then AVATAR_SETTINGS_CLOTH = AVATAR_SETTINGS_CLOTH -1 
        else AVATAR_SETTINGS_CLOTH = #AVATAR_CLOTHES end
    end
    Suit.layout:reset(WW/1.95-(WW/30/2), WH/10)
    if Suit.Button(">", {id=5}, Suit.layout:row(WW/30, WH/16.875)).hit then
        if AVATAR_SETTINGS_SKIN < #AVATAR_SKINS then AVATAR_SETTINGS_SKIN = AVATAR_SETTINGS_SKIN +1 
        else AVATAR_SETTINGS_SKIN = 1 end
    end
    Suit.layout:padding((WH/4.7)-(WH/10)-(WH/16.875))
    if Suit.Button(">", {id=6}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_HAIR <#AVATAR_HAIRS  then AVATAR_SETTINGS_HAIR = AVATAR_SETTINGS_HAIR +1 
        else AVATAR_SETTINGS_HAIR = 1 end
    end
    Suit.layout:padding((WH/2.7)-(WH/4.8)-(WH/16.875))
    if Suit.Button(">", {id=7}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_EYE <#AVATAR_EYES then AVATAR_SETTINGS_EYE = AVATAR_SETTINGS_EYE +1 
        else AVATAR_SETTINGS_EYE = 1 end
    end
    Suit.layout:padding((WH/1.2)-(WH/2.7)-(WH/16.875))
    if Suit.Button(">", {id=8}, Suit.layout:row()).hit then
        if AVATAR_SETTINGS_CLOTH <#AVATAR_CLOTHES then AVATAR_SETTINGS_CLOTH = AVATAR_SETTINGS_CLOTH +1 
        else AVATAR_SETTINGS_CLOTH = 1 end
    end
    Suit.layout:reset(WW/1.51,WH/8)
    if Suit.Input(self.name, {id=11},Suit.layout:row(WW/5, WH/20)).submitted then
        
    end
end

function Editor:UI_BUTTONS()
    Suit.layout:reset(WW/1.3-(WW/5/2), WH/1.3)
    Suit.layout:padding(40)
    if Suit.Button("CONTINUAR", {id=9}, Suit.layout:row(WW/5, WH/20)).hit then
        AVATAR_SETTINGS_NAME = self.name.text
        if AVATAR_SELECTED == 1 then SaveManager:saveAvatar_1()
        elseif AVATAR_SELECTED == 2 then SaveManager:saveAvatar_2()
        elseif AVATAR_SELECTED == 3 then SaveManager:saveAvatar_3() end
        table.insert(AVATAR_SETTINGS_SPRITES, AVATAR_SKINS[AVATAR_SETTINGS_SKIN])
        table.insert(AVATAR_SETTINGS_SPRITES, AVATAR_EYES[AVATAR_SETTINGS_EYE])
        table.insert(AVATAR_SETTINGS_SPRITES, AVATAR_HAIRS[AVATAR_SETTINGS_HAIR])
        table.insert(AVATAR_SETTINGS_SPRITES, AVATAR_CLOTHES[AVATAR_SETTINGS_CLOTH])
        Main_FSM:changeState('intro')
    end
    if Suit.Button("ATRAS", {id=10}, Suit.layout:row()).hit then
        Main_FSM:changeState('menu_avatar')
    end
end

function love.textinput(t)
    -- forward text input to SUIT
    Suit.textinput(t)
end

function Editor:mousepressed( x, y, _button, istouch, presses )
end
function Editor:mousereleased( x, y, _button, istouch, presses )
end
function Editor:keypressed(_key)
    Suit.keypressed(_key)
end
function Editor:keyreleased(_key)
end

return Editor