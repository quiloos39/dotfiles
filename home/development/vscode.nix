{ pkgs, ... }:
{
  home-manager.users.necdet = {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [ nil nixpkgs-fmt ];
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        # redhat.java
        # vscjava.vscode-maven
        # vscjava.vscode-java-debug
        ms-vsliveshare.vsliveshare
        apollographql.vscode-apollo
        formulahendry.auto-close-tag
        formulahendry.auto-rename-tag
        arrterian.nix-env-selector
        streetsidesoftware.code-spell-checker
        ms-azuretools.vscode-docker
        dbaeumer.vscode-eslint
        mhutchie.git-graph
        github.copilot
        github.vscode-github-actions
        eamodio.gitlens
        oderwat.indent-rainbow
        christian-kohler.path-intellisense
        esbenp.prettier-vscode
        # prisma.prisma
        ms-vscode-remote.remote-ssh
        bradlc.vscode-tailwindcss
        vscode-icons-team.vscode-icons
        github.github-vscode-theme
        vscjava.vscode-java-test
        editorconfig.editorconfig
        ms-vscode-remote.remote-ssh
        naumovs.color-highlight
        matthewpi.caddyfile-support
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "bracket-select";
          publisher = "chunsen";
          version = "2.0.2";
          sha256 = "2+42NJWAI0cz+RvmihO2v8J/ndAHvV3YqMExvnl46m4=";
        }
        {
          name = "template-string-converter";
          publisher = "meganrogge";
          version = "0.6.1";
          sha256 = "w0ppzh0m/9Hw3BPJbAKsNcMStdzoH9ODf3zweRcCG5k=";
        }

      ];
      userSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "nix.serverSettings" = {
          "nil.formatting.command" = [ "nixpkgs-fmt" ];
        };
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "editor.renderWhitespace" = "none";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = true;
        };
        "explorer.compactFolders" = false;
        "path-intellisense.showHiddenFiles" = true;
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.inlineSuggest.enabled" = true;
        "github.copilot.enable" = {
          "*" = true;
        };
        "git.enableSmartCommit" = true;
        "files.associations" = {
          "*.css" = "tailwindcss";
          ".env.local" = "editorconfig";
        };
        "editor.quickSuggestions" = {
          "strings" = true;
        };
        "editor.snippetSuggestions" = "none";
        "javascript.updateImportsOnFileMove.enabled" = "always";
        "workbench.iconTheme" = "vscode-icons";
        "editor.minimap.enabled" = false;
        "files.exclude" = {
          "**/.git" = false;
        };
        "typescript.tsserver.experimental.enableProjectDiagnostics" = true;
        "git.confirmSync" = false;
        "workbench.sideBar.location" = "right";
        "git.ignoreRebaseWarning" = true;
        "window.zoomLevel" = 1;
        "security.workspace.trust.untrustedFiles" = "open";
        "workbench.colorTheme" = "GitHub Dark";
        "workbench.startupEditor" = "none";
      };
    };
  };
}
