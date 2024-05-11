local BaseState = {}

function BaseState:new()
    return setmetatable({}, {__index = self})
end

function BaseState:update()
    if keyboardPressed['a'] then stateMachine:change('test', {200, 200, -100, -100}) end
end
function BaseState:render() end
function BaseState:enter() end
function BaseState:exit() end

return BaseState
