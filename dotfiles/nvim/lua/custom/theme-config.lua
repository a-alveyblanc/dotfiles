require("onedark").setup({
    style = 'dark', -- dark, darker, warm, warmer, light 
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
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
