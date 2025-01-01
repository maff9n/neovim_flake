{ pkgs }:
let

  plugins = with pkgs.vimPlugins; [
    harpoon # harpoon
    telescope-nvim # telescope
    telescope-recent-files # telescope
    nvim-lspconfig # lsp
    nvim-treesitter # nvim-treesitter.withAllGrammars available but slows down :checkhealth
    lualine-nvim # lualine
    vim-fugitive # fugitive
    gitsigns-nvim # gitsigns
    vim-nix # highlighting + indentation for nix files
    nvim-cmp # cmp
    cmp-buffer # cmp
    cmp-nvim-lsp # cmp
    cmp-path #cmp
    luasnip #cmp
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
      tree-sitter
      nodePackages.typescript
      nodePackages.typescript-language-server
      cmake-language-server
      yaml-language-server
      elmPackages.elm-language-server
      # nodePackages_latest.vscode-langservers-extracted
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

  # Import scripts for neovim
  # messy but bears a certain flexibility
  scripts2ConfigFiles = dir:
    let
      configDir = pkgs.stdenv.mkDerivation {
        name = "nvim-${dir}-configs";
        src = ./../${dir};
        installPhase = ''
          mkdir -p $out/
          cp ./* $out/
        '';
      };
    in
    builtins.map (file: "${configDir}/${file}")
      (builtins.attrNames (builtins.readDir configDir));
  sourceConfigFiles = files:
    builtins.concatStringsSep "\n" (builtins.map
      (file:
        (if pkgs.lib.strings.hasSuffix "lua" file then "luafile" else "source")
        + " ${file}")
      files);
  lua = scripts2ConfigFiles "lua";
  customRC = builtins.concatStringsSep "\n"
    (builtins.map (configs: sourceConfigFiles configs) [ lua ]);
in
pkgs.writeShellApplication {
  name = "nvim";
  runtimeInputs = [ neovimRuntimeDependencies ];
  text = ''
    ${myNeovimUnwrapped}/bin/nvim "$@"
  '';
}
