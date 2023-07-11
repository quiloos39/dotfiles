{ pkgs, ... }: {
  home-manager.users.necdet = {
    home.packages = with pkgs; [ gcc gdb gnumake cmake ];
  };
}
