local Keymap = {
    [ 'up' ]  = {
        key = 'w',
        mode = 'pressed'
    },
    ['left']  = {
        key = 'a',
        mode = 'released'
    },
    ['down']  = {
        key = 's',
        mode = 'down'
    },
    ['right'] = {
        key = 'd',
        mode = 'pressed'
    },
    ['boom']  = {
        key = 'x',
        mode = 'pressed'
    },
    ['reset'] = {
        key = 'space',
        mode = 'pressed'
    },
    ['restart'] = {
        key = 'r',
        mode = 'pressed'
    },
    ['exit'] = {
        key = 'escape',
        mode = 'pressed'
    }
}

return Keymap
