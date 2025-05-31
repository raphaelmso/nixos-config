{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    helix
  ];
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";

      editor = {

        bufferline = "always";
        line-number = "relative";
        mouse = false;
        end-of-line-diagnostics = "hint";

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        inline-diagnostics = {
          cursor-line = "error";

        };
      };
      keys.normal = {
        space.l = [
          ":write-all"
          ":new"
          ":insert-output lazygit"
          ":set mouse false" # First disable mouse to hint helix into activating it
          ":set mouse true"
          ":buffer-close!"
          ":redraw"
          ":reload-all"
        ];
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
      {
        name = "rust";
        auto-format = true;
      }
    ];
  };
}
