# 🎨 seoul256.nvim

<img width="1260" alt="Screen Shot 2021-06-01 at 5 22 20 PM" src="https://user-images.githubusercontent.com/71196912/120392089-0073c180-c2fe-11eb-9614-d9d957dc1674.png">

## ✨ Features

seoul256.nvim is meant to be a modern low-contrast colorscheme written in lua for NeoVim that supports a lot of the new features
added to NeoVim like built-in LSP and [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)

- Supported plugins:

  - [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
  - [Lsp Saga](https://github.com/glepnir/lspsaga.nvim)
  - [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
  - [Git Gutter](https://github.com/airblade/vim-gitgutter)
  - [git-messenger](https://github.com/rhysd/git-messenger.vim)
  - [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
  - [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - [Nvim-Tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
  - [NERDTree](https://github.com/preservim/nerdtree)
  - [vim-which-key](https://github.com/liuchengxu/vim-which-key)
  - [Indent-Blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
  - [WhichKey](https://github.com/liuchengxu/vim-which-key)
  - [Dashboard](https://github.com/glepnir/dashboard-nvim)
  - [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
  - [Lualine](https://github.com/hoob3rt/lualine.nvim)
  - [Neogit](https://github.com/TimUntersberger/neogit)
  - [vim-sneak](https://github.com/justinmk/vim-sneak)
  - [Noise.nvim](https://github.com/folke/noice.nvim)

- Ability to change background on sidebar-like windows like Nvim-Tree, Packer, terminal etc.

- Added functions for live theme switching without the need to restart NeoVim

## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install via your favourite package manager:

```lua
-- If you are using lazy.nvim
{"RRRRRm/seoul256.nvim"}
```

```vim
" If you are using Vim-Plug
Plug 'RRRRRm/seoul256.nvim'
```

```lua
-- If you are using Packer
use 'RRRRRm/seoul256.nvim'
```

## 🚀 Usage

Enable the colorscheme:

```vim
"Vim-Script:
colorscheme seoul256
```

```lua
--Lua:
require('seoul256')
-- or:
vim.g.colors_name = 'seoul256'
```

To enable the `seoul256` theme for `Lualine`, simply specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'seoul256'
    -- ... your lualine config
  }
}
```

## ⚙️ Configuration

| Option                      | Default | Description                                                                             |
| --------------------------- | ------- | --------------------------------------------------------------------------------------- |
| seoul256_italic_comments    | `false` | Make comments italic                                                                    |
| seoul256_italic_keywords    | `false` | Make keywords italic                                                                    |
| seoul256_italic_functions   | `false` | Make functions italic                                                                   |
| seoul256_italic_string      | `true`  | Make string italic                                                                      |
| seoul256_italic_variables   | `false` | Make variables and identifiers italic                                                   |
| seoul256_contrast           | `true`  | Make sidebars and popup menus like nvim-tree and telescope have a different background  |
| seoul256_borders            | `false` | Enable the border between verticaly split windows visable                               |
| seoul256_disable_background | `false` | Disable the setting of background color so that NeoVim can use your terminal background |
| seoul256_hl_current_line    | `true`  | Enable highlighting for the current line                                                |

```lua
-- Example config in lua
vim.g.seoul256_italic_comments = true
vim.g.seoul256_italic_keywords = true
vim.g.seoul256_italic_functions = true
vim.g.seoul256_italic_variables = false
vim.g.seoul256_contrast = true
vim.g.seoul256_borders = false
vim.g.seoul256_disable_background = false
vim.g.seoul256_hl_current_line = true

-- Load the colorscheme
require('seoul256')
```

```vim
" Example config in Vim-Script
let g:seoul256_italic_comments = v:true
let g:seoul256_italic_keywords = v:true
let g:seoul256_italic_functions = v:true
let g:seoul256_italic_variables = v:false
let g:seoul256_contrast = v:true
let g:seoul256_borders = v:false
let g:seoul256_disable_background = v:false
let g:seoul256_hl_current_line = v:true

-- Load the colorsheme
colorscheme seoul256
```

# 🗺️ Roadmap

Since I can't find a job and have nothing else to do now and I really really like this theme, I will actively maintain this branch.

- [ ] Support light theme
- [ ] Dynamically generate accent colors that just simply darker or lighter
- [ ] Find a way to change options in running
- [ ] Add option to adjust contrast
- [ ] Add option to adjust base brightness

Also, I will continue to add plug-in support. If anyone has any ideas, please feel free to report issues.

# 🙏 Thanks

This fork is based on [the work of shaunsingh](https://github.com/shaunsingh/seoul256.nvim)
 which is also based off of the [seoul256 Theme](https://github.com/junegunn/seoul256.vim) for Vim , thanks to them for bringing this beautiful theme to NeoVim.
