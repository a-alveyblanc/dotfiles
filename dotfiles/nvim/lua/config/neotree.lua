require("neo-tree").setup({
    sources = {
        "filesystem",
        "git_status",
        "buffers",
        "document_symbols",
    },

    source_selector = {
        winbar = true,
        statusline = false,
    },

    window = {
        width = 28
    },
})
