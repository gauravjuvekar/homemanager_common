{
  description = "Common home-manager configuration for multiple hosts";

  inputs =
    {
      home-manager =
        {
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
      nixpkgs.url = "github:NixOS/nixpkgs";
      firefox-addons =
        {
          url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };

  outputs = { ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs =
        import inputs.nixpkgs {
          system = system;
          config =
            {
              allowUnfreePredicate =
                (
                  pkgname: builtins.elem (inputs.nixpkgs.lib.getName pkgname)
                    [
                    ]
                );
            };
        };
      extraSpecialArgs =
        {
          firefox-addons = inputs.firefox-addons.outputs.packages.${system};
        };
    in
    {
      homeConfigurations."gaurav@dt.sc.gjuvekar.com" =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          inherit extraSpecialArgs;
          modules =
            [
              ./hosts/gaurav-dt/home.nix
            ];
        };
      homeConfigurations."gaurav@gaurav-nixlt" =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          inherit extraSpecialArgs;
          modules =
            [
              ./hosts/gaurav-nixlt/home.nix
            ];
        };
    };
}
