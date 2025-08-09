{pkgs, ...}:

{
  # Development pkgs

  environment.systemPackages = with pkgs; [
    git
    gh
    neovim
    nil
    nix-doc
    nix-index
    nix-tree
    texlive.combined.scheme-full
    nixfmt-rfc-style
    poetry
    (python3.withPackages (ps: [
      ps.numpy
      ps.matplotlib
      ps.pandas
    ]))
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
    tree-sitter
    ripgrep
    manix
    fd
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    withNodeJs = true;
  };

}

