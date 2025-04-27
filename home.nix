{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "raphael";
  home.homeDirectory = "/home/raphael";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    yazi
    lazygit
    tmux
    kitty
    starship
    tldr
    nil
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/raphael/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.zsh = {
    enable = true;

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = [
      "rm *"
      "pkill *"
      "cp *"
    ];

    # With Antidote:
    antidote = {
      enable = true;
      plugins = [
        ''
          Multirious/zsh-helix-mode
          zsh-users/zsh-history-substring-search
          zsh-users/zsh-autosuggestions
          zsh-users/zsh-syntax-highlighting
          Aloxaf/fzf-tab
        ''
      ]; # explanation of "path:..." and other options explained in Antidote README.

    };
  };

  programs.git = {
    enable = true;
    userName = "Raphael Oliveira";
    userEmail = "raphael.msoliveira@gmail.com";
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

  programs.yazi = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
    extraConfig = "
      font_family JetBrainsMono Nerd Font
      font_size 13.0
      bold_font auto
      italic_font auto
      bold_italic_font auto
      disable_ligatures always

      # background_opacity 0.85
      clear_all_mouse_actions yes
      hide_window_decorations yes

      background #1a1b26
      foreground #c0caf5
      selection_background #283457
      selection_foreground #c0caf5
      url_color #73daca
      cursor #c0caf5
      cursor_text_color #1a1b26

      # Tabs
      active_tab_background #7aa2f7
      active_tab_foreground #16161e
      inactive_tab_background #292e42
      inactive_tab_foreground #545c7e
      #tab_bar_background #15161e

      # Windows
      active_border_color #7aa2f7
      inactive_border_color #292e42

      # normal
      color0 #15161e
      color1 #f7768e
      color2 #9ece6a
      color3 #e0af68
      color4 #7aa2f7
      color5 #bb9af7
      color6 #7dcfff
      color7 #a9b1d6

      # bright
      color8  #414868
      color9  #ff899d
      color10 #9fe044
      color11 #faba4a
      color12 #8db0ff
      color13 #c7a9ff
      color14 #a4daff
      color15 #c0caf5

      # extended colors
      color16 #ff9e64
      color17 #db4b4b
    ";
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
