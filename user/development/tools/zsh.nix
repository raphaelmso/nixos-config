{
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    zsh
    zoxide
    starship
    btop
    bat
    eza
    fzf
    tldr
    yazi
    fd
    ripgrep
    wget
    curl
  ];

  programs.zsh = {
    enable = true;

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";

    autosuggestion.enable = true;

    shellAliases = {
      zjs = "zellij --session";
      cd = "z";
      ls = "eza --icons";
      erd = "erd -y inverted -H";
      erda = "erd -y inverted -H -. --no-git";
      grep = "rg";
    };

  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };

  programs.zoxide = {
    enable = true;
  };

}
