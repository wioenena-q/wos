{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      host = "laptop";
      pkgs = nixpkgs.legacyPackages.${system};

      local-pkgs = import ./pkgs { inherit pkgs; };
      wos-config = import ./wos/config.nix { inherit pkgs; };
    in {
      inherit wos-config;
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs wos-config local-pkgs host; };
        modules = [ ./hosts/${host}/configuration.nix ./system ]
          ++ wos-config.system.exports;
      };

      homeConfigurations."wioenena" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./home/home.nix ] ++ wos-config.home.exports;

          extraSpecialArgs = { inherit inputs wos-config local-pkgs host; };
        };

      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;
    };
}
