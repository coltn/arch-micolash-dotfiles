--add leader function
vim.g.mapleader = " "

--go into "explore" mode
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

--set 'leader y' to yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

