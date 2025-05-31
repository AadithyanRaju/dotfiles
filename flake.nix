{
    description = "Flake of Aadithyan";

    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-unstable";
        };
        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        # hyprland = {
        #     url = "github:hyprwm/Hyprland";
        #     inputs.nixpkgs.follows = "nixpkgs";
        # };
        # hyprland-plugins = {
        #     url = "github:hyprwm/hyprland-plugins";
        #     inputs.hyprland.follows = "hyprland";
        # };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            OMEN = lib.nixosSystem {
                inherit system;
                modules = [
                  ./system/configuration.nix
                  home-manager.nixosModules.home-manager
                  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.aadithyan = import ./homemanager/home.nix;
                  }
                ];
            };
        };
        homeConfigurations = {
            aadithyan = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                  ./homemanager/home.nix
                ];
            };
        };
    };
}