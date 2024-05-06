local push = require "lib/push"
require "src/game"

VIRTUAL_WIDTH = 320
VIRTUAL_HEIGHT = 240

-- this is the scale factor for virtual pixels
SCALE = 2

message = "this is a message"

function love.load()
    -- graphics settings for pixelated retro look
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setLineStyle('rough')

    -- window settings
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, VIRTUAL_WIDTH * SCALE, VIRTUAL_HEIGHT * SCALE)

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
