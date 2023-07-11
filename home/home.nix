{ ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
    ./user/packages.nix
    ./user/shell.nix
    ./development/vscode.nix
    ./development/node.nix
    ./development/python.nix
    ./development/java.nix
    ./development/c.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.necdet.home.stateVersion = "22.05";
  };
}
