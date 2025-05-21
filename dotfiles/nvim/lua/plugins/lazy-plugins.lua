return({
    "lervag/vimtex",
    "nvim-lualine/lualine.nvim",
    "akinsho/toggleterm.nvim",
    "navarasu/onedark.nvim",

    {
        "folke/lazydev.nvim",
        ft = "lua",
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        }
    },

    { 'j-hui/fidget.nvim', opts = {} },

    {
        "hrsh7th/cmp-nvim-lsp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
        }
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
          'nvim-lua/plenary.nvim',
          {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
              return vim.fn.executable 'make' == 1
            end,
          },
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
          'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    { "nvim-tree/nvim-tree.lua", opts = {} },
})
