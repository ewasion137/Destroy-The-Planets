local player = {
    gridX = 64,
    gridY = -150, -- Стартуем далеко в космосе
    vx = 0,
    vy = 0,
    speed = 50,
    friction = 0.92,
    hp = 100
}

function player.update(self, dt)
    if love.keyboard.isDown("a") then self.vx = self.vx - self.speed * dt end
    if love.keyboard.isDown("d") then self.vx = self.vx + self.speed * dt end
    if love.keyboard.isDown("w") then self.vy = self.vy - self.speed * dt end
    if love.keyboard.isDown("s") then self.vy = self.vy + self.speed * dt end

    self.vx = self.vx * self.friction
    self.vy = self.vy * self.friction

    self.gridX = self.gridX + self.vx
    self.gridY = self.gridY + self.vy

    -- Зацикливание горизонтали
    if self.gridX > 128 then self.gridX = self.gridX - 128 end
    if self.gridX < 0 then self.gridX = self.gridX + 128 end
end

function player.draw(self, planet)
    local px, py, angle = planet:to_polar(self.gridX, self.gridY)
    love.graphics.setColor(0, 1, 0.5)
    love.graphics.push()
    love.graphics.translate(px, py)
    love.graphics.rotate(angle + math.pi/2)
    love.graphics.rectangle("fill", -8, -8, 16, 16)
    love.graphics.pop()
end

return player