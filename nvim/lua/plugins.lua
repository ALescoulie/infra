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
    -- Notes
    {
      "obsidian-nvim/obsidian.nvim",
      version = "*", -- use latest release, remove to use latest commit
      ---@module 'obsidian'
      ---@type obsidian.config
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {
        checkbox = {
          enabled = true,
          unchecked = { icon = '󰄱 ' },
          checked = { icon = '󰱒 ' },
        },
      },
    },
    {
      "3rd/image.nvim",
      opts = {
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown" }, -- your obsidian notes are markdown filetype
            resolve_image_path = function(document_path, image_path, fallback)
              -- try normal relative/absolute resolution first
              local default_path = fallback(document_path, image_path)
              if vim.uv.fs_stat(default_path) then
                return default_path
              end

              -- fall back to the vault's attachment folder
              local vault_root = vim.fn.expand("~/vaults") -- matches your obsidian.nvim workspace path
              local attachment_folder = "Attachments" -- CHANGE to match your actual Obsidian setting
              return vault_root .. "/" .. attachment_folder .. "/" .. image_path
            end,
          },
        },
        max_width = 100,
        max_height = 12,
        max_width_window_percentage = math.huge,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = true,
      },
    },
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
      'jedrzejboczar/possession.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
}


