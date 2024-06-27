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
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim' -- 主题
  use {
    'nvim-lualine/lualine.nvim',  -- 状态栏
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 状态栏图标
  }
  use {
    'nvim-tree/nvim-tree.lua',  -- 文档树
    requires = {
      'nvim-tree/nvim-web-devicons', -- 文档树图标
    }
  }
  use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口
  use "nvim-treesitter/nvim-treesitter" -- 语法高亮
  use "p00f/nvim-ts-rainbow" -- 配合treesitter，不同括号颜色区分
  use {
    "williamboman/mason.nvim",	-- 轻松安装和管理LSP服务器、DAP服务器、linters和formatters。
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }
    -- 自动补全
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径

  use "numToStr/Comment.nvim" -- gcc和gc注释
  use "windwp/nvim-autopairs" -- 自动补全括号

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" -- 左则git提示

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }

-- ==================================
  -- Debugger
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  -- use {
  --   {
  --     'mfussenegger/nvim-dap',
  --     setup = [[require('config.dap_setup')]],
  --     config = [[require('config.dap')]],
  --     requires = 'jbyuki/one-small-step-for-vimkind',
  --     wants = 'one-small-step-for-vimkind',
  --     cmd = { 'BreakpointToggle', 'Debug', 'DapREPL' },
  --   },
  --   {
  --     'rcarriga/nvim-dap-ui',
  --     requires = 'nvim-dap',
  --     wants = 'nvim-dap',
  --     after = 'nvim-dap',
  --     config = function()
  --       require('dapui').setup()
  --     end,
  --   },
  -- }
  --

--   Linter静态代码分析工具
  use 'mfussenegger/nvim-lint'

-- dashboard-nvim -- neovim的Fancy和Blazing快速启动屏幕插件
  use {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- configurations

        -- theme = 'hyper',
        -- config = {
          -- header --type is table def
          --   shortcut = {
          --   -- action can be a function type
          --   { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
          -- },
          -- packages = { enable = true }, -- show how many plugins neovim loaded
          -- -- limit how many projects list, action when you press key or enter it will run this action.
          -- -- action can be a functino type, e.g.
          -- -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
          -- project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
          -- mru = { limit = 10, icon = 'your icon', label = '', cwd_only = false },
          -- footer = {}, -- footer
          -- },

        theme = 'doom',
        config = {
          header = {"this is dashboard."},
          center = {
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Find File',
              desc_hl = 'String',
              key = 'b',
              keymap = 'SPC f f',
              key_hl = 'Number',
              key_format = ' %s', -- `%s` will be substituted with value of `key`
              action = 'lua print(2)',
            },
            {
              icon = ' ',
              desc = 'Find Dotfiles',
              key = 'f',
              keymap = 'SPC f d',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua print(3)'
            },
        },
        footer = {},
      }
    }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }
-- ==================================

  if packer_bootstrap then
    require('packer').sync()
  end
end)
