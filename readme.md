## Step to install and config.

1. Install neovim.

2. Create a nvim config directory at '`~/.config/nvim`' or '`C:\Users\inTree\AppData\Local\nvim`'.

3. Install Plugin-Manager like 'Packer.nvim'.

- **Linux**

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
- **Windows**

```bash
git clone https://github.com/wbthomason/packer.nvim\
"$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
Actually in '`C:\Users\inTree\AppData\Local\nvim-data\site\pack\packer\start\packer.nvim`'.

4. Open nvim and execute `:PackerInstall` to install plugins.

5. Fix error.

- *help*: change `nvim/lua/plugins/treesitter.lua` to delete `"help",`.

6. Modify configuration for `keymaps.lua` and `option.lua` on `nvim/lua/core`.

- `ww` to escape "Insert Mode".
- `tabstop` to modify tab width.

For more modfication can be note.

## Plugins( for supplement)

### Mason

- repo: [williamboman/mason.nvim: Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters. (github.com)](https://github.com/williamboman/mason.nvim)

> 在Neovim中，LSP servers、DAP servers、linters和formatters都是为了提升编程效率和代码质量的工具，它们各自扮演着不同的角色：
>
> 1. **LSP (Language Server Protocol) servers**: **语言服务器协议**（LSP）是一种协议，允许编辑器与语言服务器通信，以提供丰富的编程环境特性，如代码补全、跳转到定义、查找引用、重命名、代码格式化等。语言服务器通常是特定于编程语言的，它理解该语言的语义，并为支持LSP的编辑器（如Neovim）提供高级功能。例如，`clangd`用于C/C++，`pylsp`用于Python等。
>
> 2. **DAP (Debug Adapter Protocol) servers**: **调试适配器协议**（DAP）是另一个协议，类似于LSP，但<u>专注于调试功能</u>。它允许编辑器通过标准化的接口与调试适配器交互，提供断点设置、变量查看、步进执行等调试功能。这意味着开发者可以使用统一的接口在不同编程语言和编辑器环境中进行调试，提高了开发工具的通用性和一致性。
>
> 3. **Linters**: Linters是**静态代码分析工具**，用于检查代码中的潜在错误、不符合编码规范的地方以及不良实践。它们可以在编写代码时实时反馈问题，帮助开发者维持代码质量和一致性。例如，`flake8`用于Python，`eslint`用于JavaScript等。配合Neovim的插件，如ALE或LSP，可以在编辑器内直接显示linting错误和警告。
>
> 4. **Formatters**: **代码格式化工具**，用于自动调整代码的布局和样式，确保代码符合一定的格式规范。这对于团队合作尤为重要，因为它可以减少因个人编码风格差异带来的混乱。常见的代码格式化工具有`black`（Python）、`prettier`（支持多种语言）等。Neovim可以配置为在保存文件时自动运行这些格式化工具，保持代码整洁和一致。
>
> 综上所述，这些工具协同工作，使得Neovim成为了一个功能强大的开发环境，不仅提供了智能的代码编辑辅助，还涵盖了调试、代码质量检查及格式化等多个方面，极大提升了开发者的效率和代码质量。

- LSP: [`lspconfig`](https://github.com/neovim/nvim-lspconfig) & [`mason-lspconfig.nvim`](https://github.com/williamboman/mason-lspconfig.nvim)
- DAP: [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) & [`nvim-dap-ui`](https://github.com/rcarriga/nvim-dap-ui)
- Linters: [`null-ls.nvim`](https://github.com/jose-elias-alvarez/null-ls.nvim) or [`nvim-lint`](https://github.com/mfussenegger/nvim-lint)
- Formatters: [`null-ls.nvim`](https://github.com/jose-elias-alvarez/null-ls.nvim) or [`formatter.nvim`](https://github.com/mhartington/formatter.nvim)

### nvim-treesitter

- repo: [nvim-treesitter/nvim-treesitter: Nvim Treesitter configurations and abstraction layer (github.com)](https://github.com/nvim-treesitter/nvim-treesitter)



### nvim-tree

- repo: [nvim-tree/nvim-tree.lua: A file explorer tree for neovim written in lua (github.com)](https://github.com/nvim-tree/nvim-tree.lua)



### nvim-dap

- repo: [mfussenegger/nvim-dap: Debug Adapter Protocol client implementation for Neovim (github.com)](https://github.com/mfussenegger/nvim-dap)





## Troubleshooting

1. ### 运行`:help`或`:h xxx-xxx`等指令时，会出现一堆报错`treesitter/highlighter:Error executing lua，query:invalid node type at position 7 for language...`

![image-20240618154021699](C:\Users\inTree\AppData\Local\nvim\readme.assets\image-20240618154021699.png)

- 参考解决方法：[query: invalid node type at position · Issue #3934 · nvim-treesitter/nvim-treesitter (github.com)](https://github.com/nvim-treesitter/nvim-treesitter/issues/3934)

![image-20240618154229409](C:\Users\inTree\AppData\Local\nvim\readme.assets\image-20240618154229409.png)

即**删除neovim的内置解析器（`D:\Development\Neovim\lib\nvim\parser`）**，之后执行命令后不会再报错。

![image-20240618154443206](C:\Users\inTree\AppData\Local\nvim\readme.assets\image-20240618154443206.png)

**另一种思路：**<u>系统内置解析器</u>和<u>tree-sitter的同名解析器</u>冲突，两者之间有冲突的解析器选择只留其一，这里我是删了系统内置解析器，但是为了预防万一，还是**备份了系统内置的解析器**，以防tree-sitter项目停更。

```bash
PS C:\Users\inTree\AppData\Local\nvim> nvim --version	# 记录neovim的版本
NVIM v0.9.5
Build type: RelWithDebInfo
LuaJIT 2.1.1703942320
Compilation: C:/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/VC/Tools/MSVC/14.29.30133/bin/Hostx64/x64/cl.exe /MD /Zi /O2 /Ob1  -W3 -wd4311 -wd4146 -DUNIT_TESTING -D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -D_WIN32_WINNT=0x0602 -DMSWIN -DINCLUDE_GENERATED_DECLARATIONS -ID:/a/neovim/neovim/.deps/usr/include/luajit-2.1 -ID:/a/neovim/neovim/.deps/usr/include -ID:/a/neovim/neovim/.deps/usr/include -ID:/a/neovim/neovim/build/src/nvim/auto -ID:/a/neovim/neovim/build/include -ID:/a/neovim/neovim/build/cmake.config -ID:/a/neovim/neovim/src -ID:/a/neovim/neovim/.deps/usr/include -ID:/a/neovim/neovim/.deps/usr/include -ID:/a/neovim/neovim/.deps/usr/include -ID:/a/neovim/neovim/.deps/usr/include -ID:/a/neovim/neovim/.deps/usr/include -ID:/a/neovim/neovim/.deps/usr/include -ID:/a/neovim/neovim/.deps/usr/include

   system vimrc file: "$VIM\sysinit.vim"
  fall-back for $VIM: "C:/Program Files (x86)/nvim/share/nvim"

Run :checkhealth for more info
```



