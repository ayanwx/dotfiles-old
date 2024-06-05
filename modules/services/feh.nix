{ ... }:
{
  systemd.user.services.feh = {
    enable = true;
    serviceConfig.Restart = "always";
    serviceConfig.ExecStart = "/bin/sh /home/ayanw/.fehbg";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
  };
}
