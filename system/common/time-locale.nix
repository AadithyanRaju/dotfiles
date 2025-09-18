{ config, pkgs, ... }:

{
  time = {
    timeZone = "Asia/Kolkata";
    #timeZone = "Asia/Dubai";
    hardwareClockInLocalTime = true;
  };
  services.timesyncd.enable = true;

  services.timesyncd.servers = [
    "time.google.com"
    "time1.google.com"
    "time2.google.com"
    "time3.google.com"
    "time4.google.com"
  ];

  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
