require("onedark").setup({
    style = 'dark',               -- dark, darker, warm, warmer, light
    transparent = false,          -- Show/hide background
    term_colors = true,           -- Change terminal color as per the selected
                                  -- theme style
    ending_tildes = true,         -- Show the end-of-buffer tildes. By default 
                                  -- they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    toggle_style_key = "<leader>ts",
    toggle_style_list = {'dark', 'light'},

    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    }
})

require("onedark").load()

-- require('poimandres').setup({})
-- vim.cmd('colorscheme poimandres')
-- vim.cmd('colorscheme elflord')

--- {{{ doom one setup

-- vim.g.doom_one_cursor_coloring = false
-- vim.g.doom_one_cursor_coloring = false
-- vim.g.doom_one_terminal_colors = true
-- vim.g.doom_one_italic_comments = false
-- vim.g.doom_one_enable_treesitter = true
-- vim.g.doom_one_diagnostics_text_color = false
-- vim.g.doom_one_transparent_background = false
-- vim.g.doom_one_pumblend_enable = false
-- vim.g.doom_one_pumblend_transparency = 20
-- vim.g.doom_one_plugin_neorg = true
-- vim.g.doom_one_plugin_barbar = false
-- vim.g.doom_one_plugin_telescope = true
-- vim.g.doom_one_plugin_neogit = true
-- vim.g.doom_one_plugin_nvim_tree = true
-- vim.g.doom_one_plugin_dashboard = true
-- vim.g.doom_one_plugin_startify = true
-- vim.g.doom_one_plugin_whichkey = true
-- vim.g.doom_one_plugin_indent_blankline = true
-- vim.g.doom_one_plugin_vim_illuminate = true
-- vim.g.doom_one_plugin_lspsaga = false
-- vim.cmd('colorscheme doom-one')

--- }}}
