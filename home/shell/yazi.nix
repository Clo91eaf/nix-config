{ config, ... }:
let
  configFile = "${config.home.homeDirectory}/nix-config/home/shell/yazi.toml";
in
{
  programs.yazi = {
    enable = true;
    # settings = {
    #   mgr = {
    #     ratio = [
    #       1
    #       2
    #       4
    #     ];
    #     sort_by = "natural";
    #     sort_sensitive = true;
    #     sort_reverse = false;
    #     sort_dir_first = true;
    #     linemode = "none";
    #     show_hidden = true;
    #     kkshow_symlink = true;
    #   };

    #   preview = {
    #     image_filter = "lanczos3";
    #     image_quality = 90;
    #     tab_size = 1;
    #     cache_dir = "";
    #     max_width = 800;
    #     max_height = 1600;
    #     ueberzug_scale = 1;
    #     ueberzug_offset = [
    #       0
    #       0
    #       0
    #       0
    #     ];
    #   };

    #   tasks = {
    #     micro_workers = 5;
    #     macro_workers = 10;
    #     bizarre_retry = 5;
    #   };
    # };
  };

  # https://nixos-and-flakes.thiscute.world/zh/best-practices/accelerating-dotfiles-debugging
  # Symlink the external config file into the home manager config
  xdg.configFile."yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink configFile;
}
