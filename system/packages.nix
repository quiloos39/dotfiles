{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;
  programs.kdeconnect.enable = true;
  environment.systemPackages = with pkgs; [
    firefox
    google-chrome-beta
    vlc
    libreoffice-fresh
    neovim
    vim
    gimp
  ];
}
