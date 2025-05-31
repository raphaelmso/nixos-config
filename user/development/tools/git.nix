{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    git
    lazygit
  ];
  programs.git = {
    enable = true;
    userName = "Raphael Oliveira";
    userEmail = "raphael.msoliveira@gmail.com";
  };
}
