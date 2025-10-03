{ systemSettings, ... }:

{
  services.timesyncd = {
    enable = true;
    servers = [
      "time.google.com"
      "time1.google.com"
      "time2.google.com"
      "time3.google.com"
      "time4.google.com"
    ];
  };
  time = {
    timeZone = systemSettings.timeZone;
    hardwareClockInLocalTime = true;
  };
}