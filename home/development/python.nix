{ pkgs, ... }:
{
  home-manager.users.necdet = {
    home.packages = with pkgs; [
      # python3.withPackages(ps: with ps; [flask flask-cors] )
    ];
  };
}
