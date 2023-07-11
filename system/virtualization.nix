{ pkgs, ... }: {

  virtualisation = {
    # virtualbox.host = {
    #   enable = true;
    #   enableExtensionPack = true;
    # };

    vmware = {
      guest.enable = true;
      host.enable = true;
    };

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        ovmf = {
          packages = [
            (pkgs.OVMFFull.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
          enable = true;
        };
        swtpm.enable = true;
      };
    };

    # Allow usb direction to virtual machine
    spiceUSBRedirection.enable = true;

    docker.enable = true;
  };

  users.extraGroups.vboxusers.members = [ "necdet" ];

  users.users.necdet = {
    extraGroups = [ "docker" "libvirtd" ];
  };

  boot.kernelModules = [ "kvm-amd" ];
}
