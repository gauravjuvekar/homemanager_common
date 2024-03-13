{
  description = "Home Manager configuration of gaurav";

  inputs =
    {
      nixpkgs.url = "git+https://github.com/nixos/nixpkgs?ref=nixos-unstable";
      home-manager =
        {
          url = "git+https://github.com/nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."gaurav" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules =
          [
            ./home.nix
          ];
      };
    };
}
