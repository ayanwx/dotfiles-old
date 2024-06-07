{ pkgs, settings, ... }:
{
  systemd.user.services.udiskie = {
    enable = true;
    serviceConfig = {
      Restart = "always";
      ExecStart = "${pkgs.udiskie}/bin/udiskie";
    };
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
  };
  services.udisks2.enable = true;
  environment.systemPackages = [ pkgs.udiskie ];
}
