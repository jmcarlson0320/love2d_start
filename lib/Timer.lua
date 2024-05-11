local Timer = {}

local timers = {}

local ID = 0

local function newID()
    ID = ID + 1
    return ID
end

local function start(timer)
    if not timer.active then
        timer.active = true
        print('timer started')
    end
end

local function stop(timer)
    if timer.active then
        timer.active = false
        print('timer stopped')
    end
end

local function reset(timer)
    timer.elapsed = 0
    timer.count = 0
    timer.active = false
    timer.complete = false
end

local function newTimer(duration, callback, iterations)
    local t = {}

    t.duration = duration
    t.elapsed = 0
    t.callback = callback
    t.active = true
    t.id = newID()
    t.iterations = iterations or 0
    t.count = 0
    t.complete = false

    t.start = start
    t.stop = stop
    t.reset = reset

    timers[t.id] = t

    return t
end

function Timer.remove(timer)
    if timers[timer.id] then
        table.remove(timers, timer.id)
    end
end

function Timer.install(timer)
    if not timers[timer.id] then
        timers[timer.id] = timer
    end
    timer:reset()
end

function Timer.once(duration, callback)
    return newTimer(duration, callback, 1)
end

function Timer.recurring(duration, callback, iterations)
    iterations = iterations or 0
    return newTimer(duration, callback, iterations)
end

function Timer.update(dt)
    for id, timer in pairs(timers) do
        if timer.active then
            timer.elapsed = timer.elapsed + dt
            if timer.elapsed >= timer.duration then
                if timer.callback then
                    timer.callback()
                end
                timer.elapsed = timer.elapsed - timer.duration
                timer.count = timer.count + 1
                if timer.iterations ~= 0 and 
                   timer.count >= timer.iterations then 
                    timer.active = false
                    timer.complete = true
                end
            end
        end
    end
end

return Timer
