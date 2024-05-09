local BaseState = {}

function BaseState:new()
    return setmetatable({}, {__index = self})
end

function BaseState:update() end
function BaseState:render() end
function BaseState:enter() end
function BaseState:exit() end

return BaseState
