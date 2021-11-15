Settings = Actor:extend()

function Settings:new()
    self.font = FONT_BUTTONS_BIG
    Settings.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    self.slider_main = {value = GAME_SETTINGS_VOLUME_MASTER, min = 0, max = 1}
    self.slider_music = {value = GAME_SETTINGS_VOLUME_MUSIC, min = 0, max = 1}
    self.slider_effects = {value = GAME_SETTINGS_VOLUME_EFFECTS, min = 0, max = 1}
end

function Settings:update(dt)
    Suit.layout:reset(WW/2-WW/5/2, WH/1.09)
    if Suit.Button("ATRAS", {id=9}, Suit.layout:row(WW/5, WH/20)).hit then
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        Main_FSM:changeState('menu')
    end
    Suit.layout:reset(WW/2-(WW/5)/2, WH/2-(WW/20)*3/2)
    Suit.layout:padding(40)
    self:sliders()
end

function Settings:draw()
    love.graphics.draw(DEFAULT_BACKGROUND,0,0,0,WW/1920, WH/1080)
    love.graphics.setFont(FONT_BUTTONS)
    love.graphics.setColor(255, 255, 255, 1)
    if math.floor(self.slider_main.value*100) == 69 and math.floor(self.slider_music.value*100) == 69 and math.floor(self.slider_effects.value*100) == 69 then 
        Suit.theme.color = {
            normal  = {bg = { 66/255, 66/255, 66/255}, fg = {217/255, 117/255, 221/255}},
            hovered = {bg = { 50/255,153/255,187/255}, fg = {255/255,255/255,255/255}},
            active  = {bg = {255/255,153/255,  0/255}, fg = {225/255,225/255,225/255}}
        }
    else Suit.theme.color = {
        normal  = {bg = { 66/255, 66/255, 66/255}, fg = {0/255,0/255,0/255}},
        hovered = {bg = { 50/255,153/255,187/255}, fg = {255/255,255/255,255/255}},
        active  = {bg = {255/255,153/255,  0/255}, fg = {225/255,225/255,225/255}}
    } end
    Suit.draw()
end

function Settings:sliders()
    Suit.layout:reset(WW/2-(WW/6.4)/2, WH/2.5)
    Suit.layout:padding(40)
    Suit.Label('VOLUMEN GENERAL: '..tostring(math.floor(self.slider_main.value*100)), {id=10},Suit.layout:row(300,0))
    if Suit.Slider(self.slider_main, {id=13}, Suit.layout:row(WW/6.4, WH/54)).changed then
        GAME_SETTINGS_VOLUME_MASTER = self.slider_main.value
        SaveManager:saveSettings()
    end
    Suit.Label('VOLUMEN MUSICA: '..tostring(math.floor(self.slider_music.value*100)),  {id=11},Suit.layout:row(300,0))
    if Suit.Slider(self.slider_music, {id=14}, Suit.layout:row(WW/6.4, WH/54)).changed then
        GAME_SETTINGS_VOLUME_MUSIC = self.slider_music.value
        SaveManager:saveSettings()
        AudioManager.PlayMusic(MUSICA_MENU, GAME_SETTINGS_VOLUME_MUSIC, true)
    end
    Suit.Label('VOLUMEN EFFECTOS: '..tostring(math.floor(self.slider_effects.value*100)),  {id=12},Suit.layout:row(300,0))
    if Suit.Slider(self.slider_effects, {id=15}, Suit.layout:row(WW/6.4, WH/54)).changed then
        GAME_SETTINGS_VOLUME_EFFECTS = self.slider_effects.value
        SaveManager:saveSettings()
    end
end

function Settings:mousepressed( x, y, _button, istouch, presses )
end

function Settings:mousereleased( x, y, _button, istouch, presses )
end

function Settings:keypressed(_key)
end

function Settings:keyreleased(_key)
end

return Settings