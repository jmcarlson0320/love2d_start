local Timer = {}

-- table of installed timers
local timers = {}

-- unique timer id
local nextID = 0

local function newID()
    local id = nextID
    nextID = nextID + 1
    return id
end

-- 
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

-- general timer constructor
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

-- public interface starts here

-- uninstall a timer, uninstalled timers are no longer updated by Timer.update()
function Timer.uninstall(timer)
    if timers[timer.id] then
        table.remove(timers, timer.id)
    end
end

-- install a timer, installed timers are updated by Timer.update()
function Timer.install(timer)
    if not timers[timer.id] then
        timers[timer.id] = timer
    end
    timer:reset()
end

-- creates and installs a new single-shot timer
function Timer.once(duration, callback)
    return newTimer(duration, callback, 1)
end

-- creates and installs a new recurring timer
function Timer.recurring(duration, callback, iterations)
    iterations = iterations or 0
    return newTimer(duration, callback, iterations)
end

-- update all installed timers
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
