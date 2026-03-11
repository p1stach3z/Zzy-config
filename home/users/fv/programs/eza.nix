
{ config, pkgs, lib, ... }:
{
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    colors = "always";
    icons = "always";
    extraOptions = [ "--group-directories-first" ];
  };

  xdg.configFile."eza/theme.yml".text = ''
    colourful: true
    filekinds:
      normal: {foreground: "#e0def4"}
      directory: {foreground: "#9ccfd8"}
      symlink: {foreground: "#524f67"}
      pipe: {foreground: "#908caa"}
      block_device: {foreground: "#ebbcba"}
      char_device: {foreground: "#f6c177"}
      socket: {foreground: "#21202e"}
      special: {foreground: "#c4a7e7"}
      executable: {foreground: "#c4a7e7"}
      mount_point: {foreground: "#403d52"}
    perms:
      user_read: {foreground: "#908caa"}
      user_write: {foreground: "#403d52"}
      user_execute_file: {foreground: "#c4a7e7"}
      user_execute_other: {foreground: "#c4a7e7"}
      group_read: {foreground: "#908caa"}
      group_write: {foreground: "#403d52"}
      group_execute: {foreground: "#c4a7e7"}
      other_read: {foreground: "#908caa"}
      other_write: {foreground: "#403d52"}
      other_execute: {foreground: "#c4a7e7"}
      special_user_file: {foreground: "#c4a7e7"}
      special_other: {foreground: "#403d52"}
      attribute: {foreground: "#908caa"}
    punctuation: {foreground: "#524f67"}
    date: {foreground: "#31748f"}
    inode: {foreground: "#908caa"}
    blocks: {foreground: "#6e6a86"}
    header: {foreground: "#908caa"}
    octal: {foreground: "#9ccfd8"}
    flags: {foreground: "#c4a7e7"}
    symlink_path: {foreground: "#9ccfd8"}
    control_char: {foreground: "#31748f"}
    broken_symlink: {foreground: "#eb6f92"}
    broken_path_overlay: {foreground: "#524f67"}
  '';
}
