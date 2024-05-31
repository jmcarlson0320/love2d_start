local Lowres = {}

local FONT_PATH = '/fonts/font.ttf'
local FONT_SIZE = 8

local canvas
local scale
local font

local textPosX = 0
local textPosY = 0
local rowCount = 0

function Lowres.init(vWidth, vHeight, sWidth, sHeight)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setLineStyle('rough')
    love.window.setMode(sWidth, sHeight, {
        fullscreen = false,
        centered = true
    })
    canvas = love.graphics.newCanvas(vWidth, vHeight)
    scale = sWidth / vWidth

    font = love.graphics.newFont(FONT_PATH, FONT_SIZE)
    love.graphics.setFont(font)
end

function Lowres.beginDraw()
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    textPosX = 0
    textPosY = 0
    rowCount = 0
end

function Lowres.endDraw()
    love.graphics.setCanvas()
    love.graphics.draw(canvas, 0, 0, 0, scale, scale)
end

function Lowres.print(str, x, y)
    if x then
        textPosX = x
        rowCount = 0
    end
    if y then
        textPosY = y
        rowCount = 0
    end

    love.graphics.print(str, textPosX, textPosY + rowCount * FONT_SIZE)
    local newlineCount = 0
    for i = 1, #str do
        if str:sub(i, i) == '\n' then
            newlineCount = newlineCount + 1
        end
    end
    rowCount = rowCount + newlineCount + 1
end

return Lowres
