Settings = Actor:extend()

function Settings:new()
    self.font = FONT_OTAKU_BUTTONS
    local b = Buttons(false,self.font)
    self.slider = Slider(WW/2, WH/2, 300, 0.6, 0, 1, function (v) love.audio.setVolume(v) end)
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
    self.slider:update()
end

function Settings:draw()
    love.graphics.setColor(255, 255, 255, 1)
    self.slider:draw()
    self.volume = math.floor(self.slider:getValue()*100)
    love.graphics.print(
        'VOLUMEN: '..self.volume,
        FONT_OTAKU_BUTTONS,
        (WW * 0.5) - FONT_OTAKU_BUTTONS:getWidth('VOLUMEN: '..self.volume) * 0.5,
         (WH/2) - FONT_OTAKU_BUTTONS:getHeight('VOLUMEN: '..self.volume) * 0.5 - self.slider.width
        )
end

return Settings