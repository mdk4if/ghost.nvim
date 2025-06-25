
# Neovim Configuration

Welcome to my Neovim configuration repository! This setup is designed to enhance productivity with a modern, modular, and highly customizable environment for coding, writing, and more. Below, you'll find an overview of the configuration, installation instructions, and details about the features and plugins included.

## Overview

This Neovim configuration leverages Lua for configuration files, providing a clean and efficient setup. It includes a variety of plugins for code completion, LSP support, UI enhancements, and more, all managed through the `lazy.nvim` package manager. The configuration is organized into logical groups such as options, keymaps, and plugins, making it easy to maintain and extend.

### Directory Structure
```
nvim/
├── init.lua
├── lazy-lock.json
├── lua
│   ├── custom.lua
│   ├── keymaps.lua
│   ├── options.lua
│   ├── config
│   │   └── lazy.lua
│   └── plugins
│       ├── autopairs.lua
│       ├── autosave.lua
│       ├── colorscheme.lua
│       ├── completion.lua
│       ├── imageclip.lua
│       ├── livePreview.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── markview.lua
│       ├── mason.lua
│       ├── noice.lua
│       ├── oil.lua
│       ├── snacks.lua
│       ├── treesitter.lua
```

## Features

- **Modular Configuration**: Organized into separate Lua files for options, keymaps, and plugins.
- **Plugin Management**: Uses `lazy.nvim` for lazy-loading and efficient plugin management.
- **Enhanced UI**: Custom statusline with `lualine.nvim`, theme support with `tokyonight.nvim`, and Markdown preview with `markview.nvim`.
- **Code Completion**: Powered by `nvim-cmp` with LSP and snippet support via `LuaSnip`.
- **LSP Support**: Configured with `nvim-lspconfig` for multiple languages including Lua, Python, HTML, CSS, and more.
- **Productivity Tools**: Includes auto-pairs, auto-save, image pasting, live preview, and a powerful file explorer with `oil.nvim`.
- **Custom Keymaps**: Intuitive mappings for navigation, window management, and plugin interactions.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/nvim-config.git ~/.config/nvim
   cd ~/.config/nvim
   ```

2. **Execute nvim in terminal**:
   Ensure you have Neovim installed (version 0.9 or higher recommended). Install the required plugins by running Neovim and letting `lazy.nvim` handle the setup:
   ```bash
   nvim
   ```

   The first launch will automatically download and install the plugins.

3. **Optional Font**:
   For the best experience, install a Nerd Font (e.g., FiraCode Nerd Font) and set it in the `options.lua` file if using GUI apps like [Neovide](https://neovide.dev/):
   ```lua
   opt.guifont = "FiraCode Nerd Font:h12"
   ```

4. **Customize**:
   Edit `custom.lua` to add your personal configurations or preferences.

## Usage

- **Launch Neovim**: Run `nvim` from the terminal.
- **Keybindings**: Use `<Space>` as the leader key. Check `keymaps.lua` for a full list of custom mappings.
- **Plugin Commands**: Explore commands like `:LivePreview start` or `<leader>p` for image pasting in Markdown files.

## Contributing

Feel free to fork this repository, make improvements, and submit pull requests. Issues and feature requests are also welcome!

## Acknowledgments

- Thanks to the Neovim community for the amazing ecosystem.
- Special thanks to the developers of [Folke](https://github.com/folke) for `lazy.nvim`, `snacks.nvim` and `tokyonight.nvim`.
