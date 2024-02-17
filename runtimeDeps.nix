{ pkgs }:
with pkgs; [
  # lazygit <-- git interface
  nodePackages.typescript
  nodePackages.typescript-language-server
]
