Ball = {}

local DEFAULT_SIZE = 10

function Ball:newBall(x, y, dx, dy, size)
    local b = {}
    setmetatable(b, {__index = self})
    b.x = x
    b.y = y
    b.dx = dx
    b.dy = dy
    b.size = size or DEFAULT_SIZE
    return b
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    -- collision with left and right edges of screen
    if (self.x < self.size) or (self.x >= VIRTUAL_WIDTH - self.size) then
        self.dx = self.dx * -1
    end

    -- collision with top and bottom edges of screen
    if (self.y < self.size) or (self.y >= VIRTUAL_HEIGHT - self.size) then
        self.dy = self.dy * -1
    end
    
end

function Ball:render()
    love.graphics.ellipse('fill', self.x, self.y, self.size, self.size)
end
