let
  bootstrap = import <nixpkgs> { };
  nixpkgs-pin = builtins.fromJSON (builtins.readFile ./nixpkgs.json);

  nixpkgs = bootstrap.fetchFromGitHub {
    owner = "NixOS";
    repo  = "nixpkgs";
    inherit (nixpkgs-pin) rev sha256;
  };
in
  import nixpkgs
