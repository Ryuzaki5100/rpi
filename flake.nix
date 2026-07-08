{
  description = "Ryuzaki Raspberry Pi";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    rpi-nixpkgs.url = "github:nix-community/raspberry-pi-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      rpi-nixpkgs,
    }:
    {
      nixosConfigurations.ryuzakipi = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";

        modules = [
          rpi-nixpkgs.nixosModules.raspberry-pi
          ./configuration.nix
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
        ];
      };
    };
}
