require'nvim-treesitter.configs'.setup {
  -- 添加不同语言
  --ensure_installed = { "vim", "help", "bash", "c", "cpp", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "markdown", "markdown_inline" }, -- one of "all" or a list of languages
  ensure_installed = { "asm", "bash", "c", "c_sharp", "cmake", "cpp", "css", "cpp", "html", "java", "javascript", "json", "kotlin", "lua", "make", "markdown", "markdown_inline", "python", "ruby", "rust", "tsx", "typescript", "vim" }, -- one of "all" or a list of languages

  highlight = { enable = true },
  indent = { enable = true },

  -- 不同括号颜色区分
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
