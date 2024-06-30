require("toggleterm").setup({
   size = 20,
   open_mapping = [[<C-w>t]],
   hide_numbers = true,
   shade_terminals = false,
})

vim.keymap.set('n', '<C-w>f', '<cmd>2ToggleTerm direction=float<cr>',
   {noremap = true, silent = true})
