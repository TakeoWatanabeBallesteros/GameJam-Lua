Characters_Selection = Actor:extend()

function Characters_Selection:new()
    self.font = FONT_BUTTONS_BIG
    Characters_Selection.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    self.click = false
end

function Characters_Selection:update(dt)
    Suit.theme.color = {
        normal  = {bg = {  192/255, 90/255, 124/255}, fg = {255/255,255/255,255/255}},
        hovered = {bg = { 213/255,134/255, 161/255}, fg = {255/255,255/255,255/255}},
        active  = {bg = {221/255, 169/255,   186/255}, fg = {225/255,225/255,225/255}}
    }
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.alex.normal, {id = 60, mask = CHARACTERS_BUTTONS.alex.mask, hovered = CHARACTERS_BUTTONS.alex.hovered, active = CHARACTERS_BUTTONS.alex.active}, Suit.layout:row(WW/1920,WH/1080)).hit and self.click then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        local d = Dialog('Data/Dialogues/dialogo_alex.json')
        Scene.getScene():addDialog(d)
        WHO = 'alex'
        Main_FSM:changeState('dialog')
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.ricky.normal, {id = 61, mask = CHARACTERS_BUTTONS.ricky.mask, hovered = CHARACTERS_BUTTONS.ricky.hovered, active = CHARACTERS_BUTTONS.ricky.active}, Suit.layout:row(WW/1920,WH/1080)).hit and self.click then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        local d = Dialog('Data/Dialogues/dialogo_ricky.json')
        Scene.getScene():addDialog(d)
        WHO = 'ricky'
        Main_FSM:changeState('dialog')
    end
    love.graphics.setColor(255,255,255,1)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.takeo.normal, {id = 62, mask = CHARACTERS_BUTTONS.takeo.mask, hovered = CHARACTERS_BUTTONS.takeo.hovered, active = CHARACTERS_BUTTONS.takeo.active}, Suit.layout:row(WW/1920,WH/1080)).hit and self.click then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        local d = Dialog('Data/Dialogues/dialogo_takeo.json')
        Scene.getScene():addDialog(d)
        WHO = 'takeo'
        Main_FSM:changeState('dialog')
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.arnau.normal, {id = 63, mask = CHARACTERS_BUTTONS.arnau.mask, hovered = CHARACTERS_BUTTONS.arnau.hovered, active = CHARACTERS_BUTTONS.arnau.active}, Suit.layout:row(WW/1920,WH/1080)).hit and self.click then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        local d = Dialog('Data/Dialogues/dialogo_arnau.json')
        Scene.getScene():addDialog(d)
        WHO = 'arnau'
        Main_FSM:changeState('dialog')
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.marina.normal, {id = 64, mask = CHARACTERS_BUTTONS.marina.mask, hovered = CHARACTERS_BUTTONS.marina.hovered, active = CHARACTERS_BUTTONS.marina.active}, Suit.layout:row(WW/1920,WH/1080)).hit and self.click then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        local d = Dialog('Data/Dialogues/dialogo_marina.json')
        Scene.getScene():addDialog(d)
        WHO = 'marina'
        Main_FSM:changeState('dialog')
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.vero.normal, {id = 65, mask = CHARACTERS_BUTTONS.vero.mask, hovered = CHARACTERS_BUTTONS.vero.hovered, active = CHARACTERS_BUTTONS.vero.active}, Suit.layout:row(WW/1920,WH/1080)).hit and self.click then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        local d = Dialog('Data/Dialogues/dialogo_vero.json')
        Scene.getScene():addDialog(d)
        WHO = 'vero'
        Main_FSM:changeState('dialog')
    end

end

function Characters_Selection:draw()
    love.graphics.setBackgroundColor(255,255,255)
    love.graphics.setColor(255, 255, 255, 1)
    Suit.draw()
end

function Characters_Selection:mousepressed( x, y, _button, istouch, presses )
    self.click = true
end

function Characters_Selection:mousereleased( x, y, _button, istouch, presses )
end

function Characters_Selection:keypressed(_key)
end

function Characters_Selection:keyreleased(_key)
    
end

return Characters_Selection