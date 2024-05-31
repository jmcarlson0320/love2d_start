local StateMachine = {}

function StateMachine.new(states)
    local s = {}
    
    s.states = states or {}
    s.current = BaseState:new()

    return setmetatable(s, {__index = StateMachine})
end

function StateMachine:change(stateName, enterParams)
    assert(self.states[stateName])
    self.current:exit()
    self.current = self.states[stateName]()
    self.current:enter(enterParams)
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end

return StateMachine
