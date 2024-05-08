local Timer = {}

local timers = {}

local function updateAfter(timer, dt)
    timer.elapsed = timer.elapsed + dt
    if timer.elapsed >= timer.duration then
        timer.callback()
        timer.active = false
        table.remove(timers)
    end
end

local function updateEvery(timer, dt)
    timer.elapsed = timer.elapsed + dt
    if timer.elapsed >= timer.duration then
        timer.callback()
        timer.elapsed = timer.elapsed - timer.duration
    end
end

function Timer.once(duration, callback)
    local t = {}

    t.duration = duration
    t.elapsed = 0
    t.callback = callback
    t.active = true
    t.update = updateAfter

    table.insert(timers, t)
end

function Timer.recurring(duration, callback)
    local t = {}

    t.duration = duration
    t.elapsed = 0
    t.callback = callback
    t.active = true
    t.update = updateEvery

    table.insert(timers, t)
end

function Timer.update(dt)
    for i = #timers, 1, -1 do
        if timers[i].active then
            timers[i]:update(dt)
        end
    end
end

return Timer
