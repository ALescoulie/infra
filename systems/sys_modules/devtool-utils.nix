{pkgs, ...}:

{
  # Development pkgs
  virtualisation.lxd.enable = true;
  environment.systemPackages = with pkgs; [
    git
    gh
    vim
    vscode
    texlive.combined.scheme-full
    nixfmt
    docker
    poetry
    (python3.withPackages (ps: [
      ps.numpy
      ps.matplotlib
      ps.pandas
    ]))
  ];
}
