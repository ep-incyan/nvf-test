{pkgs ? import <nixpkgs> {}}: let
  nvfFlake = builtins.getFlake "github:ep-incyan/nvf-test";
  customNeovim = nvfFlake.packages."aarch64-darwin".default;
in
  pkgs.mkShell {
    buildInputs = [
      pkgs.hello
      customNeovim
    ];
  }
