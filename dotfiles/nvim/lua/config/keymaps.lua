local opts = { noremap = true, silent = true }
local t_opts = { silent = true }

-- {{{ useful commands

vim.keymap.set('n', '<leader><Space>', '<cmd>nohlsearch<cr>', opts)
vim.keymap.set('n', '<leader>n', '<cmd>Neotree<cr>', opts)
vim.keymap.set('n', '<leader>N', '<cmd>Neotree toggle<cr>', opts)
vim.keymap.set('n', '<leader>p', '<cmd>so<cr>', opts)
vim.keymap.set('n', '<leader>e',
    '<cmd>lua vim.diagnostic.open_float()<cr>', opts)

vim.keymap.set('n', '<leader>dv', function()
    vim.diagnostic.config({
        virtual_text = not vim.diagnostic.config().virtual_text
    })
end, { desc = "Toggle virtual text for diagnostics" })

-- }}}

-- {{{ text manipulation

vim.keymap.set('n', 'Y', 'yy', { noremap = true })

-- hang onto text when indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- move text up/down
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('x', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('x', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- do not override data in p register
vim.keymap.set('v', 'p', '"_dP', opts)

-- }}}

-- {{{ split management

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', opts)
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', opts)
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', opts)
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', opts)

vim.keymap.set('n', '<C-Up>', '<cmd>resize -2<cr>', opts)
vim.keymap.set('n', '<C-Down>', '<cmd>resize +2<cr>', opts)
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', opts)
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', opts)

-- }}}

-- {{{ terminal navigation

vim.keymap.set('t', '<C-\\>', '<C-\\><C-N>', t_opts)

-- }}}
