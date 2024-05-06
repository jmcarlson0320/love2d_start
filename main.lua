local push = require "push"

VIRTUAL_WIDTH = 480
VIRTUAL_HEIGHT = 270

-- how many "real" pixels make up a virtual pixel
-- setting of 4 == "fullscreen windowed"
SCALE = 2

function love.load()
    -- graphics settings for pixelated retro look
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setLineStyle('rough')

    -- window settings
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, VIRTUAL_WIDTH * SCALE, VIRTUAL_HEIGHT * SCALE)

    -- mouse settings
    love.mouse.setVisible(false)
end

function love.update(dt)
    x, y = love.mouse.getPosition()

    -- use scale factor to scale mouse coordinates
    x = x / SCALE
    y = y / SCALE
end

function love.draw()
    -- low-rez drawing using push library
    push:start()
    love.graphics.clear()
    love.graphics.rectangle('fill', 10, 10, 10, 10)

    -- add a translation to draw calls so points land in the middle of a pixel
    love.graphics.translate(0.5, 0.5)
    love.graphics.points(0, 0, VIRTUAL_WIDTH - 1, 0, VIRTUAL_WIDTH - 1, VIRTUAL_HEIGHT - 1, 0, VIRTUAL_HEIGHT - 1)
    love.graphics.points(x, y)
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
