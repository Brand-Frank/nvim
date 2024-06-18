vim.g.mapleader = " "	-- 空格键

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "ww", "<ESC>")	-- 在编辑时输入 ww 退出编辑

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
-- <C-w>c	关闭当前窗口。
-- <C-w>o	仅保留当前窗口，关闭其他窗口，效果等同于:only命令（关闭除了当前窗口之外的所有其他窗口）

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

keymap.set("n", "<C-Left>", ":tabpre<CR>")	-- Ctrl+左方向键		切换到上一个标签页
keymap.set("n", "<C-Right>", ":tabnext<CR>")	-- Ctrl+右方向键		切换到下一个标签页

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
