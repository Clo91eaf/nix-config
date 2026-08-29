{ ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    settings = {
      font_family = "FiraCode Nerd Font";
      font_size = 12;
      mouse_hide_wait = 3;
      hide_window_decorations = "yes";
      cursor_blink_interval = 0.5;
      cursor_stop_blinking_after = 0;
    };
  };
}
