return {
  "jdhao/better-escape.vim",
  event = "InsertEnter",
  config = function()
    vim.g.better_escape_shortcut = { "jk", "kj", "jj" }
    vim.g.better_escape_interval = 100
  end,
}
