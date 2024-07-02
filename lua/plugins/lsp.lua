require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

-- 可用的LSP服务器: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls", "pylyzer", "cmake"
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 设置mason lspconfig后，您可以通过lspcnfig设置服务器
-- lua_ls
require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}
-- clangd
require("lspconfig").clangd.setup {
  capabilities = capabilities,
}
-- pylyzer
require("lspconfig").pylyzer.setup {
  capabilities = capabilities,
}
-- cmake-language-server
require("lspconfig").cmake.setup {
  capabilities = capabilities,
}
