{ pkgs, ... }: {
  security.sudo.wheelNeedsPassword = false;
  users.users = {
    necdet = {
      isNormalUser = true;
      description = "necdet";
      extraGroups = [ "wheel" "adbusers" ];
      shell = pkgs.zsh;
    };
  };
  environment.shells = [ pkgs.zsh ];
  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}
