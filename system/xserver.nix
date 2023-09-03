{pkgs, ...}: {
  hardware.bluetooth.enable = true;

  services.xserver = {
    enable = true;
    layout = "tr";
    desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;

    xkbOptions = "eurosign:e";
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-terminal
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
