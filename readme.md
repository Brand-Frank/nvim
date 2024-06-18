## Step to install and config.

1. Install neovim

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

