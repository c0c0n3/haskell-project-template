#
# Declare our project using our pinned `haskell.nix` infrastructure.
# See:
# - https://input-output-hk.github.io/haskell.nix/tutorials/getting-started/
#
{
  deps ? import ./versions.nix
, pkgs ? import ./pkgs.nix
}:

pkgs.haskell-nix.project {

  # Consider only files known to git.
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "big-honking-wreck";
    src = ../components;
  };
  # TODO. What dir to set here? The Cabal project file is in ../components
  # but with `src` set to that I get the all reassuring msg
  #
  #    trace: gitSource.nix: [...]/haskell-project-template/components
  #           does not seem to be a git repository, assuming it is a
  #           clean checkout.
  #

  # GHC version to use. (Not required for Stack projects.)
  compiler-nix-name = deps.compiler-nix-name;

  # TODO. Cabal index state. Thought we didn't need to be explicit about
  # that b/c Nix packages are pinned. But:
  #
  #    trace: No index state specified for big-honking-wreck, using the
  #           latest index state that we know about (2020-12-26T00:00:00Z)!
  #
  # Wot?! Anyhoo, figure out if it needs to be in here or in the Cabal
  # project file.

}



