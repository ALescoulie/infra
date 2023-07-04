{pkgs, ...}:

{
  # Development pkgs
  environment.systemPackages = with pkgs; [
    git
    gh
    vim
    vscode
    texlive.combined.scheme-full
    nixfmt
    (python3.withPackages (ps: [
      ps.numpy
      ps.matplotlib
      ps.pandas
    ]))
  ];
}