local is_whitespace = function()
    -- returns true if the character under the cursor is whitespace.
    local col = vim.fn.col('.') - 1
    local line = vim.fn.getline('.')
    local char_under_cursor = string.sub(line, col, col)

    if col == 0 or string.match(char_under_cursor, '%s') then
        return true
    else
        return false
    end
end

local is_comment = function()
    local context = require("cmp.config.context")
    return context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment")
end

local cmp = require("cmp")
cmp.setup({
    enabled = function()
        if is_comment() or is_whitespace() then
            return false
        else
            return true
        end
    end,
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path", option = {trailing_slash = true } },
        { name = "cmdline" },
    },

    -- TODO add supertab 
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
})
