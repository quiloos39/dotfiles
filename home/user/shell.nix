{ pkgs, ... }:
{
  programs.ssh.extraConfig = ''
    ForwardAgent yes
  '';
  programs.zsh.enable = true;
  home-manager.users.necdet = {
    home = {
      packages = with pkgs; [ zsh-completions nix-zsh-completions ];
      shellAliases = {
        "enrc" = "code /etc/nixos/";
        "nrs" = "sudo nixos-rebuild switch --upgrade";
      };
      sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        DOCKER_BUILDKIT = "1";
      };
    };
    programs = {
      direnv.enable = true;
      fzf.enable = true;
      zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          theme = "lambda";
          plugins =
            [ "git" "man" "colored-man-pages" "tmux" "docker" "npm" "gcloud" "aws" ];
          extraConfig = ''
            export PATH=~/.npm-packages/bin:$PATH
            export NODE_PATH=~/.npm-packages/lib/node_modules
            export ANDROID_HOME=/home/necdet/Android
          '';
        };
      };
      git = {
        enable = true;
        userName = "quiloos39";
        userEmail = "hello@necdet.xyz";
      };
      neovim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
          vim-airline
          vim-nix
          vim-indent-guides
          {
            plugin = vim-clang-format;
            config = ''
              let g:clang_format#code_style = "llvm"
            '';
          }
          {
            plugin = nerdtree;
            config = ''
              nnoremap <C-t> :NERDTreeToggle<CR>
            '';
          }
          {
            plugin = awesome-vim-colorschemes;
            config = "colorscheme OceanicNext";
          }
          {
            plugin = changeColorScheme-vim;
            config = ''
              nnoremap <F5> :call NextColorScheme()<CR>
              nnoremap <F4> :call PreviousColorScheme()<CR>
            '';
          }
        ];
        extraConfig = ''
          set encoding=utf-8
          syntax enable " Enable syntax highlighting.
          set nu " Show number line.
          set tabstop=2 " Indent using 2 spaces.
          set smarttab " Insert tabstop of spaces when tab key is pressed.
          set shiftwidth=2 " When shifting, indent using 2 spaces
          set softtabstop=2
          set nowrap " Disable wrapping.
          set autoindent " New lines inherits the indentation of previous lines.
          set expandtab " Converts tabs to spaces.
          set cursorline
          set showcmd
        '';
        viAlias = true;
        vimAlias = true;
      };
    };
  };
}
