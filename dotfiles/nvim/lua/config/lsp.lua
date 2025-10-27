local function on_attach(_, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    local builtins = require("telescope.builtin")

    map("n", "gd", builtins.lsp_definitions)
    map("n", "gD", vim.lsp.buf.declaration)
    map("n", "gi", builtins.lsp_implementations)
    map("n", "gr", builtins.lsp_references)

    map("n", "K", vim.lsp.buf.hover)
    map("n", "<C-k>", vim.lsp.buf.signature_help)

    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
    map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)

    map("n", "<leader>ws", builtins.lsp_dynamic_workspace_symbols)
    map("n", "<leader>ds", builtins.lsp_document_symbols)
    map("n", "<leader>ts", builtins.treesitter)
end

local servers = {
    html = { filetypes = { "html", "twig", "hbs" }, },
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { 'vim' },
                disable = { 'missing-fields' },
            },
        },
    },
    pyright = {
        settings = {
            python = {
                pythonPath = vim.fn.exepath("python3")
            }
        }
    },
    rust_analyzer = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_enable = false,
})

for _, server_name in ipairs(vim.tbl_keys(servers)) do
    vim.lsp.enable(server_name)
    vim.lsp.config(server_name, {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = servers[server_name],
    })
end

-- servers not available through mason
vim.lsp.enable("mlir_lsp_server")
vim.lsp.config("mlir_lsp_server", {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.lsp.enable("clangd")
vim.lsp.config("clangd", {
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--enable-config",
        "--completion-style=detailed",
    },
    filetypes = {
        "c", "cpp", "objc", "objcpp", "cuda", "cu"
    }
})
