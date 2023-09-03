{...}: {
  # services.samba-wsdd.enable = true; # make shares visible for windows 10 clients
  networking.firewall.allowedTCPPorts = [
    5357 # wsdd
  ];
  networking.firewall.allowedUDPPorts = [
    3702 # wsdd
  ];
  # services.samba = {
  #   enable = true;
  #   extraConfig = ''
  #     server string = File Server
  #     workgroup = WORKGROUP
  #     security = user
  #     map to guest = Bad User
  #     name resolve order = bcast host
  #   '';
  #   shares = {
  #     public = {
  #       path = "/home/necdet/Shared";
  #       browseable = "yes";
  #       "read only" = "yes";
  #       "guest ok" = "yes";
  #       "create mask" = "0644";
  #       "directory mask" = "0644";
  #     };
  #   };
  # };
  networking.firewall.allowPing = true;
  services.samba.openFirewall = true;
}
