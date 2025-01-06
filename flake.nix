{
  description = "My own Neovim flake";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/release-24.11";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
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

  outputs = { self, nixpkgs, telescope-recent-files-src, neovim-nightly-overlay, harpoon }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; overlays = [ neovim-nightly-overlay.overlays.default applyConfiguration plugins ]; };

      plugins = prev: final: {
        vimPlugins = final.vimPlugins // {
          telescope-recent-files = import ./packages/vimPlugins/telescopeRecentFiles.nix {
            src = telescope-recent-files-src;
            pkgs = prev;
          };
        };
      };
      applyConfiguration = prev: final: {
        myNeovim = import ./packages/myNeovim.nix {
          pkgs = prev;
        };
      };
    in
    {
      packages.x86_64-linux.default = pkgs.myNeovim;

      apps.x86_64-linux.nvim = {
        type = "app";
        program = "${pkgs.myNeovim}/bin/nvim";
      };
    };
}
