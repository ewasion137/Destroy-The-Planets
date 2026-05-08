local planet = {
    x = 400,
    y = 300,
    currentLayer = 1,
    layers = {
        { name = "Кора", hp = 100, maxHp = 100, color = {0.4, 0.3, 0.2}, damage = 0 },
        { name = "Мантия", hp = 300, maxHp = 300, color = {0.8, 0.4, 0}, damage = 5 },
        { name = "Ядро", hp = 1000, maxHp = 1000, color = {1, 0.2, 0}, damage = 20 }
    }
}

function planet.takeDamage(amount)
    local layer = planet.layers[planet.currentLayer]
    if not layer then return end

    layer.hp = layer.hp - amount
    
    -- Если слой пробит
    if layer.hp <= 0 then
        layer.hp = 0
        planet.currentLayer = planet.currentLayer + 1
        return true -- Слой пробит (для эффектов)
    end
    return false
end

function planet.draw()
    -- Рисуем слои от внутреннего к внешнему (в обратном порядке)
    for i = #planet.layers, planet.currentLayer, -1 do
        local layer = planet.layers[i]
        local radius = 50 + (i * 30) -- Каждый слой шире предыдущего
        
        love.graphics.setColor(layer.color)
        -- Визуальное уменьшение слоя при получении урона
        local visualRadius = radius * (0.8 + 0.2 * (layer.hp / layer.maxHp))
        love.graphics.circle("fill", planet.x, planet.y, visualRadius)
    end
end

return planet