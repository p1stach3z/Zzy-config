{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      stylua
      nixfmt
      nil
      lua-language-server
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

        settings = {
          snippet.expand = "function(args) vim.snippet.expand(args.body) end";

          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<C-Space>" = "cmp.mapping.complete()";
          };

          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
        };
      };

      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lsp.enable = true;
    };

  };
}
