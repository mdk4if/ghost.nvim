-- helper for buffer keymaps
local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = desc })
end

map("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, "Format buffer")

----------------------------------------------------------------
-- 1. Configure servers
----------------------------------------------------------------

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { ".git", "pyproject.toml", "setup.py", "setup.cfg" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

vim.lsp.config("emmet_language_server", {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
  },
  root_markers = { ".git" },
  settings = {
    emmet = {
      showExpandedAbbreviation = "always",
      showAbbreviationSuggestions = true,
      syntaxProfiles = {},
      variables = {},
      excludeLanguages = {},
      preferences = {},
      showSuggestionsAsSnippets = false,
    },
  },
})


-- JavaScript/TypeScript LSP
vim.lsp.config("tsserver", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = { "package.json", "tsconfig.json", ".git" },
})

vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { ".git" },
})

----------------------------------------------------------------
-- 2. Enable all your LSPs
----------------------------------------------------------------
vim.lsp.enable({ "lua_ls", "pyright", "emmet_language_server", "tsserver", "cssls" })



-- Notify when an LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    vim.notify("LSP attached: " .. client.name, vim.log.levels.INFO)
  end,
})
