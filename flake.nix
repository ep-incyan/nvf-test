{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  }: {
    packages."aarch64-darwin" = let
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
      customNeovim = nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          {
            vim = {
              theme = {
                enable = true;
                name = "catppuccin";
                style = "frappe";
              };
            };
          }
        ];
      };
    in {
      default = customNeovim.neovim;
    };
  };
}
