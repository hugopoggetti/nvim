require("config.autocmds")

vim.env.PATH = "/home/hugo/.ghcup/bin:" .. vim.env.PATH
vim.g.netrw_banner = 0 -- unset deflaut ntrwn banner
vim.opt.termguicolors = true -- Active TrueColor (rendu 24-bit)
vim.opt.guicursor = "" -- set fat cursorline
vim.g.mapleader = " " -- set leader key to space
vim.g.maplocalleader = "-" -- set file local leader key to backslash
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- line number with relative
vim.opt.numberwidth = 1 -- line numbers gutter autowidth
-- vim.opt.cursorline = true          -- highlight current line
vim.opt.cursorline = false -- highlight current line
vim.opt.showmatch = false -- dont jump to pair bracket
vim.opt.autoread = true -- reload files when changes happen outside vim
vim.opt.autowrite = true -- auto write buf on certain events
vim.opt.hidden = true -- keep change in buffer when quitting window
vim.opt.swapfile = false -- disable swap files
-- vim.opt.scrolloff = 1              -- line padding when scrolling
vim.opt.textwidth = 0 -- when line wrap occurs
vim.opt.wrapmargin = 0 -- disable auto line wrapping
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.g.c_syntax_for_h = 1 -- .h file use C filetype instead of C++
vim.opt.encoding = "utf-8" -- utf-8 encoding
vim.opt.shellredir = ">" -- don"t inclue stderr when reading a command
-- intuitif split opening
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = true

--tab
vim.opt.expandtab = true -- tab to space
vim.opt.tabstop = 4 -- tab size
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- file search
vim.opt.ignorecase = true -- case insensitive
vim.opt.smartcase = true
vim.opt.hlsearch = true -- match highlight
vim.opt.incsearch = true

vim.g.c_syntax_for_h = 1
-- status
vim.opt.laststatus = 3 -- always a statusline (all window)
vim.opt.showcmd = true -- show current partial command in the bottom right
vim.opt.showmode = true -- dont show current mode (i.e --INSERT--)

vim.opt.ch = 1 -- make command line invisible when not typing command

vim.g.indent_blankline_enabled = false

vim.opt.list = false

-- disable horizontal scrolling
vim.opt.wrap = true
vim.opt.linebreak = true
