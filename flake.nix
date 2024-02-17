{
  description = "My own Neovim flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    telescope-recent-files-src = {
      url = "github:smartpde/telescope-recent-files";
      flake = false;
    };
  };
  outputs =
    { self
    , nixpkgs
    , neovim
    , telescope-recent-files-src
    }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs =
          let
            overlayFlakeInputs = prev: final: {
              neovim = neovim.packages.${prev.system}.neovim;

              vimPlugins = final.vimPlugins // {
                telescope-recent-files = import ./packages/vimPlugins/telescopeRecentFiles.nix {
                  src = telescope-recent-files-src;
                  pkgs = prev;
                };
              };
            };
            overlayMyNeovim = prev: final: {
              myNeovim = import ./packages/myNeovim.nix {
                pkgs = prev;
              };
            };
          in
          import nixpkgs {
            system = system;
            overlays = [ overlayFlakeInputs overlayMyNeovim ];
          };
      });
    in
    {
      packages = forEachSupportedSystem ({ pkgs }: rec {
        default = pkgs.myNeovim;
      });

      apps = forEachSupportedSystem ({ pkgs }: rec {
        nvim = {
          type = "app";
          program = "${pkgs.myNeovim}/bin/nvim";
        };
      });
    };
}
