{ ... }: {
  networking = {
    networkmanager.enable = true;
    hostName = "nixos";

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.wlp1s0.useDHCP = true;
    firewall = {
      allowedTCPPorts = [ 25565 8000 3000 8080 19000 8888 1337 ];
      # allowedUDPPorts = [ 993 ];
      checkReversePath = false;
    };


    # wireguard.interfaces = {
    #   # "wg0" is the network interface name. You can name the interface arbitrarily.
    #   wg0 = {
    #     # Determines the IP address and subnet of the client's end of the tunnel interface.
    #     ips = [ "10.66.66.2/32" "fd42:42:42::2/128" ];
    #     listenPort = 993; # to match firewall allowedUDPPorts (without this wg uses random port numbers)

    #     # Path to the private key file.
    #     #
    #     # Note: The private key can also be included inline via the privateKey option,
    #     # but this makes the private key world-readable; thus, using privateKeyFile is
    #     # recommended.
    #     privateKey = "WG5048d1LGEbM5p5F2PAiqKakLBUgjPi6RPAey1LoWk=";

    #     peers = [
    #       # For a client configuration, one peer entry for the server will suffice.

    #       {
    #         # Public key of the server (not a file path).
    #         publicKey = "Xe3lpOZfmrYA4xLIMbpVZZhcFVMFRqOXU7hvziIHsDg=";
    #         presharedKey = "1Cit7Zbpb3K0HADnerNz2gPhY8fuNuM4ocD9mAMBWRo=";
    #         # Forward all the traffic via VPN.
    #         allowedIPs = [ "0.0.0.0/0" "::/0" ];
    #         # Or forward only particular subnets
    #         #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];

    #         # Set this to the server IP and port.
    #         endpoint = "3.74.73.80:993"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

    #         # Send keepalives every 25 seconds. Important to keep NAT tables alive.
    #         persistentKeepalive = 25;
    #       }
    #     ];
    #   };
    # };
  };

  users.users.necdet = {
    extraGroups = [ "networkmanager" ];
  };

}
