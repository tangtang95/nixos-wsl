{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, NixOS-WSL, home-manager }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { nix.registry.nixpkgs.flake = nixpkgs; }
        ./configuration.nix
        NixOS-WSL.nixosModules.wsl
        home-manager.nixosModules.home-manager
      ];
    };
  };

}
