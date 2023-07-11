{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = {
    nixpkgs.config.permittedInsecurePackages = [ "electron-12.2.3" ];
  };

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    google-chrome
    vlc
    libreoffice-fresh
    neovim
    vim
    gimp
    vmware-workstation
  ];
}
