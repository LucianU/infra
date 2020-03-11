let
  pkgs = import ./nixpkgs.nix { };
  ghc = pkgs.haskellPackages.ghcWithPackages(ps: [ ps.ghcid ]);
  # py = pkgs.python37Packages.withPackages(ps: with ps; [ black mypy ]);
in
  pkgs.mkShell {
    buildInputs = [ ghc ];
  }
