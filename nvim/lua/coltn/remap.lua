--add leader function
vim.g.mapleader = " "

--go into "explore" mode
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

--set 'leader y' to yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

--center cursor while doing half page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--close brackets and shit
vim.keymap.set("i", "[]", "[]<left>")
vim.keymap.set("i", "{}", "{}<left>")
vim.keymap.set("i", "()", "()<left>")
vim.keymap.set("i", "\"\"", "\"\"<left>")

--move line
vim.keymap.set("v", "K", ":move '<-2<CR>zzgv=gv")
vim.keymap.set("v", "J", ":move '>+1<CR>zzgv=gv")
