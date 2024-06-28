-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- 插件管理

  -- === Theme / Statusline / Tabline ===
  use 'folke/tokyonight.nvim'     -- tokyonight主题
  use {
    'nvim-lualine/lualine.nvim',  -- 状态栏
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 状态栏图标
  }
  use "akinsho/bufferline.nvim"   -- buffer分割线

  -- === File Explorer Tree ===
  use {
    'nvim-tree/nvim-tree.lua',        -- 文档树
    requires = {
      'nvim-tree/nvim-web-devicons',  -- 文档树图标
    }
  }

  -- === Syntax Highlighting ===
  use "nvim-treesitter/nvim-treesitter" -- 语法高亮
  use "p00f/nvim-ts-rainbow"            -- 配合treesitter，不同括号颜色区分

  -- === LSP/DAP/Linter/Formatter ====
  use {
    "williamboman/mason.nvim",            -- 安装和管理LSP/DAP/linters/formatters
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }

  -- === Auto Completion ===
  use "hrsh7th/nvim-cmp"      -- 自动补全
  use "hrsh7th/cmp-nvim-lsp"  -- nvim-cmp的lsp源
  use "hrsh7th/cmp-path"      -- nvim-cmp的文件路径源
  use "windwp/nvim-autopairs" -- 自动补全括号

  -- === Snippets ===
  use "L3MON4D3/LuaSnip"          -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"  -- luasnip的补全
  use "rafamadriz/friendly-snippets"

  -- === Fuzzy Finder ===
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件查找与检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- === Others ===
  use "numToStr/Comment.nvim"           -- gcc和gc注释
  use "lewis6991/gitsigns.nvim"         -- 左则git提示
  use "christoomey/vim-tmux-navigator"  -- 用ctl-h/j/k/l来定位窗口

-- ==================================
  -- Debugger
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  -- Linter静态代码分析工具
  use 'mfussenegger/nvim-lint'

  -- dashboard-nvim
  use {
    'nvimdev/dashboard-nvim', requires = {'nvim-tree/nvim-web-devicons'}
  }

  -- which-key
  use "folke/which-key.nvim"

  -- nvim-terminal
  use 's1n7ax/nvim-terminal'

  -- qucikfix
  use {'kevinhwang91/nvim-bqf', ft = 'qf'}
-- ==================================

  if packer_bootstrap then
    require('packer').sync()
  end
end)
