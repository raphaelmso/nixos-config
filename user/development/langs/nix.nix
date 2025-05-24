{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    nil
    nixfmt-rfc-style
  ];
}
