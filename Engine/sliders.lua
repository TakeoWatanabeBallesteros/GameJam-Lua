Slider = Object:extend()

function Slider:new(x, y, length, value, min, max, setter, style)
    local s = {}
    self.value = (value - min) / (max - min)
    self.min = min
    self.max = max
    self.setter = setter
    self.x = x
    self.y = y
    self.length = length

    local p = style or {}
    self.width = p.width or length * 0.1
    self.orientation = p.orientation or 'horizontal'
    self.track = p.track or 'rectangle'
    self.knob = p.knob or 'rectangle'

    self.grabbed = false
    self.wasDown = true
    self.ox = 0
    self.oy = 0
end

function Slider:update(mouseX, mouseY, mouseDown)
    local x = mouseX or love.mouse.getX()
    local y = mouseY or love.mouse.getY()
    local down = love.mouse.isDown(1)
    if mouseDown ~= nil then
        down = mouseDown
    end

    local knobX = self.x
    local knobY = self.y
    if self.orientation == 'horizontal' then
        knobX = self.x - self.length/2 + self.length * self.value
    elseif self.orientation == 'vertical' then
        knobY = self.y + self.length/2 - self.length * self.value
    end

    local ox = x - knobX
    local oy = y - knobY

    local dx = ox - self.ox
    local dy = oy - self.oy

    if down then
        if self.grabbed then
            if self.orientation == 'horizontal' then
                self.value = self.value + dx / self.length
            elseif self.orientation == 'vertical' then
                self.value = self.value - dy / self.length
            end
        elseif (x > knobX - self.width/2 and x < knobX + self.width/2 and y > knobY - self.width/2 and y < knobY + self.width/2) and not self.wasDown then
            self.ox = ox
            self.oy = oy
            self.grabbed = true
        end
    else
        self.grabbed = false
    end

    self.value = math.max(0, math.min(1, self.value))

    if self.setter ~= nil then
        self.setter(self.min + self.value * (self.max - self.min))
    end

    self.wasDown = down
end

function Slider:draw()
    if self.track == 'rectangle' then
        if self.orientation == 'horizontal' then
            love.graphics.rectangle('line', self.x - self.length/2 - self.width/2, self.y - self.width/2, self.length + self.width, self.width)
        elseif self.orientation == 'vertical' then
            love.graphics.rectangle('line', self.x - self.width/2, self.y - self.length/2 - self.width/2, self.width, self.length + self.width)
        end
    elseif self.track == 'line' then
        if self.orientation == 'horizontal' then
            love.graphics.line(self.x - self.length/2, self.y, self.x + self.length/2, self.y)
        elseif self.orientation == 'vertical' then
            love.graphics.line(self.x, self.y - self.length/2, self.x, self.y + self.length/2)
        end
    elseif self.track == 'roundrect' then
        if self.orientation == 'horizontal' then
            love.graphics.rectangle('line', self.x - self.length/2 - self.width/2, self.y - self.width/2, self.length + self.width, self.width, self.width/2, self.width)
        elseif self.orientation == 'vertical' then
            love.graphics.rectangle('line', self.x - self.width/2, self.y - self.length/2 - self.width/2, self.width, self.length + self.width, self.width, self.width/2)
        end
    end

    local knobX = self.x
    local knobY = self.y
    if self.orientation == 'horizontal' then
        knobX = self.x - self.length/2 + self.length * self.value
    elseif self.orientation == 'vertical' then
        knobY = self.y + self.length/2 - self.length * self.value
    end

    if self.knob == 'rectangle' then
        love.graphics.rectangle('fill', knobX - self.width/2, knobY - self.width/2, self.width, self.width)
    elseif self.knob == 'circle' then
        love.graphics.circle('fill', knobX, knobY, self.width/2)
    end
end

function Slider:getValue()
    return self.min + self.value * (self.max - self.min)
end

return Slider