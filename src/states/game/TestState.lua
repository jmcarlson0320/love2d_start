local TestState = BaseState:new()

function TestState:new()
    local this = {}

    this.ball = Ball:newBall(100, 100, -50, -20)
    
    this.boomTimer = Timer.recurring(1, function()
        Event:trigger('boom')
    end, 5)
    Timer.remove(this.boomTimer)
    Timer.install(this.boomTimer)

    return setmetatable(this, {__index = self})
end

function TestState:update(dt)
    self.ball:update(dt)

    if keyboardPressed['b'] then
        stateMachine:change('default')
    end

    if keyboardReleased['x'] then
        Event:trigger('boom')
    end

    if keyboardPressed['space'] then
        self.boomTimer:reset()
        self.boomTimer:start()
    end

end

function TestState:render()
    self.ball:render()
    love.graphics.print('this is testState render')

    if self.boomTimer.complete then
        love.graphics.print('done!!', 200, 200)
    else
        love.graphics.print('waiting....', 200, 200)
    end
end

function TestState:enter(new_movement)
    if not new_movement then return end
    self.ball.x = new_movement[1] or 50
    self.ball.y = new_movement[2] or 50
    self.ball.dx = new_movement[3] or 50
    self.ball.dy = new_movement[4] or 50
end

return TestState
