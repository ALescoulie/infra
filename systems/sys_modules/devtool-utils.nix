{pkgs, ...}:

{
  # Development pkgs

  environment.systemPackages = with pkgs; [
    git
    gh
    vim
    texlive.combined.scheme-full
    nixfmt
    poetry
    (python3.withPackages (ps: [
      ps.numpy
      ps.matplotlib
      ps.pandas
    ]))
  ];
}
