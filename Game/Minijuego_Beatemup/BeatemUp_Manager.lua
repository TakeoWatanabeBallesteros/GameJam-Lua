BeatemUp_Manager = Actor:extend()

function BeatemUp_Manager:new(x,y)
	enemy.loadAssets()
	map:load()
	gui:load()
	player:load()
    BeatemUp_Manager.super.new(self,DEFAULT_IMAGE,WW/2,WH/2,0,-1,0, 'HUD')
end

function BeatemUp_Manager:update(dt) 
	World:update(dt)
	player:update(dt)
	coin.updateAll(dt)
	spike.updateAll(dt)
	stone.updateAll(dt)
	enemy.updateAll(dt)
	gui:update(dt)
	camera:setPosition(player.x, 0)
	map:update(dt)
end

function BeatemUp_Manager:draw()
	map.level:draw(-camera.x, -camera.y, camera.scale, camera.scale)

	camera:apply()
	player:draw()
	enemy.drawAll()
	coin.drawAll()
	spike.drawAll()
	stone.drawAll()
	camera:clear()

	gui:draw()
end

function beginContact(a, b, collision)
	if coin.beginContact(a, b, collision) then return end
	if spike.beginContact(a, b, collision) then return end
	enemy.beginContact(a, b, collision)
	player:beginContact(a, b, collision)
end

function endContact(a, b, collision)
	player:endContact(a, b, collision)
end
function BeatemUp_Manager:mousepressed(x, y, button, istouch,presses )
end

function BeatemUp_Manager:mousereleased(x,y,button,istouch,presses )
end

function BeatemUp_Manager:keypressed(key)
	player:jump(key)
	player:Attack(key)
end
function BeatemUp_Manager:keyreleased(key)
	player:NotAttack(key)
end


return BeatemUp_Manager