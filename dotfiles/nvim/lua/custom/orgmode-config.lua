require('orgmode').setup({
  org_agenda_files = {
    '~/org/*.org',
    '~/Dropbox/org/*.org',
  },
  org_default_notes_file = {
    '~/org/notes/*.org',
    '~/Dropbox/org/notes/*.org'
  }
})

-- keymaps
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>ot', ':OrgTodo<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>oa', ':OrgAgenda<cr>', opts)
