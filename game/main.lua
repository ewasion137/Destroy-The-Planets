-- Менеджер состояний
local states = {
    menu = require("states.mmenu"),
    game = require("states.mgame")
}
local currentState = states.menu -- Стартуем с меню

function love.load()
    -- Инициализируем все состояния
    for _, state in pairs(states) do
        if state.load then state.load() end
    end
end

function love.update(dt)
    if currentState.update then
        currentState.update(dt)
    end
end

function love.draw()
    if currentState.draw then
        currentState.draw()
    end
end

-- Функция для смены экрана (вызывать как switchState("game"))
function switchState(name)
    if states[name] then
        currentState = states[name]
    end
end

-- Проброс ввода (клавиши, мышь)
function love.mousepressed(x, y, button)
    if currentState.mousepressed then
        currentState.mousepressed(x, y, button)
    end
end