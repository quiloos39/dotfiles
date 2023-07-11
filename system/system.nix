{ ... }: {
  imports = [
    ./users.nix
    ./network.nix
    ./virtualization.nix
    ./xserver.nix
    ./boot.nix
    ./packages.nix
    ./multitouch.nix
    ./sound.nix
  ];
}
