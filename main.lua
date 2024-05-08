local push = require "lib/push"

Timer = require "src/Timer"
Ball = require "src/Ball"
game = require "src/game"

SCALE = 2
VIRTUAL_WIDTH = 320
VIRTUAL_HEIGHT = 240
WINDOW_WIDTH = VIRTUAL_WIDTH * SCALE
WINDOW_HEIGHT = VIRTUAL_HEIGHT * SCALE

function love.load()
    -- graphics settings for pixelated retro look
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setLineStyle('rough')

    -- window settings
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT)

    -- mouse settings
    love.mouse.setVisible(false)
    mouse = {x = 0, y = 0}

    -- initialize font
    defaultFont = love.graphics.newFont('/fonts/font.ttf', 8)
    love.graphics.setFont(defaultFont)

    -- initialize game logic
    game:init()
end

function love.update(dt)
    local x, y = love.mouse.getPosition()
    mouse.x = x / SCALE
    mouse.y = y / SCALE

    -- update timers
    Timer.update(dt)

    -- update game logic
    game:update(dt)
end

function love.draw()
    -- low-rez drawing using push library
    push:start()
    -- render game
    game:draw()
    push:finish()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'r' then
        love.event.quit('restart')
    end
end
