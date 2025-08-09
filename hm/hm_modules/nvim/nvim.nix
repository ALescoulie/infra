{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
    ];

  home.packages = with pkgs; [ 
    nodejs
    nodePackages.npm
    fortran-language-server
    haskellPackages.fast-tags
    haskellPackages.haskell-language-server
    haskellPackages.hoogle
    haskellPackages.ghci-dap
    haskellPackages.haskell-dap
    haskellPackages.haskell-debug-adapter
    ghc
    luajitPackages.luarocks-nix
    lua
  ];
}

