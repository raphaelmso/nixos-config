{
  pkgs,
  lib,
  ...
}:
{
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
