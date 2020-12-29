#
# Dev/build shell for our project.
# See:
# - https://input-output-hk.github.io/haskell.nix/tutorials/development/
#
{
  pkgs ? import ./pkgs.nix
}:

let
  hsPkgs = import ./default.nix { inherit pkgs; };
in hsPkgs.shellFor {
  # Include only the *local* packages of your project.
  packages = ps: with ps; [
  ];

  # If true, build a Hoogle documentation index of all dependencies,
  # and provide a `hoogle` command to search the index.
  withHoogle = false;

  # Some common tools can be added with the `tools` argument.
  # See `overlays/tools.nix` for the details.
  tools = { cabal = "3.2.0.0"; };

  # Some you may need to get some other way.
  # buildInputs = with pkgs.haskellPackages;
  #  [ ghcid ];

  # Stop Cabal from choosing alternate plans, so that Nix actually
  # provides *all* the dependencies.
  exactDeps = true;
}
