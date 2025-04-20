return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    { "L3MON4D3/LuaSnip", lazy = true },
    { "saadparwaiz1/cmp_luasnip", lazy = true },
    { "rafamadriz/friendly-snippets", lazy = true },
    { "hrsh7th/cmp-nvim-lsp", lazy = true },
    { "hrsh7th/cmp-buffer", lazy = true },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    local kind_icons = {
      Text = "󰊄", Method = "m", Function = "󰊕", Constructor = "",
      Field = "", Variable = "󰫧", Class = "", Interface = "",
      Module = "", Property = "", Unit = "", Value = "",
      Enum = "", Keyword = "󰌆", Snippet = "", Color = "",
      File = "", Reference = "", Folder = "", EnumMember = "",
      Constant = "", Struct = "", Event = "", Operator = "",
      TypeParameter = "󰉺",
    }

    cmp.setup({
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-1),
        ["<C-f>"] = cmp.mapping.scroll_docs(1),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = kind_icons[vim_item.kind] or "?"
          vim_item.menu = ({
            luasnip = "[Snippet]", buffer = "[Buffer]", path = "[Path]",
          })[entry.source.name] or ""
          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer", max_item_count = 5 }, -- Limit buffer suggestions
        { name = "path" },
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        ghost_text = true,
      },
    })
  end,
}
