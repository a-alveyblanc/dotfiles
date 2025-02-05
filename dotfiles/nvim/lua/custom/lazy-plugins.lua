require('lazy').setup({

  -- latex
  'lervag/vimtex',

  -- themes
  'navarasu/onedark.nvim',
  'olivercederborg/poimandres.nvim',
  'gbprod/nord.nvim',

  -- git related plugins
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- qol
  'nvim-tree/nvim-tree.lua',     -- better file explorer
  'nvim-tree/nvim-web-devicons', -- better icons
  'akinsho/toggleterm.nvim',     -- used for floating terminal
  'folke/which-key.nvim',        -- show keybinds related to current key combo
  'nvim-lualine/lualine.nvim',   -- better statusline
  'numToStr/Comment.nvim',       -- block comments
  'tpope/vim-sleuth',            -- autodetect tabstop/shiftwidth


  -- plugins that require extra stuff when being installed
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },

  {
    "startup-nvim/startup.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  {
    'epwalsh/obsidian.nvim',
    dependencies = "nvim-lua/plenary.nvim",
    version = "*",
    lazy = true,
    ft = "markdown"
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },

      'folke/neodev.nvim',
      'mfussenegger/nvim-lint',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
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
}, {})
