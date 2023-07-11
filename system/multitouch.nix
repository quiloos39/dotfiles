{ ... }: {
  # Enables multi-touch gestures
  services.touchegg.enable = true;
  # environment.systemPackages = with pkgs; [ gnomeExtensions.x11-gestures ];
  services.xserver.libinput.enable = true;
}
