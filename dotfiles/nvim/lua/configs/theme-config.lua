require('onedark').setup({
    style = 'dark',

    code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'bold,italic',
    },

    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },
})
vim.cmd.colorscheme('onedark')
