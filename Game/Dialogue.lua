Dialogue = Actor:extend()

function Dialogue:new(filename)
    --a stupid simple menu for our test purposes.
    self.menu={
        --select item.
        select=1
    }
    self.yarn=Yarnparse:load(filename)
    self.node=self.yarn:get_node("Start")

    --get our starting text, store it in the text buffer.
    self.script=self.node.body:traverse() --this allows us to go line by line
    self.text= self.script.text --our global text buffer, for showing one line at a time.
    self.text[1][2] = self.script.who..': ' .. self.text[1][2]
    self.command = false -- this is just so we don't accidently display the command.
end

function Dialogue:update(dt)
end

function Dialogue:draw()
    --here is our current text.
    local width = WW/3
    local total_width = WW/3
    local current_height = WH/1.5
    local max_width = WW/3+400
    for index, value in ipairs(self.text) do
        total_width = total_width + FONT_DIALOGUES_DEFAULT:getWidth(value[2])
        if total_width>=max_width then
            current_height = current_height + FONT_DIALOGUES_DEFAULT:getHeight(value[2])
            total_width = WW/3
            width = WW/3
        end
        if not value[3] then
            love.graphics.print({value[1], value[2]}, FONT_DIALOGUES_DEFAULT, width,current_height)
        else
            --love.graphics.print({value[1], value[2]}, font, width,80)
            self:shakyText(20,5,1,value,width,current_height)
        end
        if index<#self.text then
            width = width + FONT_DIALOGUES_DEFAULT:getWidth(value[2])
        else
            width = WW/2
        end
    end
    love.graphics.print("-Press Spacebar to Cycle Through Text-", WW/2, WH-50)

    --display the menu
    if(self.node.has_choices and self.node.body:done()) then
        for i,v in ipairs(self.node.choices) do
            --our menu selection. The selected text is a diff color
            if(i==self.menu.select) then love.graphics.setColor(0.9, 0.4, 0.3) end
            --and this is the actual text itself.
            love.graphics.print(v.text, 100, 200+(i*20))
            --------------------------------------
            if(i==self.menu.select) then love.graphics.setColor(1, 1, 1) end
        end
    end
end

function Dialogue:shakyText(updatesPerSecond,maxDistance,repeats,_text,x,y)
	love.math.setRandomSeed(math.floor(love.timer.getTime()*updatesPerSecond))
	for i=1,repeats do
		local ox,oy = (love.math.random()-0.5)*maxDistance,(love.math.random()-0.5)*maxDistance
		love.graphics.print({_text[1], _text[2]},FONT_DIALOGUES_DEFAULT,x+ox,y+oy)
	end
end

function Dialogue:mousepressed( x, y, _button, istouch, presses )
end
function Dialogue:mousereleased( x, y, _button, istouch, presses )
end

function Dialogue:keypressed(key)
    --slow down space bar
    if(not self.node.body:done()) then --are we at the bottom? If not, keep traversing.
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
            self.text[1][2] = self.script.who..': ' .. self.text[1][2]
        end
    --In case there arechoices,
    --display our simple menu
    elseif(self.node.has_choices) and self.node.body:done() then
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
function Dialogue:keyreleased(_key)
end
return Dialogue