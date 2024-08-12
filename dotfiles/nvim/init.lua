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

require("custom.lazy-plugins")
require("custom.theme-config")
require("custom.keymaps")
require("custom.options")
require("custom.telescope-config")
require("custom.treesitter-config")
require("custom.lsp-config")
require("custom.cmp-config")
require("custom.nvim-tree-config")
require("custom.toggleterm-config")
require("custom.orgmode-config")
--require("custom.autoclose")

-- vim: ts=2 sts=2 sw=2 et foldmethod=marker
