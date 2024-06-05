{ ... }:
{

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.wallpaper.mode = "scale";
    windowManager.bspwm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  xdg.portal.lxqt.enable = true;
  xdg.portal.config.common.default = [ "gtk" ];

  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
  };
}
