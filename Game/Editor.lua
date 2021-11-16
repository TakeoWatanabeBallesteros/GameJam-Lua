Editor = Actor:extend()

function Editor:new()
    self.font = FONT_BUTTONS_BIG
    Editor.super.new(self,EDITOR_BACKGROUND,WW/2,WH/2,0,-1,0, 'HUD')
    self.name = {text=AVATAR_SETTINGS_NAME}
end

function Editor:update(dt)
    Suit.theme.color = {
        normal  = {bg = {  192/255, 90/255, 124/255}, fg = {255/255,255/255,255/255}},
        hovered = {bg = { 213/255,134/255, 161/255}, fg = {255/255,255/255,255/255}},
        active  = {bg = {221/255, 169/255,   186/255}, fg = {225/255,225/255,225/255}}
    }
    self:AvatarButtons()
    self:UI_BUTTONS()
end

function Editor:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
    love.graphics.setColor(255, 255, 255, 1)
    local sx = WW / AVATAR_SKINS[AVATAR_SETTINGS_SKIN]:getWidth()
    local sy = WH / AVATAR_SKINS[AVATAR_SETTINGS_SKIN]:getHeight()
    love.graphics.draw(AVATAR_SKINS[AVATAR_SETTINGS_SKIN], 0, 0, 0,sx, sy)
    love.graphics.draw(AVATAR_EYES[AVATAR_SETTINGS_EYE], 0, 0, 0,sx, sy)
    love.graphics.draw(AVATAR_HAIRS[AVATAR_SETTINGS_HAIR], 0, 0, 0,sx, sy)
    love.graphics.draw(AVATAR_CLOTHES[AVATAR_SETTINGS_CLOTH], 0, 0, 0,sx, sy)
end

function Editor:AvatarButtons()
    Suit.layout:reset(WW/6-(WW/30/2), WH/10)
    if Suit.Button("<", {id=23}, Suit.layout:row(WW/30, WH/16.875)).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        if AVATAR_SETTINGS_SKIN >1 then AVATAR_SETTINGS_SKIN = AVATAR_SETTINGS_SKIN -1 
        else AVATAR_SETTINGS_SKIN = #AVATAR_SKINS end
    end
    Suit.layout:padding((WH/4.7)-(WH/10)-(WH/16.875))
    if Suit.Button("<", {id=24}, Suit.layout:row()).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        if AVATAR_SETTINGS_HAIR >1 then AVATAR_SETTINGS_HAIR = AVATAR_SETTINGS_HAIR -1 
        else AVATAR_SETTINGS_HAIR = #AVATAR_HAIRS end
    end
    Suit.layout:padding((WH/2.7)-(WH/4.8)-(WH/16.875))
    if Suit.Button("<", {id=25}, Suit.layout:row()).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        if AVATAR_SETTINGS_EYE >1 then AVATAR_SETTINGS_EYE = AVATAR_SETTINGS_EYE -1 
        else AVATAR_SETTINGS_EYE = #AVATAR_EYES end
    end
    Suit.layout:padding((WH/1.2)-(WH/2.7)-(WH/16.875))
    if Suit.Button("<", {id=26}, Suit.layout:row()).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        if AVATAR_SETTINGS_CLOTH >1 then AVATAR_SETTINGS_CLOTH = AVATAR_SETTINGS_CLOTH -1 
        else AVATAR_SETTINGS_CLOTH = #AVATAR_CLOTHES end
    end
    Suit.layout:reset(WW/1.95-(WW/30/2), WH/10)
    if Suit.Button(">", {id=27}, Suit.layout:row(WW/30, WH/16.875)).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        if AVATAR_SETTINGS_SKIN < #AVATAR_SKINS then AVATAR_SETTINGS_SKIN = AVATAR_SETTINGS_SKIN +1 
        else AVATAR_SETTINGS_SKIN = 1 end
    end
    Suit.layout:padding((WH/4.7)-(WH/10)-(WH/16.875))
    if Suit.Button(">", {id=28}, Suit.layout:row()).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        if AVATAR_SETTINGS_HAIR <#AVATAR_HAIRS  then AVATAR_SETTINGS_HAIR = AVATAR_SETTINGS_HAIR +1 
        else AVATAR_SETTINGS_HAIR = 1 end
    end
    Suit.layout:padding((WH/2.7)-(WH/4.8)-(WH/16.875))
    if Suit.Button(">", {id=29}, Suit.layout:row()).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        if AVATAR_SETTINGS_EYE <#AVATAR_EYES then AVATAR_SETTINGS_EYE = AVATAR_SETTINGS_EYE +1 
        else AVATAR_SETTINGS_EYE = 1 end
    end
    Suit.layout:padding((WH/1.2)-(WH/2.7)-(WH/16.875))
    if Suit.Button(">", {id=30}, Suit.layout:row()).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
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
    if Suit.Button("CONTINUAR", {id=31}, Suit.layout:row(WW/5, WH/20)).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        AVATAR_SETTINGS_NAME = self.name.text
        if AVATAR_SELECTED == 1 then SaveManager:saveAvatar_1()
        elseif AVATAR_SELECTED == 2 then SaveManager:saveAvatar_2()
        elseif AVATAR_SELECTED == 3 then SaveManager:saveAvatar_3() end
        table.insert(AVATAR_SETTINGS_SPRITES, AVATAR_SKINS[AVATAR_SETTINGS_SKIN])
        table.insert(AVATAR_SETTINGS_SPRITES, AVATAR_EYES[AVATAR_SETTINGS_EYE])
        table.insert(AVATAR_SETTINGS_SPRITES, AVATAR_HAIRS[AVATAR_SETTINGS_HAIR])
        table.insert(AVATAR_SETTINGS_SPRITES, AVATAR_CLOTHES[AVATAR_SETTINGS_CLOTH])
        Main_FSM:changeState('intro')
        AudioManager.StopSound(MUSICA_EDITOR)
    end
    if Suit.Button("ATRAS", {id=32}, Suit.layout:row()).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
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