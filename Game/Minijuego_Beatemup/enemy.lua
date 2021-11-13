

local Enemy = {}
Enemy.__index = Enemy
local Player = require("player")

local ActiveEnemies = {}

function Enemy.removeAll()
   for i,v in ipairs(ActiveEnemies) do
      v.physics.body:destroy()
   end

   ActiveEnemies = {}
end

function Enemy.new(x,y)
   local instance = setmetatable({}, Enemy)
   instance.x = x
   instance.y = y
   instance.offsetY = -8
   instance.r = 0

   instance.speed = 100
   instance.speedMod = 1
   instance.xVel = instance.speed

   instance.rageCounter = 0
   instance.rageTrigger = 3

   instance.damage = 1
   instance.life = 3
   instance.color = 
   {
      red = 1,
      green = 1,
      blue = 1,
      speed = 3,
   }
   instance.state = "walk"

   instance.animation = {timer = 0, rate = 0.1}
   instance.animation.run = {total = 4, current = 1, img = Enemy.runAnim}
   instance.animation.walk = {total = 4, current = 1, img = Enemy.walkAnim}
   instance.animation.attack = {total = 4, current = 1, img = Enemy.attackAnim}
   instance.animation.death = {total = 4, current = 1, img = Enemy.deathAnim}
   instance.animation.takehit = {total = 4, current = 1, img = Enemy.takehitAnim}
   instance.animation.draw = instance.animation.walk.img[1]

   instance.physics = {}
   instance.physics.body = love.physics.newBody(World, instance.x, instance.y, "dynamic")
   instance.physics.body:setFixedRotation(true)
   instance.physics.shape = love.physics.newRectangleShape(instance.width * 0.4, instance.height * 0.75)
   instance.physics.fixture = love.physics.newFixture(instance.physics.body, instance.physics.shape)
   instance.physics.body:setMass(25)
   table.insert(ActiveEnemies, instance)
end

function Enemy.loadAssets()
   Enemy.runAnim = {}
   for i=1,4 do
      Enemy.runAnim[i] = love.graphics.newImage("Data/Beatemup_Textures/enemy/run/"..i..".png")
   end

   Enemy.walkAnim = {}
   for i=1,4 do
      Enemy.walkAnim[i] = love.graphics.newImage("Data/Beatemup_Textures/enemy/walk/"..i..".png")
   end

   Enemy.attackAnim = {}
   for i=1,4 do
      Enemy.attackAnim[i] = love.graphics.newImage("Data/Beatemup_Textures/enemy/attack/"..i..".png")
   end

   Enemy.takehitAnim = {}
   for i=1,4 do
      Enemy.takehitAnim[i] = love.graphics.newImage("Data/Beatemup_Textures/enemy/takehit/"..i..".png")
   end
   
   Enemy.deathAnim = {}
   for i=1,4 do
      Enemy.deathAnim[i] = love.graphics.newImage("Data/Beatemup_Textures/enemy/death/"..i..".png")
   end
   
   
   Enemy.width = Enemy.runAnim[1]:getWidth()
   Enemy.height = Enemy.runAnim[1]:getHeight()
   Enemy.width = Enemy.attackAnim[1]:getWidth()
   Enemy.height = Enemy.attackAnim[1]:getHeight()
   Enemy.width = Enemy.deathAnim[1]:getWidth()
   Enemy.height = Enemy.deathAnim[1]:getHeight()
   Enemy.width = Enemy.takehitAnim[1]:getWidth()
   Enemy.height = Enemy.takehitAnim[1]:getHeight()
end
function Enemy:unTint(dt)
   self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
   self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
   self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end
function Enemy:update(dt)
   self:syncPhysics()
   self:animate(dt)
   self:unTint(dt)
end
function Enemy:tintRed()
   self.color.green = 0
   self.color.blue = 0
end

function Enemy:incrementRage()
   self.rageCounter = self.rageCounter + 1
   if self.rageCounter > self.rageTrigger then
      --self.state = "run"
      self.speedMod = 3
      self.rageCounter = 0
   else
      self.state = "walk"
      self.speedMod = 1 
   end
end

function Enemy:takeDamage(amount)
   --self:tintRed()
   
   if self.life - amount > 0 then
      self.life = self.life - amount
      self.state = "takehit"
   else 
      self.life = 0
      --self:die()
      self.state = "death"
      
   end
   print("Enemy health: "..self.life)
end

function Enemy:attack()
   
   self.state = "attack"
   self.speedMod = 1
end

function Enemy:flipDirection()
   self.xVel = -self.xVel
end

function Enemy:animate(dt)
   self.animation.timer = self.animation.timer + dt
   if self.animation.timer > self.animation.rate then
      self.animation.timer = 0
      self:setNewFrame()
   end
end

function Enemy:setNewFrame()
   local anim = self.animation[self.state]
   if anim.current < anim.total then
      anim.current = anim.current + 1
   else
      anim.current = 1
   end
   self.animation.draw = anim.img[anim.current]
end

function Enemy:syncPhysics()
   self.x, self.y = self.physics.body:getPosition()
   self.physics.body:setLinearVelocity(self.xVel * self.speedMod, 100)
end

function Enemy:draw()
   local scaleX = 1
   if self.xVel < 0 then
      scaleX = -1
   end
   love.graphics.draw(self.animation.draw, self.x, self.y + self.offsetY, self.r, scaleX, 1, self.width / 2, self.height / 2)
end

function Enemy.updateAll(dt)
   for i,instance in ipairs(ActiveEnemies) do
      instance:update(dt)
   end
end

function Enemy.drawAll()
   for i,instance in ipairs(ActiveEnemies) do
      instance:draw()
   end
end

function Enemy.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveEnemies) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.physics.fixture or b == Player.physics.fixture then
            
            Player:takeDamage(instance.damage)
            instance:attack()
         end
         instance:takeDamage(Player.damage)
         instance:incrementRage()
         instance:flipDirection()
         
      end
   end
end

return Enemy
