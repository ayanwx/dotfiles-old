{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    #nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji
    (nerdfonts.override {
      fonts = [
        "FantasqueSansMono"
        "3270"
      ];
    })
  ];
}
