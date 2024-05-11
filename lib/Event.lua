local Event = {}

local eventCallbacks = {}

function Event:on(eventType, callback)
    eventCallbacks[eventType] = eventCallbacks[eventType] or {}
    table.insert(eventCallbacks[eventType], callback)
end

function Event:trigger(eventType, eventData)
    if eventCallbacks[eventType] then
        for _, callback in pairs(eventCallbacks[eventType]) do
            callback(eventData)
        end
    end
end

return Event
