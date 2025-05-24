{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    lazygit
  ];
  programs.git = {
    enable = true;
    userName = "Raphael Oliveira";
    userEmail = "raphael.msoliveira@gmail.com";
  };
}
