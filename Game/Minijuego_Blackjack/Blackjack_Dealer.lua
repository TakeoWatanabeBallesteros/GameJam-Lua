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

function Blackjack_Dealer:addCard(idx)
    table.insert(self.cards,idx)
end

return Blackjack_Dealer