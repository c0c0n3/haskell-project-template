#
# Import all the `haskell.nix` definitions from their GitHub repo,
# optionally pining them to a specific commit.
#
{
  # URL of the GitHub repo hosting `haskell.nix`.
  repo ? https://github.com/input-output-hk/haskell.nix

  # Git hash of a specific commit to fetch. Defaults to master.
, revision ? "master"
}:

let
  hsNixArchive = "${repo}/archive/${revision}.tar.gz";
in
  import (fetchTarball hsNixArchive) {}
