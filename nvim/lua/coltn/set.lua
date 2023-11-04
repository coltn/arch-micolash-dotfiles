--vim keybinds

--set cursor to fatty
vim.opt.guicursor = ""

--set line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--set indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

--colours
vim.opt.termguicolors = true

--other
vim.opt.scrolloff = 8
--vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

vim.g.mapleader = " "



