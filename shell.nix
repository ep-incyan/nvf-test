{pkgs ? import <nixpkgs> {}}: let
  nvfFlake = builtins.getFlake "github:ep-incyan/nvf-test/295e6750e7afd0e13d6be8f9c9e63c52d1158438";
  customNeovim = nvfFlake.packages."aarch64-darwin".default;
in
  pkgs.mkShell {
    buildInputs = [
      pkgs.hello
      customNeovim
    ];
  }
