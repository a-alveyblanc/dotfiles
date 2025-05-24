return({
    "lervag/vimtex",
    "nvim-lualine/lualine.nvim",
    "akinsho/toggleterm.nvim",

    -- themes
    "navarasu/onedark.nvim",
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", name = "catppuccin", opts = {}, priority = 1000 },

    { "folke/todo-comments.nvim", opts = {} },
    { "folke/lazydev.nvim", ft = "lua", },

    { "j-hui/fidget.nvim", opts = {} },

    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
      },
      lazy = false, -- neo-tree will lazily load itself
      ---@module "neo-tree"
      ---@type neotree.Config?
      opts = {
        -- fill any relevant options here
      },
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        }
    },

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
          'nvim-telescope/telescope-file-browser.nvim',
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
})
