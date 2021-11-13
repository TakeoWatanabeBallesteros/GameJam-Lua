Characters_Selection = Actor:extend()

function Characters_Selection:new()
    self.font = FONT_BUTTONS_BIG
    Characters_Selection.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
    self.characters_buttons = {}
    for k,v in ipairs(characters_names) do
        self.characters_buttons[v] = {}
        self:generateImageButton(v)
        print(self.characters_buttons[v].mask)
    end
end

function Characters_Selection:update(dt)
    Suit.layout:reset(WW/2-WW/5/2, WH-100)
    if Suit.Button("ATRAS", {id=4}, Suit.layout:row(WW/5, WH/20)).hit then
        Main_FSM:changeState('menu')
    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    
    if Suit.ImageButton(self.characters_buttons.alex.normal, {id = 1, mask = self.characters_buttons.alex.mask, hovered = self.characters_buttons.alex.hovered, active = self.characters_buttons.alex.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(self.characters_buttons.ricky.normal, {id = 2, mask = self.characters_buttons.ricky.mask, hovered = self.characters_buttons.ricky.hovered, active = self.characters_buttons.ricky.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(self.characters_buttons.takeo.normal, {id = 3, mask = self.characters_buttons.takeo.mask, hovered = self.characters_buttons.takeo.hovered, active = self.characters_buttons.takeo.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(self.characters_buttons.arnau.normal, {id = 4, mask = self.characters_buttons.arnau.mask, hovered = self.characters_buttons.arnau.hovered, active = self.characters_buttons.arnau.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(self.characters_buttons.marina.normal, {id = 5, mask = self.characters_buttons.marina.mask, hovered = self.characters_buttons.marina.hovered, active = self.characters_buttons.marina.active}, Suit.layout:row(WW,WH)).hit then

    end
    love.graphics.setColor(255,255,255)
    Suit.layout:reset(0, 0)
    if Suit.ImageButton(self.characters_buttons.vero.normal, {id = 6, mask = self.characters_buttons.vero.mask, hovered = self.characters_buttons.vero.hovered, active = self.characters_buttons.vero.active}, Suit.layout:row(WW,WH)).hit then

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

function Characters_Selection:generateImageButton(name)
    function alpha( x, y, r, g, b, a )
        if a ~= 0 then return r,g,b,1
        end
        return r,g,b,a
     end

     function alpha2( x, y, r, g, b, a )
        if a ~= 0 then return r,g,b,0.7
        end
        return r,g,b,a
     end
    
     function alpha3( x, y, r, g, b, a )
        if a ~= 0 then return r,g,b,a
        end
        return r,g,b,a
     end
     

    local normal, hovered, active = love.image.newImageData("Data/Avatar/Characters_Buttons/boton_"..name..".png"), love.image.newImageData("Data/Avatar/Characters_Buttons/boton_"..name..".png"), love.image.newImageData("Data/Avatar/Characters_Buttons/boton_"..name..".png")
    normal:mapPixel(alpha)
    hovered:mapPixel(alpha2)
    active:mapPixel(alpha3)
    self.characters_buttons[name].normal = love.graphics.newImage(normal)
    self.characters_buttons[name].hovered = love.graphics.newImage(hovered)
    self.characters_buttons[name].active = love.graphics.newImage(active)
    self.characters_buttons[name].mask = normal
end

return Characters_Selection