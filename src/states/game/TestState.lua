local TestState = BaseState:new()

function TestState:new()
    local testState = {}

    testState.ball = Ball:newBall(100, 100, -50, -20)

    return setmetatable(testState, {__index = self})
end

function TestState:update(dt)
    self.ball:update(dt)

    if keyboardPressed['b'] then
        stateMachine:change('default')
    end
end

function TestState:render()
    self.ball:render()
    love.graphics.print('this is testState render')
end

return TestState
