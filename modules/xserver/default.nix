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

  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
  };
}
