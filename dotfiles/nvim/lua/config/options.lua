-- vim.o.background = 'dark'
vim.o.termguicolors = true

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

vim.o.tw = 80
vim.o.colorcolumn = "81"

vim.cmd("hi ColorColumn guibg=grey ctermbg=grey")
vim.cmd("hi Comment cterm=italic gui=italic")

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
--vim.o.autoindent = true

--vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = true
vim.o.incsearch = true

vim.wo.number = true
vim.wo.signcolumn = 'yes'

--vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus' -- always copy to system clipboard

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,noselect'

vim.o.foldmethod = 'marker'
vim.o.foldlevel = 1

vim.o.laststatus = 2
vim.o.conceallevel = 2

vim.o.showmatch = true
vim.o.wildmenu = true
vim.o.showcmd = true

-- update changed files automatically
vim.o.autoread = true
vim.api.nvim_create_autocmd(
   { "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
