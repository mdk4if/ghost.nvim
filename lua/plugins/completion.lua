return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" }, -- Lazy-load on insert or cmdline mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline", -- Add cmdline completion
      "saadparwaiz1/cmp_luasnip",
      "dnnr1/lorem-ipsum.nvim",
      "hrsh7th/cmp-emoji",
      "gitaarik/nvim-cmp-toggle", {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load() -- Load snippets lazily

      -- Helper function for tab navigation
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      -- Simplified kind icons (using minimal set for clarity)
      local kind_icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "󰆪",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "󰏗",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "󰕘",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "󰕚",
        Constant = "󰏿",
        Struct = "󰆼",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰊄",
      }

      cmp.setup({
        enabled = function()
          -- Disable in comments and certain filetypes
          local context = require("cmp.config.context")
          return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
              and vim.bo.buftype ~= "prompt"
        end,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Only confirm explicit selections
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = kind_icons[vim_item.kind] or "?"
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              luasnip = "[Snip]",
              buffer = "[Buf]",
              path = "[Path]",
              cmdline = "[Cmd]",
            })[entry.source.name] or "[Other]"
            return vim_item
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp",   max_item_count = 10 },
          { name = "nvim_lua" },
          { name = "luasnip",    max_item_count = 5 },
          { name = "buffer",     max_item_count = 5 },
          { name = "path" },
          { name = "lorem_ipsum" },
          { name = "emoji" },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          ghost_text = { hl_group = "Comment" }, -- Softer ghost text
        },
      })

      -- Cmdline completion setup
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" }, { name = "cmdline" } }),
      })
    end,
  },
vim.api.nvim_set_keymap('n', '<leader>co', ':NvimCmpToggle<CR>', { noremap = true, silent = true })
}

