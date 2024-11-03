{ ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
      protocol = "2";
    };
    ports = [ 22 ];
  };
}
