{ pkgs, ... }: {
  hardware.bluetooth.enable = true;
  # services.blueman.enable = true;


  services.xserver = {
    enable = true;
    layout = "tr";
    # desktopManager.xfce.enable = true;
    # desktopManager.pantheon.enable = true;
    desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;
    # displayManager.gdm = {
    #   enable = true;
    #   wayland = false;
    # };
    xkbOptions = "eurosign:e";
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-terminal
    # gnomeExtensions.dash-to-dock
    # gnome.gnome-tweaks
    # gnome.gnome-shell-extensions
    # gnomeExtensions.random-wallpaper
    # gnomeExtensions.workspace-indicator
    # gnomeExtensions.caffeine
    # whitesur-gtk-theme
    # whitesur-icon-theme
    # nordic
    # orchis-theme
    # tela-icon-theme
    # gnomeExtensions.gsconnect
    # gnomeExtensions.wireguard-vpn-extension
    # gnomeExtensions.wireguard-indicator-2
    # graphite-gtk-theme
  ];


  console = {
    font = "Lat2-Terminus16";
    keyMap = "trq";
  };

  # Setting time zone
  time.timeZone = "Europe/Athens";

  # Locale related settings
  i18n.defaultLocale = "en_US.UTF-8";

}
