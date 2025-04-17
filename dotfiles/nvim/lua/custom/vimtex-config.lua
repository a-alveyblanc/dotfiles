-- vimtex
vim.g.vimtex_view_method = 'zathura'

-- latexmk settings
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    build_dir = '',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    options = {
        '-pdf',
        '-shell-escape',
        '-interaction=nonstopmode',
        '-synctex=1',
    },
}

-- tectonic settings
-- vim.g.vimtex_compiler_method = 'tectonic'
-- vim.g.vimtex_compiler_tectonic = {
--    options = {
--       '-X compile',
--       '-Z shell-escape',
--       '--synctex',
--       '--keep-logs',
--    }
-- }

vim.api.nvim_create_autocmd('BufWritePost', {
   pattern = '*.tex',
   callback = function()
      vim.cmd('VimtexCompile')
   end,
})
