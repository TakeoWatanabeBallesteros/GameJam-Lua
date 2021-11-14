Blackjack_Dealer = Actor:extend()

function Blackjack_Dealer:new(x,y)
    self.cards = {}
    Blackjack_Dealer.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,1,0,0, 'Front')
end

function Blackjack_Dealer:update(dt)
    Blackjack_Dealer.super.update(self,dt)
end

function Blackjack_Dealer:draw()
    love.graphics.setColor(255, 255, 255, 1)
    for index, value in ipairs(self.cards) do
        if (currentState == 'Stay' or currentState == 'Win' or currentState == 'Lose' or currentState == 'Draw') or index == 1 then
            love.graphics.draw(value,WW/2.2+index*30,WH/15+index*30,0, WW/1920, WH/1080)
        end
        if index == 2 and not (currentState == 'Stay' or currentState == 'Win' or currentState == 'Lose' or currentState == 'Draw') then
            love.graphics.draw(CARD_BACK,WW/2.2+index*30,WH/15+index*30,0, WW/1920, WH/1080)
        end
    end
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Blackjack_Dealer:addCard(idx, suit)
    table.insert(self.cards,CARDS[suit][idx])
end

function Blackjack_Dealer:mousepressed( x, y, _button, istouch, presses )
end
function Blackjack_Dealer:mousereleased( x, y, _button, istouch, presses )
end
function Blackjack_Dealer:keypressed(_key)
end
function Blackjack_Dealer:keyreleased(_key)
end

return Blackjack_Dealer