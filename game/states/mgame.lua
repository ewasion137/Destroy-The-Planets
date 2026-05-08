local player = require("entities.player")
local planet = require("entities.planet")

local mgame = {}

function mgame.load()
    planet:load() -- ОБЯЗАТЕЛЬНО ИНИЦИАЛИЗИРУЕМ БЛОКИ
end

function mgame.update(dt)
    player:update(dt)
    
    -- Тут будет логика коллизий с блоками (следующим шагом)
end

function mgame.draw()
    love.graphics.clear(0.02, 0.02, 0.05) -- Глубокий космос
    
    planet:draw()
    player:draw(planet)
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("COORD: " .. math.floor(player.gridX) .. ", " .. math.floor(player.gridY), 10, 10)
end

return mgame