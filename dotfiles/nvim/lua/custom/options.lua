vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd.colorscheme('onedark')
--require('doom').set() 

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

vim.o.tw = 80
vim.o.colorcolumn = "81"
--vim.cmd('hi ColorColumn guibg=grey ctermbg=grey')

vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = true
vim.o.incsearch = true

vim.wo.number = true
vim.wo.signcolumn = 'yes'

--vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,noselect'

vim.o.foldmethod = 'marker'
vim.o.foldlevel = 1

vim.o.laststatus = 2
vim.o.conceallevel = 0

vim.o.showmatch = true
vim.o.wildmenu = true
vim.o.showcmd = true