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
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    'nvim-telescope/telescope-fzy-native.nvim',

    -- completion
    {'neoclide/coc.nvim', branch = 'release'},

    -- UI
    'preservim/nerdtree',
    'Xuyuanp/nerdtree-git-plugin',
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    'luochen1990/rainbow',

    -- Theme
    'Mofiqul/adwaita.nvim'
  }
