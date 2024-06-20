{ config, lib, pkgs, ... }:

let 


  haskellDapPlugins = with pkgs.haskellPackages; [
    haskell-dap
    ghci-dap
    haskell-debug-adapter

  ];

  pythonDapPlugins = [];

  languageDebugPlugins = 
    haskellDapPlugins ++ 
    pythonDapPlugins;
in
  with lib;
  {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        fzf-vim
        nerdtree
        nerdtree-git-plugin
        rainbow
        vim-airline
        vim-easymotion
        vim-floaterm
        vim-nix
        vim-plug
        vim-sleuth
        tokyonight-nvim
        coc-nvim
        coc-rust-analyzer
        coc-tsserver
        coq_nvim
        editorconfig-nvim
        goyo-vim
        limelight-vim
        nerdcommenter
        taglist-vim
        vim-fugitive
        vim-gitgutter
        vim-terraform
        vim-test
        vimtex
        awesome-vim-colorschemes
        telescope-nvim
        nvim-dap
        nvim-dap-ui
      ] ++ languageDebugPlugins;

      coc = {
        enable = true;
        settings = builtins.fromJSON (builtins.readFile ./coc-settings.json);
      };

      extraConfig = ''
        source ${pkgs.vimPlugins.vim-plug}/plug.vim
       
        ${builtins.readFile ./init.nvim}
        ${builtins.readFile ./ide.nvim}
      '';
    };

    home.packages = with pkgs; [ nodejs nodePackages.npm fortran-language-server haskellPackages.hoogle];
  }

