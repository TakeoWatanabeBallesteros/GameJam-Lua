Dialog = Actor:extend()

function Dialog:new(filename)
    self.dialogues={}
    self.dialogues_index = 1
    --a stupid simple menu for our test purposes.
    self.menu={
        --select item.
        select=1
    }
    self.yarn=Yarnparse:load(filename)
    self.node=self.yarn:get_node("Start")
    self.dialog_background = require('Game/Dialog_Background')()
    self.background = love.graphics.newImage("Data/Dialogs_Backgrounds/Intro_Background.png")
    --get our starting text, store it in the text buffer.
    self.script=self.node.body:traverse() --this allows us to go line by line
    self.text= self.script.text --our global text buffer, for showing one line at a time.
    if self.script.who ~= 'player_1' then self.text[1][2] = self.script.who..': ' .. self.text[1][2] end
    local i = {self.script.who, self.text}
    if i[1] == 'Ricky' or i[1] == 'Marina' then for k,v in ipairs(i[2]) do if v[1][1] == 0 and v[1][2] == 0 and v[1][3] == 0 then v[1] = {1,1,1} end end end
    table.insert(self.dialogues, i)
    self.command = false -- this is just so we don't accidently display the command.
    Dialog.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,1,0, 'HUD')
end

function Dialog:update(dt)
end

function Dialog:draw()
    self.dialog_background:draw(self.background)
    love.graphics.setColor(255, 255, 255, 1)
    local sx = WW / DIALOG_BOXES[self.dialogues[self.dialogues_index][1]]:getWidth()
    local sy = WH / DIALOG_BOXES[self.dialogues[self.dialogues_index][1]]:getHeight()
    love.graphics.draw(DIALOG_BOXES[self.dialogues[self.dialogues_index][1]], 0, 0, 0, sx, sy)
    love.graphics.line(WW/10,0,WW/10,WH)
    love.graphics.line(WW/1.1,0,WW/1.1,WH)
    --here is our current text.
    local width = WW/10
    local total_width = WW/10
    local current_height = WH/1.6
    local max_width = WW/1.1
    for index, value in ipairs(self.dialogues[self.dialogues_index][2]) do
        total_width = total_width + FONT_DIALOGUES_DEFAULT:getWidth(value[2])
        if total_width>=max_width then
            current_height = current_height + FONT_DIALOGUES_DEFAULT:getHeight(value[2])
            total_width = WW/10
            width = WW/10
        end
        if not value[3] then
            love.graphics.print({value[1], value[2]}, FONT_DIALOGUES_DEFAULT, width,current_height)
        else
            --love.graphics.print({value[1], value[2]}, font, width,80)
            self:shakyText(20,5,1,value,width,current_height)
        end
        if index<#self.dialogues[self.dialogues_index][2] then
            width = width + FONT_DIALOGUES_DEFAULT:getWidth(value[2])
        else
            width = WW/10
        end
    end
    love.graphics.print("-Press Spacebar to Cycle Through Text-", WW/4, WH-50)

    --display the menu
    if(self.node.has_choices and self.node.body:done()) and self.dialogues_index == #self.dialogues then
        for i,v in ipairs(self.node.choices) do
            local c = {1, 1, 1}
            --our menu selection. The selected text is a diff color
            if(i==self.menu.select) then c = {0.9, 0.4, 0.3} end
            --and this is the actual text itself.
            love.graphics.print({c, v.text}, FONT_DIALOGUES_DEFAULT, WW/3,200+(i*40))
            --------------------------------------
            if(i==self.menu.select) then c = {1, 1, 1} end
        end
    end
    
    function love.wheelmoved(x, y)
        if y == -1 and self.dialogues_index < #self.dialogues then self.dialogues_index = self.dialogues_index + 1
        elseif y == 1 and self.dialogues_index > 1 then self.dialogues_index = self.dialogues_index - 1 end
    end
end

function Dialog:shakyText(updatesPerSecond,maxDistance,repeats,_text,x,y)
	love.math.setRandomSeed(math.floor(love.timer.getTime()*updatesPerSecond))
	for i=1,repeats do
		local ox,oy = (love.math.random()-0.5)*maxDistance,(love.math.random()-0.5)*maxDistance
		love.graphics.print({_text[1], _text[2]},FONT_DIALOGUES_DEFAULT,x+ox,y+oy)
	end
end

function Dialog:mousepressed( x, y, _button, istouch, presses )
end
function Dialog:mousereleased( x, y, _button, istouch, presses )
end

function Dialog:keypressed(key)
    --slow down space bar
    if(not self.node.body:done()) and self.dialogues_index == #self.dialogues then --are we at the bottom? If not, keep traversing.
        --move to the next line on the body of the node. If it's done, do nothing.
        
        --if not, check to see if space it prssed. 
        --if it is, move to the next line in the body
        if key == 'space' then
            --the text is the text, and the command is whether or not
            --the text is actually a lua command and should be skipped.
            repeat
                self.script, self.command=self.node.body:traverse()
            until not self.command
            --text=script.who .. ": " .. script.text
            self.text=self.script.text
            if self.script.who ~= 'player_1' then self.text[1][2] = self.script.who..': ' .. self.text[1][2] end
            local i = {self.script.who, self.text}
            if i[1] == 'Marina' or i[1] == 'Ricky' then for k,v in ipairs(i[2]) do if v[1][1] == 0 and v[1][2] == 0 and v[1][3] == 0 then v[1] = {1,1,1} end end end
            table.insert(self.dialogues, i)
            self.dialogues_index = self.dialogues_index + 1
        end
    --In case there arechoices,
    --display our simple menu
    elseif(self.node.has_choices) and self.node.body:done() and self.dialogues_index == #self.dialogues then
        if key == "down" then
            self.menu.select=self.menu.select+1
            if(self.menu.select>#self.node.choices) then 
                self.menu.select=1
            end
        end
        if key == 'up' then
            self.menu.select=self.menu.select-1
            if(self.menu.select<=0) then 
                self.menu.select=#self.node.choices
            end  
        end
        if key == 'space' then
            self.node=self.yarn:make_choice(self.node, self.menu.select)
        end
    end
end
function Dialog:keyreleased(_key)
end
return Dialog