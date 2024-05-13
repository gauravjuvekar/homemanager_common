{
  description = "Common home-manager configuration for multiple hosts";

  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs";
      home-manager =
        {
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."gaurav@dt.sc.gjuvekar.com" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules =
            [
              ./hosts/gaurav-dt/home.nix
            ];
        };
    };
}
