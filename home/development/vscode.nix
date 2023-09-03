{pkgs, ...}: {
  home-manager.users.necdet = {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [nil nixpkgs-fmt];
    programs.vscode = {
      mutableExtensionsDir = false;
      enable = true;
      extensions = with pkgs.vscode-extensions;
        [
          # redhat.java
          # vscjava.vscode-maven
          # vscjava.vscode-java-debug
          # vscjava.vscode-java-test
          ms-vsliveshare.vsliveshare
          apollographql.vscode-apollo
          jnoortheen.nix-ide
          formulahendry.auto-close-tag
          formulahendry.auto-rename-tag
          arrterian.nix-env-selector
          streetsidesoftware.code-spell-checker
          kamadorueda.alejandra
          ms-azuretools.vscode-docker
          dbaeumer.vscode-eslint
          mhutchie.git-graph
          github.copilot
          github.vscode-github-actions
          eamodio.gitlens
          oderwat.indent-rainbow
          christian-kohler.path-intellisense
          esbenp.prettier-vscode
          prisma.prisma
          bradlc.vscode-tailwindcss
          vscode-icons-team.vscode-icons
          github.github-vscode-theme
          editorconfig.editorconfig
          ms-vscode-remote.remote-ssh
          naumovs.color-highlight
          matthewpi.caddyfile-support
          alefragnani.project-manager
          alefragnani.bookmarks
          redhat.vscode-yaml
          ms-kubernetes-tools.vscode-kubernetes-tools
          donjayamanne.githistory
          gruntfuggly.todo-tree
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
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
          {
            name = "vscode-typescript-next";
            publisher = "ms-vscode";
            version = "5.2.20230711";
            sha256 = "dUWa3vlOn+ZqUh/VmkFJ0geDKHSLQwBKCmbq3dbkmps=";
          }
          {
            name = "remote-containers";
            publisher = "ms-vscode-remote";
            version = "0.299.0";
            sha256 = "90m53q9dDm1NPNex3+PIN9HkRYjCQlAHk/5YSW+gnZ0=";
          }
          {
            name = "helm-intellisense";
            publisher = "tim-koehler";
            version = "0.14.3";
            sha256 = "TcXn8n6mKEFpnP8dyv+nXBjsyfUfJNgdL9iSZwA5eo0=";
          }
          {
            name = "pretty-ts-errors";
            publisher = "yoavbls";
            version = "0.4.1";
            sha256 = "vY/dVO9k3LcXLYH9eX9blKMB+mDGCWkmU9ZU62YvAcM=";
          }
          {
            name = "volar";
            publisher = "vue";
            version = "1.8.6";
            sha256 = "EAS/1qYqTksJykS39tdAMIDz/cZaBIs1iH2HhhifVYw=";
          }
          {
            name = "vscode-stripe";
            publisher = "stripe";
            version = "2.0.14";
            sha256 = "kYJkzPb585WhkWvXZ9uyEQMve15EfjRMj7NHtQJZbzs=";
          }
          {
            name = "vscode-dotnet-runtime";
            publisher = "ms-dotnettools";
            version = "1.6.0";
            sha256 = "A3m5IvPKgmF2Dix1/bHFGcrJYriYsFgRagkZNcWf/RA=";
          }
          {
            name = "vscode-css-peek";
            publisher = "pranaygp";
            version = "4.4.1";
            sha256 = "GX6J9DfIW9CLarSCfWhJQ9vvfUxy8QU0kh3cfRUZIaE=";
          }
          {
            name = "name-that-color";
            publisher = "guillaumedoutriaux";
            version = "0.1.6";
            sha256 = "UCrIz7qXUisHmXw0ngtVTyXWwCBZVR4K3Sv45BamGyk=";
          }
        ];
      userSettings = {
        "[nix]" = {
          "editor.defaultFormatter" = "kamadorueda.alejandra";
          "editor.formatOnPaste" = true;
          "editor.formatOnSave" = true;
          "editor.formatOnType" = false;
        };
        "[caddyfile]" = {
          "editor.defaultFormatter" = "matthewpi.caddyfile-support";
        };
        "alejandra.program" = "alejandra";
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "editor.renderWhitespace" = "none";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = false;
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
        "stripe.cliInstallPath" = "/etc/profiles/per-user/necdet/bin/stripe";
      };
    };
  };
}
