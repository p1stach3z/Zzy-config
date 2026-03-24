{ ... }:
{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = false;

      tabstop = 2;
      shiftwidth = 4;
      expandtab = true;
      smartindent = true;

      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      wrap = false;
      ignorecase = true;
      smartcase = true;
      updatetime = 250;
    };

    globals.mapleader = " ";
  };
}
