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
    harpoon = {
      url = "github:ThePrimeagen/harpoon/harpoon2";
      flake = false;
    };
  };
  outputs =
    { self
    , nixpkgs
    , neovim
    , telescope-recent-files-src
    , harpoon
    }:
    let
      overlayFlakeInputs = prev: final: {
        neovim = neovim.packages.${prev.system}.neovim;

        vimPlugins = final.vimPlugins // {
          telescope-recent-files = import ./packages/vimPlugins/telescopeRecentFiles.nix {
            src = telescope-recent-files-src;
            pkgs = prev;
          };
          harpoon = prev.vimUtils.buildVimPlugin {
            name = "harpoon";
            src = harpoon;
            buildInputs = with prev; [ stylua ];
            };
        };
      };
      overlayMyNeovim = prev: final: {
        myNeovim = import ./packages/myNeovim.nix {
          pkgs = prev;
        };
      };
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs {
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
