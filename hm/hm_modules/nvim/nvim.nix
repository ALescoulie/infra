{ config, lib, pkgs, ... }:

{
  programs.neovim = {
      enable = true;
      extraLuaPackages = ps: [ ps.magick ];
      extraPackages = [
        pkgs.imagemagick
        pkgs.ghostscript # Required only when rendering PDF files
      ];
      # ... other config
  };
 
  home.packages = with pkgs; [ 
    nodejs-slim
    fortran-language-server
    haskellPackages.fast-tags
    haskellPackages.haskell-language-server
    haskellPackages.hoogle
    haskellPackages.ghci-dap
    haskellPackages.haskell-dap
    haskellPackages.haskell-debug-adapter
    ghc
  ];
}

