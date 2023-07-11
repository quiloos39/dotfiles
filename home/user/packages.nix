{ pkgs, ... }:
{
  home-manager.users.necdet = {
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
        redir
        redli
        bat
        wget
        rnix-lsp
        nixfmt
        # whatsapp-for-linux
        act
        # patchelf
        # nix-index
        xsel
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
        sqlite
        wireshark
        postman
        blender
        bottles
        wine64
        act
        winetricks
        kubectl
        minikube
        parsec-bin
        kubernetes-helm
        dive
        inetutils
        hexchat
        wireshark
        android-tools
        android-studio
        caddy
        cloudflared
      ];
    };
  };
}
