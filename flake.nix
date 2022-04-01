{
  inputs.nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs-unstable }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs-unstable { inherit system; };
    in {
      devShell."${system}" = pkgs.mkShell {
        buildInputs = [
          pkgs.cabal-install
          pkgs.haskell.compiler.ghc8107
        ];
      };
    };
}
