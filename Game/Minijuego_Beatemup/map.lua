
local Map = {}
local STI = require("Game/Minijuego_Beatemup/sti")

function Map:load()
   self.currentLevel = 1
   World = love.physics.newWorld(0,2000)
   World:setCallbacks(beginContact, endContact)

   self:init()
end

function Map:init()
   self.level = STI("Data/Beatemup_Textures/map/"..self.currentLevel..".lua", {"box2d"})

   self.level:box2d_init(World)
   self.solidLayer = self.level.layers.solid
   self.groundLayer = self.level.layers.ground
   self.entityLayer = self.level.layers.entity

   self.solidLayer.visible = false
   self.entityLayer.visible = false
   MapWidth = self.groundLayer.width * 16

   self:spawnEntities()
end

function Map:next()
   self:clean()
   self.currentLevel = self.currentLevel + 1
   self:init()
   player:resetPosition()
end

function Map:clean()
   self.level:box2d_removeLayer("solid")
   coin.removeAll()
   enemy.removeAll()
   stone.removeAll()
   spike.removeAll()
end

function Map:update()
   if player.x > MapWidth - 16 then
      self:next()
   end
end

function Map:spawnEntities()
	for i,v in ipairs(self.entityLayer.objects) do
		if v.type == "spikes" then
			enemy.new(v.x + v.width / 2, v.y + v.height / 2)
		elseif v.type == "stone" then
			enemy.new(v.x + v.width / 2, v.y + v.height / 2)
		elseif v.type == "enemy" then
			enemy.new(v.x + v.width / 2, v.y + v.height / 2)
		elseif v.type == "coin" then
			enemy.new(v.x, v.y)
		end
	end
end

function Map:mousepressed(x, y, button, istouch,presses )
end

function Map:mousereleased(x,y,button,istouch,presses )
end

function Map:keypressed(key)
end
function Map:keyreleased(key)
end

return Map
