Haskell Project Template
------------------------
> Quick-quick chop-chop starter kit for multi-component Haskell projects.

**Work in progress**. I'd like to get it done one day, but am parking
it here for the time being. If you're reading this, don't keep your
hopes high, I'm a crap programmer and don't have too much time in my
hands. But luckily there are plenty of good alternatives:

- [Nix Haskell Development (2020)][hs-nix-dev-2020]. Great discussion
  about best practices. Some of the guys there turned those ideas into
  a [finger-licking template][hs-nix-templ] that should cover common
  scenarios. Check it out!
- [Setting up a Haskell development environment with Nix][hs-nix-walkthrough].
  Excellent walk through. You could easily lift the code snippets there
  to whip together your own template.
- [Haskell-nix — Cabal files philosophy][hs-nix-reddit]. Some more ideas
  about setting up Haskell projects with Nix. Also worth reading:
  [Questions and Answers about Nix for Haskellers][hs-nix-q-n-a].
- [haskell.nix][hsnix]. One infrastructure to rule them all. Looks very
  promising but also still a bit rough around the edges and not beginner
  friendly. It could become the go-to Haskell starter kit at some point
  though or perhaps someone else will build such a thing on top of it.


### Bootstrap

We use [Nix][nix] to escape dependency hell and reliably get reproducible
build and dev environments as well as Docker images. (No Docker can't do
that.) The only thing you'll need to install is Nix itself, all the rest
is taken care for. Notice if you're on a recent macOS, the recommended
installation one-liner is

    $ sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume

Since we're using the [haskell.nix][hsnix] infrastructure instead of
Nix's own Haskell packages, we recommended setting up a binary cache
as [explained][hsnix.cache] by the `haskell.nix** folks themselves, e.g.

    $ mkdir -p ~/.config/nix/
    $ cat > ~/.config/nix/nix.conf
    trusted-public-keys = hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=
    substituters = https://hydra.iohk.io

### All the rest

**TODO**

Didn't I mention this is **work in progress**? :-)




[hs-nix-dev-2020]: https://discourse.nixos.org/t/nix-haskell-development-2020/6170/9
[hs-nix-q-n-a]: https://github.com/cdepillabout/post-about-nix-and-haskell/blob/master/2019-08-03-q-and-as-about-nix-for-haskellers.md
[hs-nix-reddit]: https://www.reddit.com/r/NixOS/comments/jsxq34/haskellnix_cabal_files_philosophy/
[hs-nix-templ]: https://github.com/utdemir/hs-nix-template
[hs-nix-walkthrough]: https://github.com/aveltras/setting-up-a-haskell-development-environment-with-nix
[hsnix]: https://github.com/input-output-hk/haskell.nix
[hsnix.cache]: https://input-output-hk.github.io/haskell.nix/tutorials/getting-started/#setting-up-the-binary-cache
[nix]: https://nixos.org/
