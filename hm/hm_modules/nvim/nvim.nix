{ config, lib, pkgs, ... }:

with lib; {
  
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
    ];

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

  home.packages = with pkgs; [ nodejs nodePackages.npm fortran-language-server ];
}

