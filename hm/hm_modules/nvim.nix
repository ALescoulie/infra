{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
      nvim-autopairs
      nvim-cmp
      {
        plugin = nvim-treesitter.withAllGrammars;
        config = ''
          packadd! nvim-treesitter
        '';
      }
      nvim-ts-rainbow2
      tokyonight-nvim
    ];
  }; 
}

