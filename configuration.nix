{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  
  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Istanbul";

  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "trq";
  };

  services.xserver = {
    enable = true;
    layout = "tr";
    xkbOptions = "eurosign:e";
    desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;
  };
  
  systemd.services.bd_prochot_off = {
    wantedBy = [ "graphical.target" ];
    path = with pkgs; [ module_init_tools msr-tools bc ]; 
    script = 
    ''
      modprobe msr
      r=`rdmsr 0x1FC`
      s="0x'$r'" 
      f=$(($s&0xFFFFE))
      wrmsr 0x1FC "obase=16;$f" | bc
    '';
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.necdet = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];
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
        ";
        viAlias = true;
        vimAlias = true;
        plugins = with pkgs.vimPlugins; [
          vim-nix
          {
            plugin = nerdtree;
            config = "nnoremap <C-t> :NERDTreeToggle <CR>";
          }
          lightline-vim
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
          theme = "gentoo";
          plugins = [ "git" ];
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
    oh-my-zsh
    htop
    qemu_kvm
    libvirt
    ghc
    virt-manager
    uget 
    uget-integrator
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
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "adobe-reader-9.5.5-1"
  ];

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  powerManagement = {
    cpuFreqGovernor = "performance";
    scsiLinkPolicy = "max_performance";
  };

  system.stateVersion = "20.09";
}
