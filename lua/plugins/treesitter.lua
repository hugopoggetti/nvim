return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "asm",
        "haskell",
        "c",
        "commonlisp",
        "cpp",
        "fish",
        "glsl",
        "go",
        "json",
        "json5",
        "jsonc",
        "java",
        "javascript",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "meson",
        "odin",
        "python",
        "query",
        "toml",
        "rust",
        "vim",
        "vimdoc",
        "yaml",
        "zig",
        "html",
        "scss",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
        -- [options]
      },
      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = false,
      },
      indent = { enable = false },
      -- TODO: could be neat
      -- incremental_selection = {
      --     enable = true,
      --     keymaps = {
      --         init_selection = "gnn",
      --         node_incremental = "grn",
      --         scope_incremental = "grc",
      --         node_decremental = "grm",
      --     }
      -- }
    })
    vim.cmd([[ highlight link pythonTSKeywordOperator Keyword ]])
  end,
}
