require 'src/dependencies'

function love.load()
    Lowres:init(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT)

    stateMachine = StateMachine:new{
        ['test'] = function() return TestState:new() end
    }
    stateMachine:change('test')
end

function love.update(dt)
    Input:getInput()
    Timer.update(dt)
    stateMachine:update(dt)
    Input:clearKeyboard()
end

function love.draw()
    Lowres:beginDraw()
    stateMachine:render()
    Lowres:endDraw()
end
