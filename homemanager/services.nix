{ config, pkgs, ... }:
{
  systemd.user.services.cliphist = {
    Unit = {
      Description = "Cliphist Clipboard Manager";
      After = [ "graphical.target" ];
    };
    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}