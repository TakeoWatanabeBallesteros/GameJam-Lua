--Takeo Watanabe y Jan de Nobel
Pong_Settings = Pong_Actor:extend()

local function newButton(text, fn)
    return {
        text = text,
        fn = fn,

        now = false,
        last = false
    }
end

function Pong_Settings:new()
    self.buttons = {}
    self.font = Pong_SETTINGS_FONT_BUTTONS
    self.ap = false
    --love.graphics.setFont(love.graphics.newFont("/Data/pong.ttf", 70))
    Pong_Menu.super.new(self,Pong_DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    table.insert(self.buttons, newButton(
        "Normal Mode", 
        function()
            Pong_SETTINGS_FIELD_SPRITE = Pong_FIELD_DEFAULT_IMAGE
            Pong_SETTINGS_PADDLE_SPRITE = Pong_PADDLE_IMAGE_DEFAULT
            Pong_SETTING_BALL_SPRITE = Pong_BALL_IMAGE_DEFAULT
            SETTINGS_AUDIO_GAME_MUSIC = Pong_AUDIO_GAME_MUSIC_DEFAULT
            SETTINGS_AUDIO_PONG_PADDLE = Pong_AUDIO_PONG_PADDLE_DEFAULT
            SETTINGS_AUDIO_PONG_WALL = Pong_AUDIO_PONG_WALL_DEFAULT
            SETTINGS_PONG_GOAL = Pong_AUDIO_PONG_GOAL_DEFAULT
            SETTINGS_FONT_TITLE = Pong_FONT_PONG_TITLE
            SETTINGS_FONT_BUTTONS = Pong_FONT_PONG_BUTTONS
            Pong_SETTINGS_TITLE = Pong_TITLE_DEFAULT
        end))
    table.insert(self.buttons, newButton(
        "Otaku Mode", 
        function()
            Pong_SETTINGS_FIELD_SPRITE = Pong_FIELD_OTAKU_IMAGE
            Pong_SETTINGS_PADDLE_SPRITE = Pong_PADDLE_IMAGE_OTAKU
            Pong_SETTING_BALL_SPRITE = Pong_BALL_IMAGE_OTAKU
            SETTINGS_AUDIO_GAME_MUSIC = Pong_AUDIO_GAME_MUSIC_OTAKU
            SETTINGS_AUDIO_PONG_PADDLE = Pong_AUDIO_PONG_PADDLE_OTAKU
            SETTINGS_AUDIO_PONG_WALL = Pong_AUDIO_PONG_WALL_OTAKU
            SETTINGS_AUDIO_PONG_GOAL = Pong_AUDIO_PONG_GOAL_OTAKU
            SETTINGS_FONT_TITLE = Pong_FONT_OTAKU_TITLE
            SETTINGS_FONT_BUTTONS = Pong_FONT_OTAKU_BUTTONS
            Pong_SETTINGS_TITLE = Pong_TITLE_OTAKU
        end))
    table.insert(self.buttons, newButton(
        "Brazil Mode", 
        function()
            Pong_SETTINGS_FIELD_SPRITE = Pong_FIELD_BRAZIL_IMAGE
            Pong_SETTINGS_PADDLE_SPRITE = Pong_PADDLE_IMAGE_BRAZIL
            Pong_SETTING_BALL_SPRITE = Pong_BALL_IMAGE_BRAZIL
            SETTINGS_AUDIO_GAME_MUSIC = Pong_AUDIO_GAME_MUSIC_BRAZIL
            SETTINGS_AUDIO_PONG_PADDLE = Pong_AUDIO_PONG_PADDLE_BRAZIL
            SETTINGS_AUDIO_PONG_WALL = Pong_AUDIO_PONG_WALL_BRAZIL
            SETTINGS_AUDIO_PONG_GOAL = Pong_AUDIO_PONG_GOAL_BRAZIL
            SETTINGS_FONT_TITLE = Pong_FONT_PONG_TITLE
            SETTINGS_FONT_BUTTONS = Pong_FONT_PONG_BUTTONS
            Pong_SETTINGS_TITLE = Pong_TITLE_DEFAULT
        end))
    table.insert(self.buttons, newButton(
        "Go Menu", 
        function()
            Pong_Director.goMenu()
        end))
end

function Pong_Settings:update(dt)
end

function Pong_Settings:draw()
    love.graphics.setColor(255, 255, 255, 1)

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot

    local buttonHeigth = 64
    local buttonWidth = WW * (1/3)
    local margin = 16

    local totalHeight = (buttonHeigth + margin) * #self.buttons
    local cursorY = 0

    for i, button in ipairs(self.buttons) do
        button.last = button.now

        local bx = (WW * 0.5) - (buttonWidth * 0.5)
        local by = (WH * 0.5) - (totalHeight * 0.5) + cursorY

        local color = {0.4, 0.4, 0.5, 1.0}

        local mx, my = love.mouse.getPosition()

        local hot = mx > bx and mx < bx + buttonWidth and
                    my > by and my < by + buttonHeigth

        if hot then
            color = {0.8, 0.8, 0.9, 1}
        end

        

        

        button.now = love.mouse.isDown(1)
        if button.now and not button.last and hot then
            button.fn()
            Pong_AudioManager.PlaySound(Pong_AUDIO_BUTTON_CLICK, .6, false)
        end

        love.graphics.setColor(unpack(color))
        love.graphics.rectangle(
            "fill",
            bx,
            by,
            buttonWidth,
            buttonHeigth
        )

        love.graphics.setColor(0, 0, 0, 1)

        local textW = self.font:getWidth(button.text)
        local textH = self.font:getHeight(button.text)
        love.graphics.print(
            button.text,
            self.font,
            (WW * 0.5) - textW * 0.5,
             by + textH * 0.5
            )

        cursorY = cursorY + (buttonHeigth + margin)
    end
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Pong_Settings:mousepressed( x, y, _button, istouch, presses )
    if _button == 1 then
        self.ap = true
    end
end

function Pong_Settings:mousereleased( x, y, _button, istouch, presses )
    if _button == 1 then
        self.ap = true
    end
end

return Pong_Settings