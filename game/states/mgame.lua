local mgame = {}
local planetHP = 100

function mgame.draw()
    love.graphics.circle("line", 400, 300, 50 + (planetHP / 2))
    love.graphics.print("Planet HP: " .. planetHP, 10, 10)
end

function mgame.mousepressed(x, y, button)
    if button == 1 then
        planetHP = planetHP - 1
    end
end

return mgame