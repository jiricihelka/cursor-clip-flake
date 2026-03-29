{
  description = "Reusable Nix flake for cursor-clip";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems = f:
        lib.genAttrs systems (system:
          f (import nixpkgs {
            inherit system;
          }));
    in
    {
      overlays.default = import ./overlay.nix;

      packages = forAllSystems (pkgs:
        let
          pkgs' = import nixpkgs {
            inherit (pkgs.stdenv.hostPlatform) system;
            overlays = [ self.overlays.default ];
          };
        in {
          default = pkgs'.cursor-clip;
          cursor-clip = pkgs'.cursor-clip;
        });
    };
}