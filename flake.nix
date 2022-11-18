{
  description = "A very basic flake";

  inputs.utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in rec
      {
        # Used by `nix develop`
        devShells.default = pkgs.mkShell rec {
          buildInputs = with pkgs; [
            rsass
            just
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
        };
      }
    );
}
