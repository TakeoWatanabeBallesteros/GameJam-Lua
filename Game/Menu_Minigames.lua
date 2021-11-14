Menu_Minigames = Actor:extend()

function Menu_Minigames:new()
    self.font = FONT_BUTTONS_BIG
    Menu_Minigames.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Menu_Minigames:update(dt)
    Suit.layout:reset(WW/2-((WW/5)/1.7), WH/1.09)
    if Suit.Button("ATRAS", {id=33}, Suit.layout:row(WW/5, WH/20)).hit then
        Main_FSM:changeState('menu')
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
        if Suit.ImageButton(MINIGAMES_BUTTONS.beber.normal, {id = 34, mask =    MINIGAMES_BUTTONS.beber.mask, hovered = MINIGAMES_BUTTONS.beber.hovered, active = MINIGAMES_BUTTONS.beber.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            Main_FSM:changeState('vodka')
            MINIGAME = true
        end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
        if Suit.ImageButton(MINIGAMES_BUTTONS.blackjack.normal, {id = 35,   mask = MINIGAMES_BUTTONS.blackjack.mask, hovered = MINIGAMES_BUTTONS.blackjack.hovered, active = MINIGAMES_BUTTONS.blackjack.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            Main_FSM:changeState('blackjack')
            MINIGAME = true
        end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
        if Suit.ImageButton(MINIGAMES_BUTTONS.clase.normal, {id = 36,   mask = MINIGAMES_BUTTONS.clase.mask, hovered = MINIGAMES_BUTTONS.clase.hovered, active = MINIGAMES_BUTTONS.clase.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            Main_FSM:changeState('dormir')
            MINIGAME = true
        end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
        if Suit.ImageButton(MINIGAMES_BUTTONS.gancho.normal, {id = 37,   mask = MINIGAMES_BUTTONS.gancho.mask, hovered = MINIGAMES_BUTTONS.gancho.hovered, active = MINIGAMES_BUTTONS.gancho.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            Main_FSM:changeState('gancho')
            MINIGAME = true
        end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
        if Suit.ImageButton(MINIGAMES_BUTTONS.pong.normal, {id = 38, mask =  MINIGAMES_BUTTONS.pong.mask, hovered = MINIGAMES_BUTTONS.pong.hovered, active = MINIGAMES_BUTTONS.pong.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            Main_FSM:changeState('pong')
            MINIGAME = true
        end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
        if Suit.ImageButton(MINIGAMES_BUTTONS.programar.normal, {id = 39,    mask = MINIGAMES_BUTTONS.programar.mask, hovered = MINIGAMES_BUTTONS.programar.hovered, active = MINIGAMES_BUTTONS.programar.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            Main_FSM:changeState('programar')
            MINIGAME = true
        end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
        if Suit.ImageButton(MINIGAMES_BUTTONS.topo.normal, {id = 40,    mask = MINIGAMES_BUTTONS.topo.mask, hovered = MINIGAMES_BUTTONS.topo.hovered, active = MINIGAMES_BUTTONS.topo.active}, Suit.layout:row(WW/1920,WH/1080)).hit then
            Main_FSM:changeState('topo')
            MINIGAME = true
        end
end

function Menu_Minigames:draw()
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
    love.graphics.draw(MINIGAMES_BUTTONS_UI, 0, 0, 0, sx, sy)
    Suit.draw()
end

function Menu_Minigames:mousepressed( x, y, _button, istouch, presses )
end

function Menu_Minigames:mousereleased( x, y, _button, istouch, presses )
end

function Menu_Minigames:keypressed(_key)
end

function Menu_Minigames:keyreleased(_key)
end

return Menu_Minigames