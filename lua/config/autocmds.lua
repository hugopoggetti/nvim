-- change result with leader tt
function ToggleBackground()
  if vim.opt.background:get() == "dark" then
    vim.opt.background = "light"
    vim.cmd.colorscheme("rose-pine-dawn")
  else
    vim.opt.background = "dark"
    vim.cmd.colorscheme("gruvbox")
  end
end

-- Select correspondig theme at start (Works on gnome)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
    local theme = handle:read("*a")
    handle:close()

    theme = theme and theme:gsub("['\n]", ""):match("^%s*(.-)%s*$") or ""

    if theme == "default" then
      vim.opt.background = "light"
      vim.cmd.colorscheme("rose-pine-dawn")
    else
      vim.opt.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end
  end,
})
