{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    foot.terminfo # Fixes missing colors/glitches when SSHing into this machine
  ];

  programs.foot = {
    enable = true;

    # 2. Performance: Start Foot as a background daemon.
    # New windows open instantly and share memory.
    server.enable = true;

    settings = {
      main = {
        # Font & Spacing (The Fix for 'Gapped' text)
        font = "JetBrainsMono NF:size=14";
        letter-spacing = 0;
        dpi-aware = "yes";
        pad = "15x15 center"; # 'center' keeps things symmetrical

        # Terminal Type (The "Compatibility" Fix)
        # Using 'foot' is technically correct, but 'xterm-256color'
        # ensures colors work everywhere without installing terminfo.
        term = "xterm-256color";
      };

      scrollback = {
        lines = 10000;
        multiplier = 3.0; # Faster scrolling with mouse wheel
      };

      url = {
        # Jump to URLs using keyboard: Ctrl+Shift+u
        launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
        label-letters = "sadfjklewri"; # High-priority home row keys
        osc8-underline = "always";
      };

      cursor = {
        style = "beam";
        blink = "yes";
        beam-thickness = 1.5;
      };

      # Fix: Modern foot uses [colors-dark]
      colors-dark = {
        # Gruvbox Dark (Hard Contrast)
        background = "1d2021";
        foreground = "ebdbb2";
        regular0 = "282828"; # black
        regular1 = "cc241d"; # red
        regular2 = "98971a"; # green
        regular3 = "d79921"; # yellow
        regular4 = "458588"; # blue
        regular5 = "b16286"; # magenta
        regular6 = "689d6a"; # cyan
        regular7 = "a89984"; # white
        bright0 = "928374"; # gray
        bright1 = "fb4934"; # red
        bright2 = "b8bb26"; # green
        bright3 = "fabd2f"; # yellow
        bright4 = "83a598"; # blue
        bright5 = "d3869b"; # magenta
        bright6 = "8ec07c"; # cyan
        bright7 = "ebdbb2"; # white
      };

      # Optional: Copy to clipboard on select
      mouse = {
        selection-override-modifiers = "Shift";
      };
    };
  };
}
