{ pkgs }:
let
  customRC = import ../config { inherit pkgs; };
  plugins = with pkgs.vimPlugins; [
    harpoon
    telescope-nvim
    telescope-recent-files
    nvim-lspconfig
    nvim-treesitter ## nvim-treesitter.withAllGrammars is available but slows down :checkhealth

    # highlighting + indentation for nix files
    vim-nix

    # full support for LSP completion related capabilities
    nvim-cmp
    cmp-buffer
    cmp-nvim-lsp
    cmp-path
    luasnip
  ] ++ [
    (pkgs.vimUtils.buildVimPlugin {
      name = "copilot";
      src = pkgs.fetchFromGitHub {
        owner = "github";
        repo = "copilot.vim";
        rev = "9484e35cf222e9360e05450622a884f95c662c4c";
        sha256 = "sha256-tcLrto1Y66MtPnfIcU2PBOxqE0xilVl4JyKU6ddS7bA=";
      };
    })
  ];
  runtimeDeps =
    with pkgs; [
      gcc
      gopls
      golint
      govulncheck
      rnix-lsp
      tree-sitter
      nodePackages.typescript
      nodePackages.typescript-language-server
      cmake-language-server
      yaml-language-server
      elmPackages.elm-language-server
      nodePackages_latest.vscode-html-languageserver-bin
      lua-language-server
      sqls
      rust-analyzer
      nodePackages.bash-language-server
      python311Packages.python-lsp-server
    ];
  neovimRuntimeDependencies = pkgs.symlinkJoin {
    name = "neovimRuntimeDependencies";
    paths = runtimeDeps;
    # see: https://ertt.ca/blog/2022/01-12-nix-symlinkJoin-nodePackages/
    postBuild = ''
      for f in $out/lib/node_modules/.bin/*; do
         path="$(readlink --canonicalize-missing "$f")"
         ln -f -s "$path" "$out/bin/$(basename $f)"
      done
    '';
  };
  myNeovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
    configure = {
      inherit customRC;
      packages.all.start = plugins;
    };
  };
in
pkgs.writeShellApplication {
  name = "nvim";
  runtimeInputs = [ neovimRuntimeDependencies ];
  text = ''
    ${myNeovimUnwrapped}/bin/nvim "$@"
  '';
}
