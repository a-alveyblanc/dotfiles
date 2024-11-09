require('peek').setup({
   auto_load = true,
   close_on_bdelete = true,
   syntax = true,
   theme = 'light',
   update_on_change = true,
   app = 'browser',
   filetype = { 'markdown' },
   throttle_at = 200000,
   throttle_time = 'auto',
})

vim.keymap.set('n', '<leader>mdp', '<cmd>PeekOpen<cr>', {})
vim.keymap.set('n', '<leader>mdc', '<cmd>PeekClose<cr>', {})
