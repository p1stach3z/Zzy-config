{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      nil
      lua-language-server
    ];

    plugins = {
      lsp = {
        enable = true;

        servers = {
          nil_ls.enable = true;
          lua_ls.enable = true;
        };
      };
    };
  };
}
