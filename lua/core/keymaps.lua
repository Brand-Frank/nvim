vim.g.mapleader = " "   -- 空格键

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "ww", "<ESC>")  -- 在编辑时输入 ww 退出编辑

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer缓冲区  -- 不起作用
-- keymap.set("n", "<C-L>", ":bnext<CR>")
-- keymap.set("n", "<C-H>", ":bprevious<CR>")

-- 切换tab标签页
keymap.set("n", "<C-Left>", ":tabpre<CR>")    -- Ctrl+左方向键  切换到上一个标签页
keymap.set("n", "<C-Right>", ":tabnext<CR>")  -- Ctrl+右方向键  切换到下一个标签页

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Dashboard
keymap.set("n", "<leader>d", ":Dashboard<CR>")

-- WhichKey
keymap.set("n", "<leader>w", ":WhichKey<CR>")

-- nvim-dap & nvim-dap-ui
keymap.set('n', '<F5>', function() require('dap').continue() end)
keymap.set('n', '<F10>', function() require('dap').step_over() end)
-- keymap.set('n', '<F11>', function() require('dap').step_into() end)
keymap.set('n', '<F4>', function() require('dap').step_into() end)
keymap.set('n', '<F12>', function() require('dap').step_out() end)
keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)  -- 设置断点
keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)    -- <leader>dh
keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end)  -- <leader>dp
keymap.set('n', '<Leader>df', function()  -- <leader>df
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
keymap.set('n', '<Leader>ds', function()  -- <leader>ds
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- trouble.nvim
keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")  -- Diagnostics (Trouble)
keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")  -- Buffer Diagnostics (Trouble)
keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>")  -- Symbols (Trouble)
keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")--LSP Definitions/references/..(Trouble)
keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>")  -- Location List (Trouble)
keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")   -- Quickfix List (Trouble)
