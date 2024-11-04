{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  description = "Odin";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      rec {
        docsDependencies = with pkgs.python312Packages; [ 
          mkdocs-material 
          mkdocs-minify-plugin 
          markdown 
        ] ++ [ pkgs.redocly ];
        devShells = {
          default = pkgs.mkShell {
            buildInputs = docsDependencies;
          };
        };
    }
  );
}
