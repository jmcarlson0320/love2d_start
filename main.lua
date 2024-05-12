Timer = require 'lib/Timer'
Event = require 'lib/Event'

Lowres = require 'src/Lowres'
Input = require 'src/Input'
StateMachine = require 'src/StateMachine'
BaseState = require 'src/states/BaseState'

Keymap = require 'src/Keymap'
TestState = require 'src/states/game/TestState'
Ball = require 'src/Ball'

SCALE = 3
VIRTUAL_WIDTH = 320
VIRTUAL_HEIGHT = 240
WINDOW_WIDTH = VIRTUAL_WIDTH * SCALE
WINDOW_HEIGHT = VIRTUAL_HEIGHT * SCALE

function love.load()
    Lowres:init(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT)

    lowresFont = love.graphics.newFont('/fonts/font.ttf', 8)
    love.graphics.setFont(lowresFont)

    baseState = BaseState:new()
    testState = TestState:new()

    stateMachine = StateMachine:new{
        ['default'] = function() return baseState end,
        ['test'] = function() return testState end
    }
    stateMachine:change('test')

    Event:on('boom', function()
        print('the event occurred')
    end)

    boom_counter = 0
    Event:on('boom', function()
        boom_counter = boom_counter + 1
    end)
end

function love.update(dt)
    Input:getInput()
    Timer.update(dt)
    stateMachine:update(dt)

    if input['restart'] then
        love.event.quit('restart')
    end

    if input['exit'] then
        love.event.quit()
    end

    Input:clearKeyboard()
end

function love.draw()
    Lowres:beginDraw()
    stateMachine:render()
    Lowres:endDraw()
end
