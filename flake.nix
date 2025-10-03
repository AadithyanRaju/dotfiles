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

    outputs = inputs@{ self, nixpkgs, home-manager, blocklist-hosts,... }: 
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        userSettings = rec {
            username = "aadithyan";
            name = "Aadithyan Raju";
            email = "aadithyan75@gmail.com";
            userHome = "/home/${username}";
            dotfilesDir = "${userHome}/.dotfiles";
        };
        mkSystem = name: configFile:
            lib.nixosSystem {
                inherit system;
                modules = [
                    configFile
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.${userSettings.username} = import ./homemanager/home.nix;
                    }
                ];
                specialArgs = {
                    inherit userSettings;
                    inherit inputs;
                    hostName = name;
                };
            };
        mkHome = modules: 
            home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = modules;
                extraSpecialArgs = {
                    inherit userSettings;
                    dotfilesPath = "${userSettings.dotfilesDir}";
                };
            };
    in {
        nixosConfigurations = {
            OMEN = mkSystem "OMEN" ./system/OMEN/configuration.nix;
            HP = mkSystem "HP" ./system/HP/configuration.nix;   
        };
        homeConfigurations = {
            ${userSettings.username} = mkHome [ ./homemanager/home.nix ];
        };
    };
}