{pkgs, ...}: let
  lens_5_2 =
    (import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/f6e2e3a1e15a1670a73817f3ef58c561e35ebb40.tar.gz";
    }) {})
    .pkgs
    .lens;
in {
  home-manager.users.necdet = {
    # programs.kodi = {
    #   enable = true;
    # };
    programs.k9s.enable = true;
    programs.k9s.settings = {
      refreshRate = 1;
    };
    home = {
      packages = with pkgs; [
        discord
        teams
        openvpn
        zoom-us
        tldr
        awscli2
        google-cloud-sdk
        ranger
        qbittorrent
        xclip
        tmux
        htop
        redli
        bat
        wget
        rnix-lsp
        # whatsapp-for-linux
        act
        # patchelf
        # nix-index
        # xsel
        # x2goclient
        unzip
        gdrive
        # anydesk
        dig
        grapejuice
        obs-studio
        rclone
        kodi
        dbeaver
        standardnotes
        ngrok
        openssl
        lsof
        ansible
        ansible-lint
        ansible-later
        autossh
        xmcp
        prismlauncher
        # inkscape
        uget
        opera
        stripe-cli
        wireshark
        postman
        blender
        bottles
        wine64
        winetricks
        kubectl
        minikube
        parsec-bin
        kubernetes-helm
        dive
        inetutils
        hexchat
        wireshark
        # android-tools
        # android-studio
        caddy
        playonlinux
        alejandra
        # cloudflared
        argocd
        terraform
        lens_5_2
        dconf
        unrar
        # gns3-gui
        # gns3-server
        # dynamips
        # ubridge
        inetutils
        # aws-nuke
        # unifi
        etcher
      ];
    };
  };
}
