{
    description = "Flake of Aadithyan";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
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
        systemSettings = rec {
            timeZone = "Asia/Kolkata";
        };
        userSettings = rec {
            username = "aadithyan";
            name = "Aadithyan Raju";
            userHome = "/home/${username}";
            dotfilesDir = "${userHome}/.dotfiles";
            git = {
                userName = "AadithyanRaju";
                userEmail = "aadithyan75@gmail.com";
            };
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
                    inherit outputs;
                    inherit systemSettings;
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
        overlays = import ./overlays { inherit inputs; };
        nixosConfigurations = {
            OMEN = mkSystem "OMEN" ./system/OMEN/configuration.nix;
            HP = mkSystem "HP" ./system/HP/configuration.nix;   
        };
        homeConfigurations = {
            ${userSettings.username} = mkHome [ ./homemanager/home.nix ];
        };
    };
}