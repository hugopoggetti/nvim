return {
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    lazy = false,
    priority = 1000,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          -- completion = cmp.config.window.bordered({
          --   scrollbar = false,
          --   winhighlight = "Normal:PmenuBorder,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
          -- }),
          -- documentation = cmp.config.window.bordered({
          --   scrollbar = false,
          --   winhighlight = "Normal:PmenuBorder,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
          -- }),
          completion = {
            scrollbar = false,
          },
          documentation = {
            scrollbar = false,
          },
        },

        view = {
          entries = {
            name = "custom",
            selection_order = "near_cursor",
            follow_cursor = true,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-p>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer", keyword_length = 2 },
          { name = "path" },
        },

        experimental = {
          ghost_text = true,
        },

        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
              nvim_lsp = "[LSP]",
              path = "[PATH]",
              buffer = "[BUF]",
              luasnip = "[SNIP]",
            },
          }),
        },
      })
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
}
