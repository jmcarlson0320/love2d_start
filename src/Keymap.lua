-- modify with the inputs required by your game.
local Keymap = {
    [ 'up' ]        = {key = 'w',       mode = 'down'},
    ['down']        = {key = 's',       mode = 'down'},
    ['left']        = {key = 'a',       mode = 'down'},
    ['right']       = {key = 'd',       mode = 'down'},
    ['action_1']    = {key = 'k',       mode = 'down'},
    ['action_2']    = {key = 'j',       mode = 'down'},
    ['restart']     = {key = 'r',       mode = 'pressed'},
    ['exit']        = {key = 'escape',  mode = 'pressed'}
}

return Keymap
