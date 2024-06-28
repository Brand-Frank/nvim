vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup ({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
})

-- 记录和组织现存的按键映射
local wk = require("which-key")
wk.register({
  ["<leader>f"] = { name = "+Telescope" },   -- 组名, 按下<leader>f后, 状态栏显示的文字
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "[Telescope] Find File" },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "[Telescope] Live Grep" },
  ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "[Telescope] Buffer" },
  ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "[Telescope] Help Tags" },
})

wk.register({
--   注释掉的部分为快捷键对应的记录，但是因为不太确定是否影响现存的快捷键，所以统一只记录，不和按键绑定
--   ["<leader>d"] = { name = "+DAP"},  -- <leader>d导致DAP信息与Dashboard冲突
--   ["<F4>"] = { "<cmd>DapStepInto<cr>", "[DAP] step into" },
  ["<F4>"] = { "[DAP] step into" },
--   ["<F5>"] = { "<cmd>DapContinue<cr>", "[DAP] continue" },
  ["<F5>"] = { "[DAP] continue" },
--   ["<F10>"] = { "<cmd>DapStepOver<cr>", "[DAP] step over" },
  ["<F10>"] = { "[DAP] step over" },
--   ["<F12>"] = { "<cmd>DapStepOut<cr>", "[DAP] step out" },
  ["<F12>"] = { "[DAP] step out" },
--   ["<leader>b"] = { "<cmd>DapToggleBreakpoint<cr>", "[DAP] toggle_breakpoint" },
  ["<leader>b"] = { "[DAP] toggle_breakpoint" },
  ["<leader>B"] = { "[DAP] set_breakpoint" },
  ["<leader>lp"] = { "[DAP] set_breakpoint(Log point message)" },
--   ["<leader>dr"] = { "function() require('dap').repl.open() end", "[DAP] repl.open" },
--   ["<leader>dl"] = { "function() require('dap').run_last() end", "[DAP] run_last" },
  ["<leader>dr"] = { "[DAP] repl.open" },
  ["<leader>dl"] = { "[DAP] run_last" },
  ["<leader>dh"] = { "[DAP] hover" },
  ["<leader>dp"] = { "[DAP] preview" },
  ["<leader>df"] = { "[DAP] centered_float-frames" },
  ["<leader>ds"] = { "[DAP] centered_float-scopes" },
})

wk.register({
  ["<leader>t"] = { name = "+Terminal[1-5] and Height/Width" },
  ["<leader>t1"] = { "Open terminal 1" },
  ["<leader>t2"] = { "Open terminal 2" },
  ["<leader>t3"] = { "Open terminal 3" },
  ["<leader>t4"] = { "Open terminal 4" },
  ["<leader>t5"] = { "Open terminal 5" },

  ["<leader>th"] = { name = "+Set Window Height"},
  ["<leader>th+"] = { "Increase the window height" },
  ["<leader>th-"] = { "Decrease the window height" },

  ["<leader>tw"] = { name = "+Set Window Width"},
  ["<leader>tw+"] = { "Increase the window width" },
  ["<leader>tw-"] = { "Decrease the window width" },

  ["<leader>;"] = { "Toggle open and close terminal window" },
})
