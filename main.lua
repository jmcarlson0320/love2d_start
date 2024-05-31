require 'src/dependencies'

function love.load()
    Lowres.init(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT)
    x = 0
    y = 0
end

function love.update(dt)
    Input:getInput()

    if Input['left'] then
        x = x - 1
    end

    if Input['right'] then
        x = x + 1
    end

    if Input['up'] then
        y = y - 1
    end

    if Input['down'] then
        y = y + 1
    end

    if Input['exit'] then
        love.event.quit()
    end

    Input:clear()
end

function love.draw()
    Lowres.beginDraw()
    Lowres.print('abcdefghijklmnop\nqrstuvwxyz', x, y)
    Lowres.print('josh')
    Lowres.print('carlson')

    Lowres.print('this is at the tippy top', 0, 0)
    Lowres.endDraw()
end
