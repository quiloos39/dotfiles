{ ... }: {
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
    scsiLinkPolicy = "max_performance";
  };
  hardware.cpu.amd.updateMicrocode = true;
}
