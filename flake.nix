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
        blocklist-hosts = {
            url = "github:StevenBlack/hosts";
            flake = false;
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        userSettings = rec {
            username = "aadithyan";
            name = "Aadithyan Raju";
            email = "aadithyan75@gmail.com";
            dotfilesDir = "~/.dotfiles";
            userHome = "/home/${username}";
        };
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
                specialArgs = {
                    inherit userSettings;
                };
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