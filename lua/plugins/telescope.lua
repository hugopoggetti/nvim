return {
  "nvim-telescope/telescope.nvim",
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-telescope/telescope-symbols.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim" },
    },
  },
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            -- prompt_position = "top",
            width = 0.8,
            height = 0.8,
            preview_width = 0.5,
          },
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.delete_buffer,
            ["<esc>"] = actions.close,
            ["kj"] = actions.close,
          },
        },
      },
    })
    vim.keymap.set({ "n", "v", "s" }, "<leader>H", "<cmd>Telescope help_tags<cr>", {})
    vim.keymap.set({ "n", "v", "s" }, "<leader>m", "<cmd>Telescope commands<cr>", {})
    vim.keymap.set(
      { "n", "v", "s" },
      "<leader>v",
      '<CMD>lua require"utils.telescope-project".project_files()<CR>',
      { noremap = true, silent = true }
    )
    vim.keymap.set({ "n", "v", "s" }, "<leader>f", "<cmd> Telescope find_files<cr>", {})
    vim.keymap.set({ "n", "v", "s" }, "<leader>b", "<cmd>Telescope file_browser<cr>", {})
    vim.keymap.set({ "n", "v", "s" }, "<leader>r", "<cmd>Telescope grep_string<cr>", {})
    vim.keymap.set({ "n", "v", "s" }, "<leader>g", "<cmd>Telescope live_grep<cr>", {})
  end,
}
