require "areatrigger"
TimeMachine = AreaTrigger:extend()

function TimeMachine:new()
   	self.super.new(self,30,30,30,30)
   	self.color = {255,255,255}
end

function TimeMachine:update(dt)
	if((player.pos - self.pos):getLength() < math.max(player.dim.x,self.dim.x)) then
		self:event();
	end
end

function TimeMachine:draw()
	love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.dim.x, self.dim.y)
end

function TimeMachine:event()
	if((player.pos - self.pos):getLength() < 30)then
		player.pos.x = 45
		player.pos.y = 1
		history:addEntity(player.pos)
		enemy.pos.x = 500
		enemy.pos.y = 500
		frame = 1
		level:resetTerrain()
	end
end