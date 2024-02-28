{ pkgs }:
let
  customRC = import ../config { inherit pkgs; };
  plugins = with pkgs.vimPlugins; [
    telescope-nvim
    nvim-cmp
    cmp-buffer
    cmp-nvim-lsp
    cmp-path
    cmp-cmdline
    nvim-treesitter
    telescope-recent-files
    nvim-lspconfig
    harpoon
  ];
  runtimeDeps = with pkgs; [
    nodePackages.typescript
    nodePackages.typescript-language-server
    cmake-language-server
    yaml-language-server
    elmPackages.elm-language-server
    nodePackages_latest.vscode-html-languageserver-bin
    lua-language-server
    rnix-lsp
    sqls
    rust-analyzer
    nodePackages.bash-language-server
    python310Packages.python-lsp-server

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
