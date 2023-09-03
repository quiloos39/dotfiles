{...}: {
  imports = [
    <home-manager/nixos>
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
    users.necdet.home.stateVersion = "23.05";
  };
}
