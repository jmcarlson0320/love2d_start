game = {}

function game:init()
end


function game:update(dt)
end

function game:draw()
    love.graphics.rectangle('fill', 10, 10, 10, 10)
    love.graphics.points(mouse.x, mouse.y)
    love.graphics.print(message, mouse.x, mouse.y)
end
