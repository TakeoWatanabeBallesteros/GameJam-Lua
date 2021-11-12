--Takeo Watanabe y Jan de Nobel
Menu_Avatar = Actor:extend()

function Menu_Avatar:new()
    love.mouse.setVisible(true)
    self.alpha = 0
    self.font = FONT_OTAKU_TITLE
    if SaveManager:checkFile('avatar_1.txt') then self.name_1 = SaveManager:loadAvatar_1()
    else self.name_1 = 'Vacio' end
    if SaveManager:checkFile('avatar_2.txt') then self.name_2 = SaveManager:loadAvatar_2()
    else self.name_2 = 'Vacio' end
    if SaveManager:checkFile('avatar_3.txt') then self.name_3 = SaveManager:loadAvatar_3()
    else self.name_3 = 'Vacio' end
    self.preview = {AVATAR_SILUET}
    self.title = 'ESCOGE A TU PERDEDOR'
    Menu.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function Menu_Avatar:update(dt)
    self.alpha = self.alpha < 1 and self.alpha + dt/1.5 or 1
    Suit.theme.color = {
        normal  = {bg = { 66/255, 66/255, 66/255, self.alpha}, fg = {188/255,188/255,188/255, self.alpha}},
        hovered = {bg = { 50/255,153/255,187/255, self.alpha}, fg = {255/255,255/255,255/255, self.alpha}},
        active  = {bg = {255/255,153/255,  0/255, self.alpha}, fg = {225/255,225/255,225/255, self.alpha}}
    }
    Suit.layout:reset(WW/2-(WW/1.05)/2, WH/5.5)
    Suit.layout:padding(WH/20)
    if Suit.Button(self.name_1, {id=1}, Suit.layout:row(WW/1.5, WH/5)).hit then
        if SaveManager:checkFile('avatar_1.txt') then 
            self.preview = {AVATAR_SKINS[AVATAR_1_SETTINGS_SKINS],
                            AVATAR_EYES[AVATAR_1_SETTINGS_EYES],
                            AVATAR_HAIRS[AVATAR_1_SETTINGS_HAIRS],
                            AVATAR_CLOTHES[AVATAR_1_SETTINGS_CLOTHES]}
        else self.preview = {AVATAR_SILUET} end
        AVATAR_SELECTED = 1
    end
    if Suit.Button(self.name_2, {id=2}, Suit.layout:row()).hit then
        if SaveManager:checkFile('avatar_2.txt') then 
            self.preview = {AVATAR_SKINS[AVATAR_2_SETTINGS_SKINS],
                            AVATAR_EYES[AVATAR_2_SETTINGS_EYES],
                            AVATAR_HAIRS[AVATAR_2_SETTINGS_HAIRS],
                            AVATAR_CLOTHES[AVATAR_2_SETTINGS_CLOTHES]}
        else self.preview = {AVATAR_SILUET} end
        AVATAR_SELECTED = 2
    end
    if Suit.Button(self.name_3, {id=3}, Suit.layout:row()).hit then
        if SaveManager:checkFile('avatar_3.txt') then 
            self.preview = {AVATAR_SKINS[AVATAR_3_SETTINGS_SKINS],
                            AVATAR_EYES[AVATAR_3_SETTINGS_EYES],
                            AVATAR_HAIRS[AVATAR_3_SETTINGS_HAIRS],
                            AVATAR_CLOTHES[AVATAR_3_SETTINGS_CLOTHES]}
        else self.preview = {AVATAR_SILUET} end
        AVATAR_SELECTED = 3
    end
    Suit.layout:reset(WW/1.47+(WW/6/2), WH/1.38-(WH/19*4/2))
    Suit.layout:padding(WH/21.6)
    if Suit.Button("CONTINUAR", {id=4}, Suit.layout:row(WW/6, WH/19)).hit then
        if #self.preview > 1 then Main_FSM:changeState('intro') end
    end
    if Suit.Button("EDITAR", {id=5}, Suit.layout:row(WW/6, WH/19)).hit then
        if AVATAR_SELECTED then
            if AVATAR_SELECTED == 1 then SaveManager:loadAvatar_1()
            elseif AVATAR_SELECTED == 2 then SaveManager:loadAvatar_2()
            elseif AVATAR_SELECTED == 3 then SaveManager:loadAvatar_3() end
        Main_FSM:changeState('editor') end
    end
    if Suit.Button("BORRAR", {id=6}, Suit.layout:row()).hit then
        if AVATAR_SELECTED == 1 then
            SaveManager:deleteAvatar_1()
            self.preview = {AVATAR_SILUET}
            self.name_1 = 'Vacio'
        elseif AVATAR_SELECTED == 2 then
            SaveManager:deleteAvatar_2()
            self.preview = {AVATAR_SILUET}
            self.name_2 = 'Vacio'
        elseif AVATAR_SELECTED == 3 then
            SaveManager:deleteAvatar_3()
            self.preview = {AVATAR_SILUET}
            self.name_3 = 'Vacio' end
    end
    if Suit.Button("MENU", {id=7}, Suit.layout:row()).hit then
        Main_FSM:changeState('menu')
    end
end

function Menu_Avatar:draw()
    local sx = WW/1920
    local sy = WH/1080
    love.graphics.setColor(255, 255, 255, self.alpha)
    love.graphics.print(
        self.title,
        FONT_OTAKU_TITLE,
        (WW * 0.5) - FONT_OTAKU_TITLE:getWidth(self.title) * 0.5,
         20 + FONT_OTAKU_TITLE:getHeight(self.title) * 0.5
        )
    for index, value in ipairs(self.preview) do
        love.graphics.draw(value,WW/1.083,WH/3,0,sx*0.5,sy*0.5,value:getWidth()/2,value:getHeight()/2,0,0)
    end
    Suit.draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Menu_Avatar:mousepressed( x, y, _button, istouch, presses )
end

function Menu_Avatar:mousereleased( x, y, _button, istouch, presses )
end

function Menu_Avatar:keypressed(_key)
end

function Menu_Avatar:keyreleased(_key)
end

return Menu_Avatar