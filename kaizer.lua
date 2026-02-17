# Kaizer.lua
-- =========================================
-- SIMPLE GROW A GARDEN SYSTEM
-- No loader • No errors • Beginner friendly
-- =========================================

local Garden = {}

-- Storage for plants
Garden.plants = {}

-- =============================
-- Create Plant
-- =============================
function Garden.plant(seedName)
    local plant = {
        name = seedName,
        stage = 1,
        maxStage = 4
    }

    table.insert(Garden.plants, plant)

    print("🌱 Seed planted:", seedName)

    -- Grow automatically
    coroutine.wrap(function()
        while plant.stage < plant.maxStage do
            wait(3)
            plant.stage = plant.stage + 1
            print("🌿 " .. plant.name .. " grew to stage " .. plant.stage)
        end

        print("✅ " .. plant.name .. " is READY to harvest!")
    end)()
end

-- =============================
-- Harvest Plants
-- =============================
function Garden.harvest()
    for i = #Garden.plants, 1, -1 do
        local plant = Garden.plants[i]

        if plant.stage >= plant.maxStage then
            print("🌾 Harvested:", plant.name)
            table.remove(Garden.plants, i)
        end
    end
end

-- =============================
-- Show Garden Status
-- =============================
function Garden.status()
    print("🌼 Garden Status:")

    if #Garden.plants == 0 then
        print("No plants growing.")
        return
    end

    for i, plant in ipairs(Garden.plants) do
        print(i .. ". " .. plant.name .. " | Stage: " .. plant.stage)
    end
end

-- =============================
-- Example Usage
-- =============================

Garden.plant("Carrot")
Garden.plant("Tomato")

wait(10)
Garden.status()

wait(5)
Garden.harvest()

return Garden
