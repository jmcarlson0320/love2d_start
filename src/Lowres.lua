local Lowres = {}

function Lowres:init(vWidth, vHeight, sWidth, sHeight)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setLineStyle('rough')
    love.window.setMode(sWidth, sHeight, {
        fullscreen = false,
        centered = true
    })
    self.canvas = love.graphics.newCanvas(vWidth, vHeight)
    self.scale = sWidth / vWidth
end

function Lowres:beginDraw()
    love.graphics.setCanvas(self.canvas)
    love.graphics.clear()
end

function Lowres:endDraw()
    love.graphics.setCanvas()
    love.graphics.draw(self.canvas, 0, 0, 0, self.scale, self.scale)
end

return Lowres
