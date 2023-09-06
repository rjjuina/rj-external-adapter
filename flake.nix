{
  description = "Chainlink development shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ ]; };
      in
      rec {
        devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
                nodejs_16
                yarn
            ];
        };
        formatter = pkgs.nixpkgs-fmt;
      });
}
