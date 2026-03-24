{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      stylua
      nixfmt
    ];

    plugins = {
      web-devicons.enable = true;

      telescope = {
        enable = true;
      };

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      lualine = {
        enable = true;
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lsp.enable = true;
    };

    colorschemes.gruvbox.enable = true;
  };
}
