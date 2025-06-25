return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP completion capabilities
    "folke/neodev.nvim", -- Enhanced Lua development
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Configure neodev before lua_ls
    require("neodev").setup({
      library = { plugins = { "nvim-dap", "neotest" }, types = true },
    })

    -- Centralized on_attach function
    local on_attach = function(client, bufnr)
      vim.notify("LSP " .. client.name .. " attached to buffer " .. bufnr, vim.log.levels.INFO)

      -- Keymap helper function
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = desc })
      end

      -- LSP keymaps
      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
      map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
      map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
      map("n", "K", vim.lsp.buf.hover, "Show hover")
      map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "Show signature help")
      map("n", "gr", vim.lsp.buf.references, "Find references")
      map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, "Format buffer")
      map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostics")
      map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
      map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")

      -- Additional LSP features
      if client.supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
      if client.supports_method("textDocument/codeLens") then
        vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
          buffer = bufnr,
          callback = vim.lsp.codelens.refresh,
        })
        vim.lsp.codelens.refresh()
      end
    end

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●", -- Custom diagnostic prefix
        severity = { min = vim.diagnostic.severity.WARN }, -- Show warnings and above
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
      update_in_insert = false,
      float = { border = "rounded", source = "always" },
      severity_sort = true,
    })

    -- Centralized LSP server configurations
    local servers = {
      html = {},
      cssls = {
        filetypes = { "css", "scss", "less" },
        settings = {
          css = {
            validate = true,
            lint = {
              unknownProperties = "ignore",
            },
          },
          scss = {
            validate = true,
            lint = {
              unknownProperties = "ignore",
            },
          },
          less = {
            validate = true,
            lint = {
              unknownProperties = "ignore",
            },
          },
        },
      },
      -- denols = {
      --   cmd = { "deno", "lsp" },
      --   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      --   root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "package.json"),
      --   init_options = {
      --     enable = true,
      --     lint = true,
      --     unstable = false,
      --   },
      --   settings = {
      --     deno = {
      --       enable = true,
      --       suggest = {
      --         imports = {
      --           hosts = {
      --             ["https://deno.land"] = true,
      --           },
      --         },
      --       },
      --     },
      --   },
      -- },
      emmet_language_server = {
        filetypes = {
          "html",
          "css",
          "scss",
          "less",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "svelte",
          "jsx",
          "tsx",
        },
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
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            completion = { callSnippet = "Replace" },
          },
        },
        on_init = function(client)
          vim.notify("lua_ls initialized for " .. (client.workspace_folders and client.workspace_folders[1] and client.workspace_folders[1].name or "unknown"), vim.log.levels.INFO)
          return true
        end,
        on_error = function(err)
          vim.notify("lua_ls error: " .. vim.inspect(err), vim.log.levels.ERROR)
        end,
      },
    }

    -- Setup all servers
    for server, config in pairs(servers) do
      config.capabilities = capabilities
      config.on_attach = on_attach
      lspconfig[server].setup(config)
    end
  end,
}
