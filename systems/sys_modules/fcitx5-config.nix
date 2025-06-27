{pkgs, ...}:

{
  i18n.inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.addons = with pkgs; [
        fcitx5-chinese-addons
        fcitx5-gtk
        libsForQt5.fcitx5-qt
      ];
  };
}
