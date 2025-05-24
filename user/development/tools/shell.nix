{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    zoxide
    starship
    btop
    bat
    eza
    tldr
    yazi
  ];
  programs.zsh = {
    enable = true;

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";

    shellAliases = {
      zjs = "zellij --session";
      cd = "z";
      ls = "eza --icons";
      erd = "erd -y inverted -H";
      erda = "erd -y inverted -H -. --no-git";
      grep = "rg";
    };

    # With Antidote:
    antidote = {
      enable = true;
      plugins = [
        ''
          Multirious/zsh-helix-mode
          zsh-users/zsh-autosuggestions
          Aloxaf/fzf-tab
        ''
      ]; # explanation of "path:..." and other options explained in Antidote README.

    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
  };
}
