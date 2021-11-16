Menu_Characters = Actor:extend()

function Menu_Characters:new()
    self.font = FONT_BUTTONS_BIG
    Menu_Characters.super.new(self,AVATAR_CHARACTERS_INFO_BAJO,WW/2,WH/2,0,-1,0, 'HUD')
end

function Menu_Characters:update(dt)
    Suit.theme.color = {
        normal  = {bg = {  192/255, 90/255, 124/255}, fg = {255/255,255/255,255/255}},
        hovered = {bg = { 213/255,134/255, 161/255}, fg = {255/255,255/255,255/255}},
        active  = {bg = {221/255, 169/255,   186/255}, fg = {225/255,225/255,225/255}}
    }
    Suit.layout:reset(WW/2-(WW/5/2), WH/1.09)
    if Suit.Button("ATRAS", {id=41}, Suit.layout:row(WW/5, WH/20)).hit then
        Main_FSM:changeState('menu')
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if not CHARACTER_ALEX then
        if Suit.ImageButton(CHARACTERS_INFO_SILUETA.alex.normal, {id = 42, mask =    CHARACTERS_INFO_SILUETA.alex.mask, hovered = CHARACTERS_INFO_SILUETA.alex.hovered, active = CHARACTERS_INFO_SILUETA.alex.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    else
        if Suit.ImageButton(CHARACTERS_INFO.alex.normal, {id = 43, mask =    CHARACTERS_INFO.alex.mask, hovered = CHARACTERS_INFO.alex.hovered, active = CHARACTERS_INFO.alex.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if not CHARACTER_RICKY then
        if Suit.ImageButton(CHARACTERS_INFO_SILUETA.ricky.normal, {id = 44,   mask = CHARACTERS_INFO_SILUETA.ricky.mask, hovered = CHARACTERS_INFO_SILUETA.ricky.hovered, active = CHARACTERS_INFO_SILUETA.ricky.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    else
        if Suit.ImageButton(CHARACTERS_INFO.ricky.normal, {id = 45,   mask = CHARACTERS_INFO.ricky.mask, hovered = CHARACTERS_INFO.ricky.hovered, active = CHARACTERS_INFO.ricky.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if not CHARACTER_TAKEO then
        if Suit.ImageButton(CHARACTERS_INFO_SILUETA.takeo.normal, {id = 46,   mask = CHARACTERS_INFO_SILUETA.takeo.mask, hovered = CHARACTERS_INFO_SILUETA.takeo.hovered, active = CHARACTERS_INFO_SILUETA.takeo.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    else
        if Suit.ImageButton(CHARACTERS_INFO.takeo.normal, {id = 47,   mask = CHARACTERS_INFO.takeo.mask, hovered = CHARACTERS_INFO.takeo.hovered, active = CHARACTERS_INFO.takeo.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            
        AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if not CHARACTER_ARNAU then
        if Suit.ImageButton(CHARACTERS_INFO_SILUETA.arnau.normal, {id = 48,   mask = CHARACTERS_INFO_SILUETA.arnau.mask, hovered = CHARACTERS_INFO_SILUETA.arnau.hovered, active = CHARACTERS_INFO_SILUETA.arnau.active}, Suit.layout:row(WW/1920,WH/1080)).hit then

            AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    else
        if Suit.ImageButton(CHARACTERS_INFO.arnau.normal, {id = 49,   mask = CHARACTERS_INFO.arnau.mask, hovered = CHARACTERS_INFO.arnau.hovered, active = CHARACTERS_INFO.arnau.active}, Suit.layout:row(WW/1920,WH/1080)).hit then

            AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if not CHARACTER_MARINA then
        if Suit.ImageButton(CHARACTERS_INFO_SILUETA.marina.normal, {id = 50, mask =  CHARACTERS_INFO_SILUETA.marina.mask, hovered = CHARACTERS_INFO_SILUETA.marina.hovered, active = CHARACTERS_INFO_SILUETA.marina.active}, Suit.layout:row(WW/1920,WH/1080)).hit then

            AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    else
        if Suit.ImageButton(CHARACTERS_INFO.marina.normal, {id = 51, mask =  CHARACTERS_INFO.marina.mask, hovered = CHARACTERS_INFO.marina.hovered, active = CHARACTERS_INFO.marina.active}, Suit.layout:row(WW/1920,WH/1080)).hit then

            AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if not CHARACTER_VERO then
        if Suit.ImageButton(CHARACTERS_INFO_SILUETA.vero.normal, {id = 52,    mask = CHARACTERS_INFO_SILUETA.vero.mask, hovered = CHARACTERS_INFO_SILUETA.vero.hovered, active = CHARACTERS_INFO_SILUETA.vero.active}, Suit.layout:row(WW/1920,WH/1080)).hit then

            AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    else
        if Suit.ImageButton(CHARACTERS_INFO.vero.normal, {id = 53,    mask = CHARACTERS_INFO.vero.mask, hovered = CHARACTERS_INFO.vero.hovered, active = CHARACTERS_INFO.vero.active}, Suit.layout:row(WW/1920,WH/1080)).hit then

            AudioManager.PlaySound(AUDIO_BUTTON_CLICK, GAME_SETTINGS_VOLUME_EFFECTS, false)
        end
    end
end

function Menu_Characters:draw()
    love.graphics.draw(DEFAULT_BACKGROUND,0,0,0,WW/1920, WH/1080)
    love.graphics.setBackgroundColor(230/255, 196/255, 214/255)
    love.graphics.setFont(FONT_BUTTONS)
    love.graphics.setColor(255, 255, 255, 1)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = 0
    love.graphics.setBackgroundColor(230/255, 196/255, 214/255)
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Menu_Characters:mousepressed( x, y, _button, istouch, presses )
end

function Menu_Characters:mousereleased( x, y, _button, istouch, presses )
end

function Menu_Characters:keypressed(_key)
end

function Menu_Characters:keyreleased(_key)
end



return Menu_Characters