#
# Ask `haskell.nix` to assemble all the Nix package definitions selected
# by the `versions` module.
#

let
  versions = import ./versions.nix;
in
  import versions.nixpkgsSrc versions.haskellNix.nixpkgsArgs
  # NOTE. `nixpkgsSrc` points to the `nixpkgs` pinned by `versions`
  # whereas `nixpkgsArgs` contains the `haskell.nix` config to add
  # in all of `haskell.nix` as an overlay.
