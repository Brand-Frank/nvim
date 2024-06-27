vim.o.hidden = true
require('nvim-terminal').setup({
  window = {
    -- Do `:h :botright` for more information
    -- NOTE: width or height may not be applied in some "pos"
    position = 'botright',

    -- Do `:h split` for more information
    split = 'sp',

    -- Width of the terminal
    width = 50,

    -- Height of the terminal
    height = 15,
  },

    -- keymap to disable all the default keymaps
    disable_default_keymaps = false,

    -- keymap to toggle open and close terminal window
    toggle_keymap = '<leader>;',

    -- increase the window height by when you hit the keymap
    window_height_change_amount = 2,

    -- increase the window width by when you hit the keymap
    window_width_change_amount = 2,

    -- keymap to increase the window width
--     increase_width_keymap = '<leader><leader>+',  -- default
    increase_width_keymap = '<leader>tw+',

    -- keymap to decrease the window width
--     decrease_width_keymap = '<leader><leader>-',  -- default
    decrease_width_keymap = '<leader>tw-',

    -- keymap to increase the window height
--     increase_height_keymap = '<leader>+',  -- default
    increase_height_keymap = '<leader>th+',

    -- keymap to decrease the window height
--     decrease_height_keymap = '<leader>-',  -- default
    decrease_height_keymap = '<leader>th-',

    terminals = {
      -- keymaps to open nth terminal
--       {keymap = '<leader>1'},  -- default
      {keymap = '<leader>t1'},
--       {keymap = '<leader>2'},  -- default
      {keymap = '<leader>t2'},
--       {keymap = '<leader>3'},  -- default
      {keymap = '<leader>t3'},
--       {keymap = '<leader>4'},  -- default
      {keymap = '<leader>t4'},
--       {keymap = '<leader>5'},  -- default
      {keymap = '<leader>t5'},
    },
})
