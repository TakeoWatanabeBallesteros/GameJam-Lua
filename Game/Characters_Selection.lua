Characters_Selection = Actor:extend()

function Characters_Selection:new()
    self.font = FONT_BUTTONS_BIG
    Characters_Selection.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Characters_Selection:update(dt)
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.alex.normal, {id = 1, mask = CHARACTERS_BUTTONS.alex.mask, hovered = CHARACTERS_BUTTONS.alex.hovered, active = CHARACTERS_BUTTONS.alex.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.ricky.normal, {id = 2, mask = CHARACTERS_BUTTONS.ricky.mask, hovered = CHARACTERS_BUTTONS.ricky.hovered, active = CHARACTERS_BUTTONS.ricky.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.takeo.normal, {id = 3, mask = CHARACTERS_BUTTONS.takeo.mask, hovered = CHARACTERS_BUTTONS.takeo.hovered, active = CHARACTERS_BUTTONS.takeo.active}, Suit.layout:row(WW,WH)).hit then
        local d = Dialog('Data/Dialogues/dialogo_takeo.json')
        Scene.getScene():addDialog(d)
        Main_FSM:changeState('dialog')
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.arnau.normal, {id = 4, mask = CHARACTERS_BUTTONS.arnau.mask, hovered = CHARACTERS_BUTTONS.arnau.hovered, active = CHARACTERS_BUTTONS.arnau.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.marina.normal, {id = 5, mask = CHARACTERS_BUTTONS.marina.mask, hovered = CHARACTERS_BUTTONS.marina.hovered, active = CHARACTERS_BUTTONS.marina.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(CHARACTERS_BUTTONS.vero.normal, {id = 6, mask = CHARACTERS_BUTTONS.vero.mask, hovered = CHARACTERS_BUTTONS.vero.hovered, active = CHARACTERS_BUTTONS.vero.active}, Suit.layout:row(WW,WH)).hit then

    end

end

function Characters_Selection:draw()
    love.graphics.setBackgroundColor(255,255,255)
    love.graphics.setColor(255, 255, 255, 1)
    Suit.draw()
end

function Characters_Selection:mousepressed( x, y, _button, istouch, presses )
end

function Characters_Selection:mousereleased( x, y, _button, istouch, presses )
end

function Characters_Selection:keypressed(_key)
end

function Characters_Selection:keyreleased(_key)
end



return Characters_Selection