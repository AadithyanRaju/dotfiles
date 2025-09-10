{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    candy-icons
    lxappearance  # optional: GUI tool to preview/change themes
  ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Candy";
      package = pkgs.candy-icons;
    };
  };
}
