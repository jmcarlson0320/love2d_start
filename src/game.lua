local game = {}

local bouncer = Ball:newBall(100, 100, -50, -20)

function game:init()
end

function game:update(dt)
    bouncer:update(dt)
end

function game:draw()
    bouncer:render()
end

return game
