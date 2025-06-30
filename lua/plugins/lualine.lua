return {
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        -- theme = "nord",
        icons_enabled = true,
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        always_divide_middle = true,
      },
    })
  end,
}
