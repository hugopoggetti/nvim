vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Keeping the cursor centered.
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy and past in register
vim.keymap.set("v", "<leader>y", '"+ygv', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Escape and save changes.
vim.keymap.set({ "s", "i", "n", "v" }, "<C-s>", "<esc>:w<cr>", { desc = "Exit insert mode and save changes." })
vim.keymap.set({ "s", "i", "n", "v" }, "<C-S-s>", "<esc>:wa<cr>", { desc = "Exit insert mode and save all changes." })

-- Indent lines in visual
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

-- Déplacement de plusieurs lignes en mode visuel
vim.keymap.set("n", "<C-j>", ":move .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":move .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<C-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- add semocolon at the end of a line
vim.keymap.set("n", "<leader>;", "A;<Esc>", { noremap = true, silent = true })
-- highlight the current word on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- git WorkTree keymaps
vim.keymap.set("n", "<leader>ws", ":Telescope git_worktree git_worktrees<CR>")
vim.keymap.set("n", "<leader>wc", ":Telescope git_worktree create_git_worktree<CR>")

-- change theme with tt
vim.keymap.set("n", "<leader>tt", ":lua ToggleBackground()<CR>", { noremap = true, silent = true })

-- jump to pairs file
vim.keymap.set("n", "<leader>h", ":lua require('utils.jump').jump_pair()<CR>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Diffview: open diff view" })
--
-- vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Diffview: close" })
--
-- vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "Diffview: file history" })
--
-- vim.keymap.set("n", "<leader>gH", ":DiffviewFileHistory<CR>", { desc = "Diffview: repo history" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "n", "v", "s" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v", "s" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v", "s" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v", "s" }, "<Right>", "<Nop>")
vim.keymap.set({ "i", "n", "v", "s" }, "<C-c>", "<Esc>")
