local Input = {}

-- per frame input state. the rest of the game code gets input from this table.
-- ex: if input['up'] then playerJump() end
input = {}

-- per frame keyboard state
local keyState = {
    ['pressed'] = {},
    ['released'] = {},
    ['down'] = {}
}

-- call at the beginning of the frame to map keyboard presses to game inputs
function Input:getInput()
    for k, v in pairs(Keymap) do
        input[k] = keyState[v.mode][v.key]
    end
end

-- clear the per-frame keyboard state
function Input:clearKeyboard()
    keyState['pressed'] = {}
    keyState['released'] = {}
end

-- callbacks for love2d key events
function love.keypressed(key)
    keyState['pressed'][key] = true
    keyState['down'][key] = true
end

function love.keyreleased(key)
    keyState['released'][key] = true
    keyState['down'][key] = false
end

return Input
