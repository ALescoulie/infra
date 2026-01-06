{config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        temurin-bin-21
        temurin-bin-8
        temurin-bin-17
      ];
    })
  ];
}
