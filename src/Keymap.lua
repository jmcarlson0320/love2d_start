local Keymap = {
    [ 'up' ]  = { key = 'w', mode = 'pressed' },
    ['down']  = { key = 's', mode = 'down' },
    ['left']  = { key = 'a', mode = 'released' },
    ['right'] = { key = 'd', mode = 'pressed' },
    ['restart'] = { key = 'r', mode = 'pressed' },
    ['exit'] = { key = 'escape', mode = 'pressed' }
}

return Keymap
