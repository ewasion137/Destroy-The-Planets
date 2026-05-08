local progression = {}

-- Таблица планет
progression.planets = {
    { name = "Argon", base_hp = 100, base_reward = 10 },
    { name = "Xenon", base_hp = 500, base_reward = 50 },
}

-- Функция расчета статов для уровня (1-5)
function progression.get_level_stats(planet_idx, level)
    local p = progression.planets[planet_idx]
    return {
        hp = p.base_hp * (1.5 ^ (level - 1)), -- Каждым уровнем ХП растет в 1.5 раза
        reward = p.base_reward * (2 ^ (level - 1)), -- Награда растет в 2 раза
        difficulty = level -- Множитель урона по игроку
    }
end

return progression