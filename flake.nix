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
                  ./system/OMEN/configuration.nix
                  home-manager.nixosModules.home-manager
                  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.aadithyan = import ./homemanager/home.nix;
                  }
                ];
            };
            HP = lib.nixosSystem {
                inherit system;
                modules = [
                  ./system/HP/configuration.nix
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
                extraSpecialArgs = {
                    dotfilesPath = "/home/aadithyan/.dotfiles";  
                };
            };
        };
    };
}