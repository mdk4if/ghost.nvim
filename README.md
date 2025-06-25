# Neovim Configuration

This is a modern, Lua-based Neovim configuration optimized for productivity, speed, and a smooth editing experience. It leverages `lazy.nvim` for plugin management, includes a curated set of plugins for coding, navigation, and UI enhancements, and features custom keymaps and a dashboard for quick access.

## Features

- **Plugin Management**: Uses `lazy.nvim` for efficient, lazy-loaded plugin management to minimize startup time.
- **Coding Enhancements**:
  - Autocompletion with `nvim-cmp` and LSP support (`mason.nvim`, `nvim-lspconfig`).
  - Syntax highlighting and code parsing with `nvim-treesitter`.
  - Auto-pairs (`nvim-autopairs`) and auto-save (`auto-save.nvim`) for seamless editing.
- **Navigation**:
  - File explorer with `oil.nvim`.
  - Fuzzy finding with `telescope.nvim` for files, buffers, and more.
- **UI**:
  - Customizable dashboard (`alpha.nvim`) with an ASCII header and quick-action buttons.
  - Statusline with `lualine.nvim` and `tokyonight-moon` theme for a sleek look.
  - Markdown preview and rendering with `markview.nvim`.
- **Custom Functionality**:
  - `<leader>nf` keymap to prompt for a filename and open it in a new buffer.
  - Optimized plugin configurations for performance.

## Directory Structure

```plaintext
~/.config/nvim/
├── init.lua              # Main entry point
├── lazy-lock.json        # Plugin lockfile for lazy.nvim
├── ftplugin/
│   └── markdown.lua      # Markdown-specific settings
├── lua/
│   ├── keymaps.lua       # Keymap definitions
│   ├── options.lua       # General Neovim options
│   ├── config/
│   │   └── lazy.lua      # lazy.nvim setup
│   ├── plugins/          # Plugin configurations
│   │   ├── autopairs.lua
│   │   ├── autosave.lua
│   │   ├── completions.lua
│   │   ├── image-embed.lua
│   │   ├── lsp.lua
│   │   ├── lualine.lua
│   │   ├── markview.lua
│   │   ├── noice.lua
│   │   ├── oil.lua
│   │   ├── telescope.lua
│   │   ├── tokyonight.lua
│   │   ├── treesitter.lua
│   └── usercommands/     # Custom user commands
│       ├── followlink.lua
│       ├── insertlink.lua
│       └── OpenPDF.lua
```

## Plugins

- **Plugin Manager**: `lazy.nvim`
- **Coding**:
  - `nvim-cmp` (autocompletion)
  - `nvim-lspconfig`, `mason.nvim`, `mason-lspconfig.nvim` (LSP support for Lua and Python)
  - `nvim-treesitter` (syntax highlighting and indentation)
  - `nvim-autopairs` (auto-close brackets, quotes, etc.)
  - `auto-save.nvim` (automatic saving)
- **Navigation**:
  - `telescope.nvim` (fuzzy finder)
  - `oil.nvim` (file explorer)
- **UI/UX**:
  - `alpha.nvim` (dashboard)
  - `lualine.nvim` (statusline)
  - `tokyonight.nvim` (theme)
  - `markview.nvim` (Markdown rendering)
  - `noice.nvim` (enhanced UI for messages and prompts)
  - `img-clip.nvim` (image embedding)
- **Dependencies**:
  - `nvim-tree/nvim-web-devicons` (icons)
  - `nvim-lua/plenary.nvim` (Telescope dependency)

## Installation

1. **Install Neovim**:
   Ensure you have Neovim (v0.9.0 or later) installed.

2. **Clone the Repository**:
   Clone this configuration to your Neovim config directory:
   ```bash
   git clone https://github.com/<your-username>/<your-repo>.git ~/.config/nvim
   ```

3. **Start Neovim**:
   Open Neovim to trigger `lazy.nvim` to install plugins:
   ```bash
   nvim
   ```
   - `lazy.nvim` will automatically download and install all plugins defined in `lua/plugins/`.
   - Monitor the installation with `:Lazy`.

4. **Verify Setup**:
   - Check the dashboard (`alpha.nvim`) on startup.
   - Test keymaps (e.g., `<leader>nf` to open a new file).
   - Ensure plugins like `telescope.nvim` (`:Telescope find_files`) and LSP work.

## Usage

- **Keymaps**:
  - `<leader>nf`: Prompt for a filename and open it in a new buffer.
  - Use `:Telescope keymaps` to explore other keymaps (if you have `telescope.nvim` configured for keymap discovery).
- **Dashboard**:
  - Access quick actions like opening new files, finding files, or editing settings via the `alpha.nvim` dashboard.
- **Plugins**:
  - Use `:Lazy` to manage plugins (install, update, or profile performance).
  - Run `:Mason` to manage LSP servers.
  - Use `:Telescope` commands for navigation (e.g., `:Telescope live_grep`).

## Customization

- **Add Plugins**:
  - Create a new file in `lua/plugins/` (e.g., `myplugin.lua`) and define your plugin spec for `lazy.nvim`.
- **Modify Keymaps**:
  - Edit `lua/keymaps.lua` to add or change keybindings.
- **Change Theme**:
  - Modify `lua/plugins/tokyonight.lua` to use a different `tokyonight` variant or replace with another theme.
- **Optimize Performance**:
  - Use `:Lazy profile` to identify slow plugins.
  - Adjust lazy-loading events in `lua/plugins/*.lua` for faster startup.

## Contributing

Contributions are welcome! If you have suggestions, bug fixes, or new features:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/my-feature`).
3. Commit your changes (`git commit -m "Add my feature"`).
4. Push to the branch (`git push origin feature/my-feature`).
5. Open a pull request.

## Acknowledgements

- Inspired by the Neovim community and plugins like `lazy.nvim`, `telescope.nvim`, and `tokyonight.nvim`.
- Thanks to all plugin authors for their amazing work.

