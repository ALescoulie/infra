{ config, lib, packages, ... }:

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
    ];
    extraConfig = ''
      source ${pkgs.vimPlugins.vim-plug}/plug.vim
     
      ${builtins.readFile ./init.nvim}
    '';
  }; 

  programs.neovim = {
    coc = {
      enable = true;
      settings = builtins/fromJSON (builtins/reafFile ./coc-settings.json);
    };

    extraConfig = ''
      ${builtins.readFile ./ide.nvim}
    '';

    plugins = with pkgs.vimPlugsins; [
      coc-nvim
      coc-rust-analyzer
      coc-tsserver
      coq_nvim
      editorconfig-nvim
      goyo-vim
      limelight-vim
      nergcommenter
      taglist-vim
      vim-fugitive
      vim-gitgutter
      vim-terraform
      vim-test
      vimtex
    ]
  };

  home.packages = with pkgs; [ nodejs nodePackages.npm ];
}

