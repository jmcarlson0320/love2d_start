game = {}

function game:init()
    bouncer = Ball:newBall(100, 100, -50, -20)
end


function game:update(dt)
    bouncer:update(dt)
end

function game:draw()
    bouncer:render()
end
