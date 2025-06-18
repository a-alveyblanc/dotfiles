-- require('onedark').setup({
--     style = 'dark',
--
--     code_style = {
--         comments = 'italic',
--         keywords = 'bold',
--         functions = 'bold,italic',
--     },
--
--     diagnostics = {
--         darker = true,
--         undercurl = true,
--         background = true,
--     },
-- })
-- vim.cmd.colorscheme('onedark')

-- vim.cmd.colorscheme('tokyonight-storm')

require("catppuccin").setup({
    flavour = "auto",
    background = {
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
        comments = { "italic", },
        conditionals = { "bold", },
        loops = { "bold", },
        functions = { "bold", "italic" },
        keywords = { "bold", },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = { "italic", },
        types = { "italic", },
        operators = {},
        -- misc = {},
    },
    -- color_overrides = {
    --     mocha = {
    --         base = "#000000",
    --         mantle = "#000000",
    --         crust = "#000000",
    --     },
    -- },
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})
vim.cmd.colorscheme("catppuccin")
