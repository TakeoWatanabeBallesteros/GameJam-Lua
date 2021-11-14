Blackjack_Manager = Actor:extend()
local cards = {2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1}
local suits = {'club', 'diamond', 'heart', 'spade'}

function Blackjack_Manager:new(x,y)
    currentState = 'Initial_Cards'
    love.mouse.setVisible(true)
    self.dealer = {}
    self.player = {}
    self.font = DORMIR_FONT
    self.p = Scene.getScene():getActor(Blackjack_Player)
    self.d = Scene.getScene():getActor(Blackjack_Dealer)
    Blackjack_Manager.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,1,0,0, 'HUD')
    Suit.theme.color = {
        normal  = {bg = { 66/255, 66/255, 66/255}, fg = {188/255,188/255,188/255}},
        hovered = {bg = { 50/255,153/255,187/255}, fg = {255/255,255/255,255/255}},
        active  = {bg = {255/255,153/255,  0/255}, fg = {225/255,225/255,225/255}}
    }
    self.timer = 0
    self.timer2 = 60
    self.skip = false
end

function Blackjack_Manager:update(dt)
    if not self.skip then

    else
    math.randomseed(os.time())
    if currentState == 'Initial_Cards' then
        self:IntialCards()
    elseif currentState == 'Hit' then
        self:Hit()
    elseif currentState == 'Stay' then
        self:DealerPlays()
    elseif (currentState == 'Win' or currentState == 'Lose' or currentState == 'Draw') and self.timer == 0 then
        currentState = 'Initial_Cards'
    end
    love.graphics.setFont(FONT_BUTTONS)
    Suit.layout:reset(WW/2-WW/20, WH/1.2)
    Suit.layout:padding(10)
    if Suit.Button("Pedir Carta", {id=54}, Suit.layout:row(WW/10, WH/24)).hit then
        if currentState == "Waiting" then currentState = 'Hit'end
    end
    if Suit.Button("Plantarse", {id=55}, Suit.layout:row()).hit then
        if currentState == "Waiting" then currentState = 'Stay' end
    end
    self.timer = self.timer > 0 and self.timer - dt or 0
    self.timer2 = self.timer2 > 0 and self.timer2 - dt or 0
    if self.timer2 == 0 then
        if not MINIGAME then
            Main_FSM:changeState('dialog')
        else Main_FSM:changeState('menu') MINIGAME = false end
    end
    Blackjack_Manager.super.update(self,dt)
    end
end

function Blackjack_Manager:draw()
    love.graphics.setColor(255, 255, 255, 1)
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = WW/1920
    local sy = WH/1080
    local rr = self.rot
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
    if currentState == 'Win' then
        
    love.graphics.print(
            'HAS GANADO!',
            FONT_BUTTONS_BIG,
            (WW * 0.5) - FONT_BUTTONS_BIG:getWidth('HAS GANADO!') * 0.5,
            (WH/2.5) - FONT_BUTTONS_BIG:getHeight('HAS GANADO!') * 0.5
            )
        elseif currentState == 'Lose' then
            love.graphics.print(
            'HAS PERDIDO POR FEKA!',
            FONT_BUTTONS_BIG,
            (WW * 0.5) - FONT_BUTTONS_BIG:getWidth('HAS PERDIDO POR FEKA!') * 0.5,
            (WH/2.5) - FONT_BUTTONS_BIG:getHeight('HAS PERDIDO POR FEKA!') * 0.5
            )
        elseif currentState == 'Draw' then
            love.graphics.print(
            'EMPATE',
            FONT_BUTTONS_BIG,
            (WW * 0.5) - FONT_BUTTONS_BIG:getWidth('EMPATE') * 0.5,
            (WH/2.5) - FONT_BUTTONS_BIG:getHeight('EMPATE') * 0.5
            )
        end
    Suit:draw()
    love.graphics.print(
        math.floor(self.timer2),
        self.font,
        (WW/1.2) - self.font:getWidth(math.floor(self.timer2)) * 0.5,
        (WH/10)
        )
        love.graphics.setColor(255,255,255, self.alpha)
    love.graphics.setBackgroundColor(0, 0, 0)
    if not self.skip then love.graphics.draw(MINIGAMES_TUTORIALS.blackjack, 0, 0, 0, sx, sy) end
end

function Blackjack_Manager:IntialCards()
    self.player = {}
    self.dealer = {}
    self.p.cards = {}
    self.d.cards = {}
    local i = math.random(#cards)
    local s = suits[math.random(#suits)]
    print('dealer: ', cards[i])
    table.insert(self.dealer,cards[i])
    self.d:addCard(i, s)
    i = math.random(#cards)
    s = suits[math.random(#suits)]
    print('dealer: ', cards[i])
    table.insert(self.dealer,cards[i])
    self.d:addCard(i, s)
    i = math.random(#cards)
    s = suits[math.random(#suits)]
    print('player: ', cards[i])
    table.insert(self.player,cards[i])
    self.p:addCard(i,s)
    i = math.random(#cards)
    s = suits[math.random(#suits)]
    print('player: ', cards[i])
    table.insert(self.player,cards[i])
    self.p:addCard(i,s)
    --check initial player hand
    if self.player[1] == 1 or self.player[2] == 1 and (self.player[1] ~= self.player[2]) then
        self.player[3] = self.player[1] == 1 and self.player[2]+11 or self.player[1]+11
        if self.player[3] == 21 then currentState = 'Stay'end
    elseif self.player[1] == 1 or self.player[2] == 1 and (self.player[1] == self.player[2]) then
        self.player[3] = 12
    else
        self.player[3] = self.player[1]+self.player[2]
    end
    currentState = 'Waiting'
end

function Blackjack_Manager:Hit()
    local i = math.random(#cards)
    local s = suits[math.random(#suits)]
    print('player: ', cards[i])
    self.player[1]=cards[i]
    self.p:addCard(i,s)
    --Check if win or lose
    if self.player[1] == 1 and self.player[3] <= 10 then self.player[3] = self.player[3]+11
    elseif  self.player[1] == 1 and self.player[3] > 10 then self.player[3] = self.player[3]+1
    elseif self.player[1] + self.player[3] > 21 then currentState = 'Lose'
    self.player[3] = self.player[1] + self.player[3]
    self.timer = 1.5
    else self.player[3] = self.player[1] + self.player[3] end
    if currentState ~= 'Lose' then currentState = 'Waiting'end
end

function Blackjack_Manager:DealerPlays()
    self.dealer[3] = self.dealer[1] + self.dealer[2]
    while self.dealer[3] < 17 and self.dealer[3] < self.player[3] do
        local i = math.random(#cards)
        local s = suits[math.random(#suits)]
        self.dealer[1] = cards[i]
        print('dealer: ', cards[i])
        if self.dealer[1] == 1 and self.dealer[3] <= 10 then self.dealer[3] = self.dealer[3]+11
        elseif  self.dealer[1] == 1 and self.dealer[3] > 10 then self.dealer[3] = self.dealer[3]+1
        elseif self.dealer[1] + self.dealer[3] > 21 then currentState = 'Win'
        self.timer = 1.5
        self.dealer[3] = self.dealer[1] + self.dealer[3] 
        else self.dealer[3] = self.dealer[1] + self.dealer[3] end
        self.d:addCard(i,s)
    end
    self:CheckWin()
end

function Blackjack_Manager:CheckWin()
    if self.dealer[3] < self.player[3] and self.player[3] <= 21 then currentState = 'Win'
    elseif self.dealer[3] <= 21 and self.player[3]==self.dealer[3] then currentState = 'Draw'
    elseif self.dealer[3] <= 21 and self.player[3]<self.dealer[3] then currentState = 'Lose'
    elseif self.dealer[3] > 21 and self.player[3] <= 21 then currentState = 'Win'
    elseif self.dealer[3] > 21 and self.player[3] > 21 then currentState = 'Draw'
    end
    self.timer = 1.5
    print(self.dealer[3], self.player[3])
end

function Blackjack_Manager:mousepressed( x, y, _button, istouch, presses )
end
function Blackjack_Manager:mousereleased( x, y, _button, istouch, presses )
end
function Blackjack_Manager:keypressed(_key)
    if _key == 'space' then self.skip = true end
end
function Blackjack_Manager:keyreleased(_key)
end

return Blackjack_Manager