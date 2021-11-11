Settings = Actor:extend()

function Settings:new()
    self.font = FONT_OTAKU_BUTTONS
    self.volume_master_slider = Slider(WW/2, WH/2.5, 300, GAME_SETTINGS_VOLUME_MASTER, 0, 1, function (v) love.audio.setVolume(v) GAME_SETTINGS_VOLUME_MASTER = v SaveManager:saveSettings() end)
    self.volume_music_slider = Slider(WW/2, WH/2, 300, GAME_SETTINGS_VOLUME_MUSIC, 0, 1, function (v) GAME_SETTINGS_VOLUME_MUSIC = v SaveManager:saveSettings() end)
    self.volume_effects_slider = Slider(WW/2, WH/1.666, 300, GAME_SETTINGS_VOLUME_EFFECTS, 0, 1, function (v) GAME_SETTINGS_VOLUME_EFFECTS = v SaveManager:saveSettings() end)
    Settings.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Settings:update(dt)
    Suit.layout:reset(WW/2-WW/5/2, WH-100)
    if Suit.Button("ATRAS", {id=1}, Suit.layout:row(WW/5, WH/20)).hit then
        Main_FSM:changeState('menu')
    end
    Suit.layout:reset(WW/2-(WW/5)/2, WH/2-(WW/20)*3/2)
    Suit.layout:padding(40)
    self.volume_master_slider:update()
    self.volume_music_slider:update()
    self.volume_effects_slider:update()
end

function Settings:draw()
    love.graphics.setColor(255, 255, 255, 1)
    self.volume_master = math.floor(self.volume_master_slider:getValue()*100)
    self.volume_music = math.floor(self.volume_music_slider:getValue()*100)
    self.volume_effects = math.floor(self.volume_effects_slider:getValue()*100)
    if self.volume_master == 69 and self.volume_effects == 69 and self.volume_music == 69 then love.graphics.setColor(217/255, 117/255, 221/255, 1)
    else love.graphics.setColor(255, 255, 255, 1) end
    self.volume_master_slider:draw()
    self.volume_effects_slider:draw()
    self.volume_music_slider:draw()
    love.graphics.print(
        'MAIN: '..self.volume_master,
        FONT_OTAKU_BUTTONS,
        (WW * 0.5) - FONT_OTAKU_BUTTONS:getWidth('MAIN: '..self.volume_master) * 0.5,
         (WH/2.5) - FONT_OTAKU_BUTTONS:getHeight('MAIN: '..self.volume_master) * 0.5 - self.volume_master_slider.width * 1.5
        )
    love.graphics.print(
        'MUSIC: '..self.volume_music,
        FONT_OTAKU_BUTTONS,
        (WW * 0.5) - FONT_OTAKU_BUTTONS:getWidth('MUSIC: '..self.volume_music) * 0.5,
         (WH/2) - FONT_OTAKU_BUTTONS:getHeight('MUSIC: '..self.volume_music) * 0.5 - self.volume_music_slider.width * 1.5
        )
    love.graphics.print(
        'EFFECTS: '..self.volume_effects,
        FONT_OTAKU_BUTTONS,
        (WW * 0.5) - FONT_OTAKU_BUTTONS:getWidth('EFFECTS: '..self.volume_effects) * 0.5,
         (WH/1.666) - FONT_OTAKU_BUTTONS:getHeight('EFFECTS: '..self.volume_effects) * 0.5 - self.volume_effects_slider.width * 1.5
        )
    Suit.draw()
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