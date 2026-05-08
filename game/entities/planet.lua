local planet = {
    centerX = 400,
    centerY = 300,
    width = 128,   -- блоков в обхвате
    depth = 18,    -- 6+6+6
    baseRadius = 350, -- Радиус поверхности (сделай больше, чтобы было масштабно)
    blocks = {}
}

function planet.load(self)
    self.blocks = {}
    for y = 1, self.depth do
        self.blocks[y] = {}
        for x = 1, self.width do
            local layerType = 1
            if y > 6 then layerType = 2 end
            if y > 12 then layerType = 3 end

            self.blocks[y][x] = {
                type = layerType,
                hp = layerType * 2,
                active = true
            }
        end
    end
end

-- Магия искривления
function planet.to_polar(self, x, y)
    local angle = (x / self.width) * (math.pi * 2)
    local radius = self.baseRadius - (y * 12) -- 12 - визуальная высота блока
    local px = self.centerX + math.cos(angle) * radius
    local py = self.centerY + math.sin(angle) * radius
    return px, py, angle
end

function planet.draw(self)
    for y = 1, #self.blocks do
        for x = 1, self.width do
            local b = self.blocks[y][x]
            if b and b.active then
                local px, py, angle = self:to_polar(x, y)
                
                -- Цвет слоев
                if b.type == 1 then love.graphics.setColor(0.5, 0.4, 0.3) -- Кора
                elseif b.type == 2 then love.graphics.setColor(0.7, 0.3, 0.1) -- Мантия
                else love.graphics.setColor(0.4, 0.1, 0.1) end -- Околоядра
                
                -- Рисуем маленькие блоки (точки/квадраты)
                love.graphics.push()
                love.graphics.translate(px, py)
                love.graphics.rotate(angle)
                love.graphics.rectangle("fill", -4, -4, 8, 8) 
                love.graphics.pop()
            end
        end
    end

    -- Ядро через 5 блоков пропуска (18 + 5 = 23)
    local coreX, coreY = self.centerX, self.centerY
    local coreRadius = self.baseRadius - (23 * 12)
    love.graphics.setColor(1, 0.8, 0)
    love.graphics.circle("line", coreX, coreY, coreRadius)
end

return planet