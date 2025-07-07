{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.home-manager.enable = true;

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  stylix.targets.alacritty.enable = false;
  stylix.targets.helix.enable = false;
  stylix.fonts = {

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
  };

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
    gnome-boxes
    kdePackages.kdenlive
    kdePackages.okular
    kdePackages.qtmultimedia
    kdePackages.yakuake
    kdePackages.filelight
    calibre
    efibootmgr
    keyd
    simple-scan
    kitty
    mangohud
    protonup
    yt-dlp
    lm_sensors
    base16-schemes
    roboto
    brave
    onlyoffice-desktopeditors
    mpv
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "hx";
    TERMINAL = "alacritty";
    BROWSER = "brave";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
  };

}
