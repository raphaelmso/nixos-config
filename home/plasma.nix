{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.krohnkite
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
      splashScreen.engine = "none";
      splashScreen.theme = "none";
    };

    panels = [
      {
        location = "bottom";
        hiding = "autohide";
        height = 34;
        floating = false;
        opacity = "opaque";
      }
    ];

    hotkeys.commands = {
      launch-alacritty = {
        name = "Launch Alacritty";
        key = "Meta+T";
        command = "alacritty";
      };
      launch-brave = {
        name = "Launch Brave";
        key = "Meta+B";
        command = "brave";
      };
    };

    shortcuts = {
      ksmserver = {
        "Lock Session" = [
          "Screensaver"
          "Meta+Ctrl+L"
        ];
      };

      kwin = {
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";

        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Window Move Center" = "Ctrl+Alt+C";
        "Window Close" = "Meta+Q";
        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+%";

      };
    };

    window-rules = [
      {
        apply = {
          desktops = "Desktop_2";
        };
        description = "Assign Brave to Desktop 2";
        match = {
          window-class = {
            value = "brave-browser";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
      }
      {
        apply = {
          desktops = "Desktop_3";
        };
        description = "Assign Obsidian to Desktop 3";
        match = {
          window-class = {
            value = "obsidian";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
      }
      {
        apply = {
          desktops = "Desktop_4";
        };
        description = "Assign Anki to Desktop 4";
        match = {
          window-class = {
            value = "anki";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
      }
    ];

    krunner = {
      activateWhenTypingOnDesktop = false;
      position = "center";
      shortcuts.launch = "Meta";
    };

    kwin = {
      virtualDesktops.names = [
        "Desktop 1"
        "Desktop 2"
        "Desktop 3"
        "Desktop 4"
        "Desktop 5"
      ];
      effects = {
        shakeCursor.enable = false;
        blur.enable = false;
        cube.enable = false;
        desktopSwitching.animation = "off";
        dimAdminMode.enable = false;
        dimInactive.enable = false;
        fallApart.enable = false;
        fps.enable = false;
        minimization.animation = "off";
        slideBack.enable = false;
        snapHelper.enable = false;
        translucency.enable = false;
        windowOpenClose.animation = "off";
        wobblyWindows.enable = false;
      };
    };

    # overrideConfig = true;
    configFile = {
      kwinrc = {
        Plugins = {
          krohnkiteEnabled = true;
        };
        "Script-krohnkite" = {
          screenGapBetween = 5;
          screenGapBottom = 5;
          screenGapLeft = 5;
          screenGapRight = 5;
          screenGapTop = 5;
        };
      };
    };

  };
}
