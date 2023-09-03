{pkgs, ...}: {
  security.sudo.wheelNeedsPassword = false;
  users.users = {
    necdet = {
      isNormalUser = true;
      description = "necdet";
      extraGroups = ["wheel"];
      shell = pkgs.zsh;
    };
  };
  programs.zsh.enable = true;
  environment.shells = [pkgs.zsh];
}
