{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.home-manager.enable = true;

  imports = [
    ./development/tools/helix.nix
    ./development/tools/alacritty.nix
    ./development/tools/zsh.nix
    ./development/tools/zellij.nix
    ./development/tools/git.nix

    ./development/langs/nix.nix
    ./development/langs/rust.nix

    ./plasma.nix

  ];
  home.username = "raphael";
  home.homeDirectory = "/home/raphael";

  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    nerd-fonts.jetbrains-mono
    alacritty
    gimp
    handbrake
    vlc
    discord
    obsidian
    anki
    spotify
    fastfetch
    brave
    gnome-boxes
    kdePackages.kdenlive
    kdePackages.okular
    calibre
    efibootmgr
    keyd
    simple-scan
    evince
    mangohud
    protonup
    yt-dlp
    lm_sensors
    base16-schemes
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "hx";
    TERMINAL = "alacritty";
    BROWSER = "brave";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
  };

}
