push = require 'lib/push'

StateMachine = require 'src/StateMachine'
BaseState = require 'src/states/BaseState'
TestState = require 'src/states/game/TestState'

Timer = require 'src/Timer'
Ball = require 'src/Ball'

SCALE = 3
VIRTUAL_WIDTH = 320
VIRTUAL_HEIGHT = 240
WINDOW_WIDTH = VIRTUAL_WIDTH * SCALE
WINDOW_HEIGHT = VIRTUAL_HEIGHT * SCALE

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setLineStyle('rough')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT)

    love.mouse.setVisible(false)
    mousePos = {x = 0, y = 0}
    keyboardPressed = {}

    defaultFont = love.graphics.newFont('/fonts/font.ttf', 8)
    love.graphics.setFont(defaultFont)

    stateMachine = StateMachine:new{
        ['default'] = function() return BaseState:new() end,
        ['test'] = function() return TestState:new() end
    }
    stateMachine:change('test')
end

function love.update(dt)
    local x, y = love.mouse.getPosition()
    mousePos.x = x / SCALE
    mousePos.y = y / SCALE

    Timer.update(dt)

    stateMachine:update(dt)

    keyboardPressed = {}
end

function love.draw()
    push:start()
    stateMachine:render()
    push:finish()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    if key == 'r' then
        love.event.quit('restart')
    end

    keyboardPressed[key] = true
end
