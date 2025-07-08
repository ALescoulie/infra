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
  ];
}

