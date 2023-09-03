{pkgs, ...}: {
  virtualisation = {
    # Allow usb direction to virtual machine
    vmware = {
      host.enable = true;
    };

    spiceUSBRedirection.enable = true;
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
      };
    };
  };
  users = {
    users.necdet = {
      extraGroups = ["docker" "libvirtd"];
    };
    extraGroups.vboxusers.members = ["necdet"];
  };
  boot.kernelModules = ["kvm-amd"];
}
