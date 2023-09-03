{pkgs, ...}: let
  node = pkgs.nodejs_16;
in {
  nixpkgs.config.permittedInsecurePackages = ["nodejs-16.20.1"];
  home-manager.users.necdet = {
    home.packages = with pkgs; [
      node
      (yarn.override {
        nodejs = node;
      })
      nodePackages.typescript
      nodePackages.prettier
      nodePackages.eslint
      nodePackages.lerna
      pm2
      nodePackages.gatsby-cli
      nodePackages.serve
      nodePackages.ts-node
      nodePackages.prisma
    ];
  };
}
