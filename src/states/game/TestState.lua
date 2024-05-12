local TestState = BaseState:new()

function TestState:new()
    local newState = {}

    newState.ball = Ball:newBall(100, 100, -50, -20)

    return setmetatable(newState, {__index = self})
end

function TestState:update(dt)
    self.ball:update(dt)

    if input['restart'] then
        love.event.quit('restart')
    end

    if input['exit'] then
        love.event.quit()
    end
end

function TestState:render()
    self.ball:render()
    love.graphics.print('this is testState render')
end

return TestState
