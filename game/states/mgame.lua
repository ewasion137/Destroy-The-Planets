local player = require("entities.player")
local planet = require("entities.planet")

local mgame = {}

function mgame.update(dt)
    player.update(dt)

    -- Простая проверка коллизии (расстояние между игроком и центром планеты)
    local dx = player.x - planet.x
    local dy = player.y - planet.y
    local distance = math.sqrt(dx*dx + dy*dy)
    
    local currentLayerRadius = 50 + (planet.currentLayer * 30)

    if distance < currentLayerRadius then
        -- Если коснулись - бьем планету
        local broken = planet.takeDamage(50 * dt)
        
        -- Планета бьет в ответ (отдача/урон)
        local layer = planet.layers[planet.currentLayer]
        if layer then
            player.hp = player.hp - layer.damage * dt
            -- Отталкивание (чтобы не стоял внутри)
            player.vx = dx * 2
            player.vy = dy * 2
        end

        if broken then
            -- Вампиризм: восстанавливаем ХП при пробитии слоя
            player.hp = math.min(player.maxHp, player.hp + 20)
        end
    end
end

function mgame.draw()
    love.graphics.clear(0.05, 0.05, 0.1) -- Космический фон
    planet.draw()
    player.draw()
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("HP: " .. math.floor(player.hp), 20, 20)
end

return mgame