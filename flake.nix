{
  description = "Ryuzaki Raspberry Pi";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "aarch64-linux";
    in
    {
      nixosConfigurations.ryuzakipi = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
        ];
      };
    };
}
