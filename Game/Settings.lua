Settings = Actor:extend()

function Settings:new()
    self.font = FONT_OTAKU_BUTTONS
    local b = Buttons(false,self.font)
    self.volume_master_slider = Slider(WW/2, WH/2.5, 300, GAME_SETTINGS_VOLUME_MASTER, 0, 1, function (v) love.audio.setVolume(v) GAME_SETTINGS_VOLUME_MASTER = v SaveManager:saveSettings() end)
    self.volume_music_slider = Slider(WW/2, WH/2, 300, GAME_SETTINGS_VOLUME_MUSIC, 0, 1, function (v) GAME_SETTINGS_VOLUME_MUSIC = v SaveManager:saveSettings() end)
    self.volume_effects_slider = Slider(WW/2, WH/1.666, 300, GAME_SETTINGS_VOLUME_EFFECTS, 0, 1, function (v) GAME_SETTINGS_VOLUME_EFFECTS = v SaveManager:saveSettings() end)
    Settings.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    b:newButton(
        "Back",
        function()
            Main_FSM:changeState('menu')
        end,
        WW/2,
        WH-100)
    Scene.getScene():addButton(b)
end

function Settings:update(dt)
    self.volume_master_slider:update()
    self.volume_music_slider:update()
    self.volume_effects_slider:update()
end

function Settings:draw()
    love.graphics.setColor(255, 255, 255, 1)
    self.volume_master_slider:draw()
    self.volume_master = math.floor(self.volume_master_slider:getValue()*100)
    self.volume_music = math.floor(self.volume_music_slider:getValue()*100)
    self.volume_effects = math.floor(self.volume_effects_slider:getValue()*100)
    love.graphics.print(
        'MAIN: '..self.volume_master,
        FONT_OTAKU_BUTTONS,
        (WW * 0.5) - FONT_OTAKU_BUTTONS:getWidth('MAIN: '..self.volume_master) * 0.5,
         (WH/2.5) - FONT_OTAKU_BUTTONS:getHeight('MAIN: '..self.volume_master) * 0.5 - self.volume_master_slider.width * 1.5
        )
    self.volume_music_slider:draw()
    love.graphics.print(
        'MUSIC: '..self.volume_music,
        FONT_OTAKU_BUTTONS,
        (WW * 0.5) - FONT_OTAKU_BUTTONS:getWidth('MUSIC: '..self.volume_music) * 0.5,
         (WH/2) - FONT_OTAKU_BUTTONS:getHeight('MUSIC: '..self.volume_music) * 0.5 - self.volume_music_slider.width * 1.5
        )
    self.volume_effects_slider:draw()
    love.graphics.print(
        'EFFECTS: '..self.volume_effects,
        FONT_OTAKU_BUTTONS,
        (WW * 0.5) - FONT_OTAKU_BUTTONS:getWidth('EFFECTS: '..self.volume_effects) * 0.5,
         (WH/1.666) - FONT_OTAKU_BUTTONS:getHeight('EFFECTS: '..self.volume_effects) * 0.5 - self.volume_effects_slider.width * 1.5
        )
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