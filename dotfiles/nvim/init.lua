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
require("custom.lazy-plugins")

-- global options
require("custom.options")
require("custom.keymaps")

-- theme
require("custom.theme-config")
require("custom.lualine-config")
require("custom.todo-comments-config")

-- telescope
require("custom.telescope-config")

-- lsp-ish stuff
require("custom.cmp-config")
require("custom.lsp-config")
require("custom.treesitter-config")

-- utility / QoL
require("custom.vimtex-config")
require("custom.git-signs-config")
require("custom.nvim-tree-config")
require("custom.auto-pairs-config")
require("custom.toggleterm-config")
require("custom.nvim-orgmode-config")

-- misc.
require("custom.startup")

vim.cmd('source ~/.config/nvim/vim/*')
vim.lsp.set_log_level("OFF")

-- vim: ts=2 sts=2 sw=2 et foldmethod=marker
