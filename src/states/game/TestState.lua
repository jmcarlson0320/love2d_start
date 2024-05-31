local TestState = BaseState:new()

local startX, startY = 0, 0
local endX, endY = 100, 100
local duration = 1.0

local x, y = startX, startY
local elapsedTime = 0

local ball = Ball:newBall(100, 100, -50, -20)

function TestState:new()
    local newState = {}
    return setmetatable(newState, {__index = self})
end

function TestState:update(dt)
    local t = math.min(elapsedTime / duration, 1)
    x = startX + (endX - startX) * t
    y = startY + (endY - startY) * t
    elapsedTime = elapsedTime + dt

    if Input['restart'] then
        love.event.quit('restart')
    end

    if Input['exit'] then
        love.event.quit()
    end
end

function TestState:render()
    love.graphics.ellipse('fill', x, y, 10, 10)
    love.graphics.print('this is testState render')
end

return TestState
