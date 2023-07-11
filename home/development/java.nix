{ pkgs, ... }: {
  home-manager.users.necdet = {
    home.packages = with pkgs; [ jetbrains.idea-ultimate maven netbeans ];
    programs.java = {
      enable = true;
      package = pkgs.jdk;
    };
  };
}
