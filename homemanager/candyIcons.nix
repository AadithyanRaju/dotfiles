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
  home.file = {
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
}
