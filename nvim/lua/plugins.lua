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
    {
    	"L3MON4D3/LuaSnip",
    	-- follow latest release.
    	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    	-- install jsregexp (optional!).
    	build = "make install_jsregexp",
        dependencies = {
          "rafamadriz/friendly-snippets"
        },
    },
    --'mrcjkb/haskell-snippets.nvim',
    'neovim/nvim-lspconfig', -- may need to set version to 1.8,.0
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',

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
  }
