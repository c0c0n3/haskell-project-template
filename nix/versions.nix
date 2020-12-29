#
# Versions of the Nix infrastructure our project uses.
# We pin absolutely everything to make sure no matter what everybody
# gets the exact same build/dev environment, Docker images, etc.
# Reproducibility is king.
#

let
  importHaskellNix = import ./lib/haskell-nix-importer.nix;
in rec {

  # Git hash of the `haskell.nix` commit to fetch. Don't specify a revision
  # parameter to the importer function below if you want to get the latest
  # from the master branch instead of pinning packages to a specific commit.
  # See:
  # - https://input-output-hk.github.io/haskell.nix/tutorials/getting-started/#pinning-the-haskellnix-version
  #
  # A quick way to get a description of the commit is to use the GitHub API
  # to GET a JSON object describing the commit associated to the commit hash
  # in the URL---short hashes work too. E.g.
  #
  #     https://api.github.com/repos/input-output-hk/haskell.nix/commits/064d4eb
  #
  haskellNixCommit = "064d4eb587a78c8e073bbbaec6d6022eb234e015";

  # Import all `haskell.nix` definitions as they were at the specified
  # commit.
  haskellNix = importHaskellNix { revision = haskellNixCommit; };

  # Tell `haskell.nix` what `nixpkgs` to use.
  # Since `haskell-nix` comes with some pinned `nixpkgs` sets (defined in
  # `sources.nix`) and those pins get cached in their Hydra CI stash, we'll
  # use one of the `haskell.nix` pins. Keep in mind you can just as well
  # set this to `<nixpkgs>` but you might be less likely to get a cache
  # hit---well, according to their docs.
  nixpkgsSrc = haskellNix.sources.nixpkgs-2009;

  # GHC version to use, specified using the corresponding GHC package
  # name in `nixpkgsSrc`.
  compiler-nix-name = "ghc8102";

}
