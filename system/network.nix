{...}: {
  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
    useDHCP = false;
    interfaces.wlp1s0.useDHCP = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [25565 8000 3000 8080 19000 8888 1337 5432 9090 9777];
      allowedUDPPorts = [8080];
    };
  };

  users.users.necdet = {
    extraGroups = ["networkmanager"];
  };
}
