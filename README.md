# Kaizer.lua
local Garden = {}
Garden.plants = {}

function Garden.plant(name)
    local plant = {
        name = name,
        stage = 1
    }

    table.insert(Garden.plants, plant)

    print("🌱 Planted:", name)

    coroutine.wrap(function()
        for i = 1, 3 do
            wait(5)
            plant.stage += 1
            print(name .. " grew to stage " .. plant.stage)
        end

        print("✅ " .. name .. " ready to harvest!")
    end)()
end

function Garden.harvest()
    for i, plant in ipairs(Garden.plants) do
        if plant.stage >= 4 then
            print("🌾 Harvested:", plant.name)
            table.remove(Garden.plants, i)
        end
    end
end

return Garden
