

local Spike = {img = love.graphics.newImage("Data/Beatemup_Textures/spike.png")}
Spike.__index = Spike

Spike.width = Spike.img:getWidth()
Spike.height = Spike.img:getHeight()

local ActiveSpikes = {}

function Spike.removeAll()
   for i,v in ipairs(ActiveSpikes) do
      v.physics.body:destroy()
   end

   ActiveSpikes = {}
end

function Spike.new(x,y)
   local instance = setmetatable({}, Spike)
   instance.x = x
   instance.y = y

   instance.damage = 1

   instance.physics = {}
   instance.physics.body = love.physics.newBody(World, instance.x, instance.y, "static")
   instance.physics.shape = love.physics.newRectangleShape(instance.width, instance.height)
   instance.physics.fixture = love.physics.newFixture(instance.physics.body, instance.physics.shape)
   instance.physics.fixture:setSensor(true)
   table.insert(ActiveSpikes, instance)
end

function Spike:update(dt)

end

function Spike:draw()
   love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, self.width / 2, self.height / 2)
end

function Spike.updateAll(dt)
   for i,instance in ipairs(ActiveSpikes) do
      instance:update(dt)
   end
end

function Spike.drawAll()
   for i,instance in ipairs(ActiveSpikes) do
      instance:draw()
   end
end

function Spike.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveSpikes) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == player.physics.fixture or b == player.physics.fixture then
            player:takeDamage(instance.damage)
            return true
         end
      end
   end
end

function Spike:mousepressed(x, y, button, istouch,presses )
end

function Spike:mousereleased(x,y,button,istouch,presses )
end

function Spike:keypressed(key)
end
function Spike:keyreleased(key)
end

return Spike
