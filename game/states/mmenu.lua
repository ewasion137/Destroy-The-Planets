local mmenu = {}

function mmenu.draw()
    love.graphics.printf("ETO MENU", 0, 200, love.graphics.getWidth(), "center")
    love.graphics.printf("Press SPACE to Start", 0, 250, love.graphics.getWidth(), "center")
end

function mmenu.update(dt)
    if love.keyboard.isDown("space") then
        switchState("game") -- Глобальная функция из main.lua
    end
end

return mmenu