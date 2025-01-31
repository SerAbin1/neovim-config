vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader = " "

-- Map Ctrl-x to :q
vim.keymap.set('n', '<C-x>', ':q<CR>', { noremap = true, silent = true })

-- Map Ctrl-wx to :wq
vim.keymap.set('n', '<C-w>x', ':wq<CR>', { noremap = true, silent = true })
