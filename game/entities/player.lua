local player = {
    x = 400,
    y = 300,
    vx = 0,
    vy = 0,
    speed = 500,    -- сила тяги
    friction = 0.95, -- трение (чем меньше, тем больше заносит)
    hp = 100,
    maxHp = 100,
    size = 20
}

function player.update(dt)
    -- Управление на WASD или стрелки
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        player.vy = player.vy - player.speed * dt
    end
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        player.vy = player.vy + player.speed * dt
    end
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        player.vx = player.vx - player.speed * dt
    end
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        player.vx = player.vx + player.speed * dt
    end

    -- Применяем трение
    player.vx = player.vx * player.friction
    player.vy = player.vy * player.friction

    -- Обновляем позицию
    player.x = player.x + player.vx * dt
    player.y = player.y + player.vy * dt
end

function player.draw()
    love.graphics.setColor(0, 1, 0.5) -- Неоново-зеленый
    love.graphics.rectangle("fill", player.x - player.size/2, player.y - player.size/2, player.size, player.size)
    
    -- Рисуем полоску ХП над головой
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", player.x - 20, player.y - 30, 40, 5)
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", player.x - 20, player.y - 30, 40 * (player.hp / player.maxHp), 5)
end

return player