local Input = {}

-- per frame keyboard state
Input.keyState = {
    -- keyState['pressed']['inputName'] is true if transition from up -> down
    -- occurred since last frame
    ['pressed'] = {},

    -- keyState['released']['inputName'] is true if transition from down -> up
    -- occurred since last frame
    ['released'] = {},

    -- keyState['down']['inputName'] is true while input is held down
    ['down'] = {}
}

-- Call at the beginning of the frame to map keyboard presses/releases to check
-- game inputs. In your game, use input names as an index.
-- Example:
--      if Input['fire'] then player:fire() end
-- See Keymap.lua for the key map.
function Input:getInput()
    for k, v in pairs(Keymap) do
        self[k] = self.keyState[v.mode][v.key]
    end
end

-- call at the end of the frame to
-- clear the per-frame keyboard state
function Input:clear()
    self.keyState['pressed'] = {}
    self.keyState['released'] = {}
end

-- callbacks for love2d key events
function love.keypressed(key)
    Input.keyState['pressed'][key] = true
    Input.keyState['down'][key] = true
end

function love.keyreleased(key)
    Input.keyState['released'][key] = true
    Input.keyState['down'][key] = false
end

return Input
