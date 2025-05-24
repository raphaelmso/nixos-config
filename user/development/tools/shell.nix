{
  config,
  pkgs,
  lib,
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

    # plugins = [
    #   {
    #     name = "zsh-helix-mode";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "Multirious";
    #       repo = "zsh-helix-mode";
    #       rev = "...";
    #       sha256 = "...";
    #     };
    #   }
    # {
    #   name = "zsh-autosuggestions";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "zsh-users";
    #     repo = "zsh-autosuggestions";
    #     rev = "...";
    #     sha256 = "...";
    #   };
    # }
    # {
    #   name = "fzf-tab";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "Aloxaf";
    #     repo = "fzf-tab";
    #     rev = "...";
    #     sha256 = "...";
    #   };
    # }
    # ];
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
