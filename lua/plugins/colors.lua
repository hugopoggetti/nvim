return {
  {
    "ellisonleao/gruvbox.nvim",
    requires = { "rktjmp/lush.nvim" },
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.opt.background = "dark"
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_bold = 1
      vim.g.gruvbox_termcolors = 256
      vim.g.gruvbox_contrast_dark = "soft"
      vim.g.gruvbox_contrast_light = "hard"
      vim.g.gruvbox_invert_selection = 0
      -- vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        mirage = false,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.opt.background = "dark"
      vim.g.tokyonight_style = "night"
      vim.g.tokyonight_italic_comments = true
      vim.g.tokyonight_italic_keywords = true
      vim.g.tokyonight_italic_functions = false
      vim.g.tokyonight_italic_variables = false
      vim.g.tokyonight_transparent = false
      vim.g.tokyonight_hide_inactive_statusline = true
      vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
    end,
  },
  {
    "vague2k/vague.nvim",
    priority = 1000,
    config = function()
      require("vague").setup({ transparent = true })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function() end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({ compile = true })
    end,
  },
  { "Mofiqul/dracula.nvim", priority = 1000 },
}
