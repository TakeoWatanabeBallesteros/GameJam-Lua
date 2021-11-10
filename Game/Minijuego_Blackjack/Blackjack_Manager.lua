Blackjack_Manager = Actor:extend()
local cards = {2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1}

function Blackjack_Manager:new(x,y)
    States = {'Initial_Cards', 'Waiting', 'Hit', 'Stay', 'Win', 'Lose', 'Draw'}
    self.currentState = 'Initial_Cards'
    self.dealer = {}
    self.player = {}
    self.p = Scene.getScene():getActor(Blackjack_Player)
    self.d = Scene.getScene():getActor(Blackjack_Dealer)
    Blackjack_Manager.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,1,0,0, 'Background')
end

function Blackjack_Manager:update(dt)
    math.randomseed(os.time())
    if self.currentState == 'Initial_Cards' then
        self:IntialCards()
    elseif self.currentState == 'Hit' then
        self:Hit()
    elseif self.currentState == 'Stay' then
        self:DealerPlays()
    end
    Blackjack_Manager.super.update(self,dt)
end

function Blackjack_Manager:draw()
  love.graphics.setColor(255, 255, 255, 1)
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Blackjack_Manager:IntialCards()
    local i = math.random(#cards)
    table.insert(self.dealer,cards[i])
    self.d:addCard(i)
    i = math.random(#cards)
    table.insert(self.dealer,cards[i])
    self.d:addCard(i)
    i = math.random(#cards)
    table.insert(self.player,cards[i])
    self.p:addCard(i)
    i = math.random(#cards)
    table.insert(self.player,cards[i])
    self.p:addCard(i)
    --check initial player hand
    if self.player[1] == 1 or self.player[2] == 1 and (self.player[1] ~= self.player[2]) then
        self.player[3] = self.player[1] == 1 and self.player[2]+11 or self.player[1]+11
        if self.player[3] == 21 then self.currentState = 'Stay'end
    elseif self.player[1] == 1 or self.player[2] == 1 and (self.player[1] == self.player[2]) then
        self.player[3] = 12
    else
        self.player[3] = self.player[1]+self.player[2]
    end
    self.currentState = 'Waiting'
end

function Blackjack_Manager:Hit()
    table.insert(self.player,1,cards[math.random(#cards)])
    --Check if win or lose
    if self.player[1] == 1 and self.player[3] <= 10 then self.player[3] = self.player[3]+11
    elseif  self.player[1] == 1 and self.player[3] > 10 then self.player[3] = self.player[3]+1
    elseif self.player[1] + self.player[3] > 21 then self.currentState = 'Lose'
    else self.player[3] = self.player[1] + self.player[3] end
    self.currentState = 'Waiting'
end

function Blackjack_Manager:DealerPlays()
    while self.dealer[1] < 17 and self.dealer[1] < self.player[3] do
        self.dealer[1] = self.dealer[1] + cards[math.random(#cards)]
    end
    self:CheckWin()
end

function Blackjack_Manager:CheckWin()
    if self.dealer[1] < self.player[3] and self.player[1] <= 21 then self.currentState = 'Win'
    elseif self.dealer[1] <= 21 and self.player[3]==self.dealer[1] then self.currentState = 'Draw'
    elseif self.dealer[1] <= 21 and self.player[3]<self.dealer[1] then self.currentState = 'Lose'
    elseif self.dealer[1] > 21 and self.player[3] <= 21 then self.currentState = 'Win'
    end
end

return Blackjack_Manager