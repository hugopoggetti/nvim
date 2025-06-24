return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  dependencies = {
    "rafamadriz/friendly-snippets",
    "moyiz/blink-emoji.nvim",
    "L3MON4D3/LuaSnip",
  },

  -- use a release tag to download pre-built binaries
  version = "1.*",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = { preset = "luasnip" },
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
      ["<C-p>"] = { "accept", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-j>"] = { "select_next", "fallback_to_mappings" },
      ["<A-1>"] = {
        function(cmp)
          cmp.accept({ index = 1 })
        end,
      },
      ["<A-2>"] = {
        function(cmp)
          cmp.accept({ index = 2 })
        end,
      },
      ["<A-3>"] = {
        function(cmp)
          cmp.accept({ index = 3 })
        end,
      },
      ["<A-4>"] = {
        function(cmp)
          cmp.accept({ index = 4 })
        end,
      },
      ["<A-5>"] = {
        function(cmp)
          cmp.accept({ index = 5 })
        end,
      },
      ["<A-6>"] = {
        function(cmp)
          cmp.accept({ index = 6 })
        end,
      },
      ["<A-7>"] = {
        function(cmp)
          cmp.accept({ index = 7 })
        end,
      },
      ["<A-8>"] = {
        function(cmp)
          cmp.accept({ index = 8 })
        end,
      },
      ["<A-9>"] = {
        function(cmp)
          cmp.accept({ index = 9 })
        end,
      },
    },
    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    -- (Default) Only show the documentation popup when manually triggered
    -- completion = { documentation = { auto_show = false } },
    completion = {
      documentation = {
        auto_show = false,
        -- scrollbar = false,
        window = {
          -- border = "rounded",
          winblend = 0,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
          -- columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
        },
        -- border = "rounded",
        winblend = 0,
        -- scrollbar = false,
      },
    },

    -- completion.menu.draw.columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
    -- Why not ?
    signature = { enabled = true },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "emoji" },
      -- Emoji for md
      providers = {
        -- Path completion
        path = {
          opts = {
            get_cwd = function(_)
              return vim.fn.getcwd()
            end,
          },
        },
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- Tune by preference
          opts = {
            insert = true, -- Insert emoji (default) or complete its name
            ---@type string|table|fun():table
            trigger = function()
              return { ":" }
            end,
          },
          should_show_items = function()
            return vim.tbl_contains(
              -- Enable emoji completion only for git commits and markdown.
              -- By default, enabled for all file-types.
              { "gitcommit", "markdown" },
              vim.o.filetype
            )
          end,
        },
      },
    },
    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
  cmdline = {
    keymap = { preset = "inherit" },
    completion = { menu = { auto_show = true } },
  },
}
