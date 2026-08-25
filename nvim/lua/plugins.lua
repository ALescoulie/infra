return {
    'tomtom/tcomment_vim',
    'tpope/vim-surround',
    'godlygeek/tabular',
    -- Better functionality for the % motion
    'andymass/vim-matchup',

    'tpope/vim-dispatch',
    'tpope/vim-fugitive',
    'tpope/vim-eunuch',
    'tpope/vim-sleuth',

    'nvim-lua/plenary.nvim',

    -- Telescope
    { 'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'mrcjkb/telescope-manix',
      },
    },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    'nvim-telescope/telescope-fzy-native.nvim',

    -- Treesitter
    
    {
      "nvim-treesitter/nvim-treesitter",
      branch = 'main',
      lazy = 'false',
    },

    -- completion
    'neovim/nvim-lspconfig', -- may need to set version to 1.8,.0
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
      'mrcjkb/rustaceanvim',
      version = '^6', -- Recommended
      lazy = false, -- This plugin is already lazy
    },

    -- UI
    'Xuyuanp/nerdtree-git-plugin',
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-tree.lua',

    -- Theme
    'Mofiqul/adwaita.nvim',
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Debugger
    'mfussenegger/nvim-dap',
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

    -- Testing
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
      }
    },

    -- Haskell tools
    {
      'mrcjkb/haskell-tools.nvim',
      version = '^6', -- Recommended
      lazy = false, -- This plugin is already lazy
    },
    'luc-tielen/telescope_hoogle',
    {
      'nvim-neotest/neotest',
      dependencies = {
        -- ...,
        'mrcjkb/neotest-haskell',
        'nvim-lua/plenary.nvim',
      }
    },
    {
      {'akinsho/toggleterm.nvim', version = "*", config = true}
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {},
    },
    {
      "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
      -- use opts = {} for passing setup options
      -- this is equivalent to setup({}) function
    },
    {
      "j-hui/fidget.nvim",
      opts = {
        -- options
      },
    },
    {
      "nosduco/remote-sshfs.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      opts = {},
    },
  }
