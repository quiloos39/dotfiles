{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];
  
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  
  security.sudo.wheelNeedsPassword = false;
  
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [
      8080
    ];
  };
  
  time.timeZone = "Europe/Istanbul";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "trq";
  };
  
  services.gnome3 = {
    chrome-gnome-shell.enable = true;
  };
  
  services.xserver = {
    enable = true;
    layout = "tr";
    xkbOptions = "eurosign:e";
    desktopManager.gnome3.enable = true;
    displayManager.gdm.enable = true;
  };
  
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.prime = {
    offload.enable = true;
    intelBusId = "PCI:0:02:0";
    nvidiaBusId = "PCI:1:00:0";
  };

  systemd.services.bd_prochot_off = {
    wantedBy = [ "graphical.target" ];
    path = with pkgs; [ module_init_tools msr-tools bc ]; 
    description = "Disables BD PROCHOT";
    script = 
    ''
      modprobe msr
      r=`rdmsr 0x1FC`
      s="0x'$r'" 
      f=$(($s&0xFFFFE))
      wrmsr 0x1FC "obase=16;$f" | bc
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "Yes";
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.necdet = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" "wireshark" ];
    shell = pkgs.zsh;
  };
  
  home-manager.users.necdet = {
    programs = {
      git = {
        enable = true;
        userName = "quiloos39";
        userEmail = "quiloos39@gmail.com";
      };
      neovim = {
        enable = true;
        extraConfig = 
        "
          syntax on
          set nu
          set tabstop=2
          set shiftwidth=2
          set autoindent
          set showcmd
          let mapleader=','
        ";
        viAlias = true;
        vimAlias = true;
        plugins = with pkgs.vimPlugins; [
          vim-nix
          nerdcommenter
          lightline-vim
          {
            plugin = nerdtree;
            config = "nnoremap <C-t> :NERDTreeToggle <CR>";
          }
          {
            plugin = goyo;
            config = "nnoremap <C-g> :Goyo<CR>";
          }
          {
            plugin = changeColorScheme-vim;
            config = ''
              nnoremap <F5> :call NextColorScheme()<CR>
              nnoremap <F4> :call PreviousColorScheme()<CR>
            '';
          }
          {
            plugin = awesome-vim-colorschemes;
            config = "colorscheme sierra";
          }
          {
            plugin = gitgutter;
            config = ''
              let g:gitgutter_sign_added = '+'
              let g:gitgutter_sign_modified = '>'
              let g:gitgutter_sign_removed = '-'
              let g:gitgutter_sign_removed_first_line = '^'
              let g:gitgutter_sign_modified_removed = '<'
              let g:gitgutter_override_sign_column_highlight = 1
              highlight SignColumn guibg=bg
              highlight SignColumn ctermbg=bg
            '';
          }
	      ];
      };
      zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          theme = "cloud";
          plugins = [ "git" "man" ];
        };
        shellAliases = {
          "enrc" = "sudoedit /etc/nixos/configuration.nix";
          "cat" = "bat";
          "nxg" = "sudo nix-collect-garbage -d";
          "nrs" = "sudo nixos-rebuild switch";
        };
      };
    };
    home.sessionVariables = {
      EDITOR="nvim";
      VISUAL="nvim";
    }; 
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget 
    vim
    neovim
    firefox
    msr-tools
    google-chrome
    docker
    discord
    git
    openvpn
    bc
    bash
    tmux
    vscode
    zsh
    postman
    nodejs
    htop
    qemu_kvm
    libvirt
    ghc
    virt-manager
    home-manager
    linuxPackages.cpupower
    i7z
    mprime
    xclip
    zoom-us
    vlc
    libreoffice-fresh
    (python38.withPackages (ps: with ps; [
      ipython
      jupyterlab
      matplotlib
    ]))
    nix-index
    bat
    obs-studio
    docker-compose
    wireshark
    nodePackages.http-server
    gnomeExtensions.dash-to-dock
    gnome3.gnome-tweak-tool
    jetbrains.idea-ultimate
    go
    golint
    go-outline
    gopkgs
    delve
    gopls
    gnome3.ghex
    pciutils
    (pkgs.writeShellScriptBin "nvidia-offload" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export __VK_LAYER_NV_optimus=NVIDIA_only
      exec -a "$0" "$@"
    '')
    maven
    patchelf
    steam
    jetbrains.clion
    stdenv
    platformio
  ];

  fonts.fonts = with pkgs; [
    caladea
    carlito
    dejavu_fonts
    gentium
    liberation_ttf
    libertine
    noto-fonts
    source-code-pro
    source-sans-pro
    source-serif-pro
    anonymousPro
    nerdfonts
    font-awesome
  ];

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  programs.wireshark.enable = true;

  programs.java = {
    enable = true;
    package = pkgs.jdk11;
  };

  powerManagement = {
    cpuFreqGovernor = "performance";
    scsiLinkPolicy = "max_performance";
  };

  system.stateVersion = "20.09";
}
