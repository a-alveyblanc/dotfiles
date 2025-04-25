local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("configs.lazy-plugins")

-- global options
require("configs.options")
require("configs.keymaps")

-- theme
require("configs.theme-config")
require("configs.lualine-config")
require("configs.todo-comments-config")

-- telescope
require("configs.telescope-config")

-- lsp-ish stuff
require("configs.cmp-config")
require("configs.lsp-config")
require("configs.treesitter-config")

-- utility / QoL
require("configs.vimtex-config")
require("configs.git-signs-config")
require("configs.nvim-tree-config")
require("configs.auto-pairs-config")
require("configs.toggleterm-config")

-- misc.
require("configs.startup")

vim.cmd('source ~/.config/nvim/vim/*')
vim.lsp.set_log_level("OFF")

-- vim: ts=2 sts=2 sw=2 et foldmethod=marker
