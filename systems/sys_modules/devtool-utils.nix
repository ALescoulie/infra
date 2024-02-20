{pkgs, ...}:

{
  # Development pkgs
  virtualisation.lxd.enable = true;
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    git
    gh
    vim
    vscode
    texlive.combined.scheme-full
    nixfmt
    poetry
    (python3.withPackages (ps: [
      ps.numpy
      ps.matplotlib
      ps.pandas
    ]))

    pgadmin4-desktopmode
  ];

  services.postgresql.enable = true;
}
