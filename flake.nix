{
  description = "mynixpkgs";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux ;
  in {
    packages.x86_64-linux.default = pkgs.hello;
    packages.x86_64-linux.extract-xiso = pkgs.callPackage ./packages/extract-xiso.nix {};
    packages.x86_64-linux.gogo-protobuf = pkgs.callPackage ./packages/gogo-protobuf.nix {};
  };

  nixConfig = {
    extra-substituters = [
      "https://cache.garnix.io/"
      "https://colmena.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
    ];
  };
}
