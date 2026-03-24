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

      backup = true;
      writebackup = true;
      swapfile = true;
      undofile = true;

      backupext = ".bak";

      backupdir = [ "~/.local/state/nvim/backup//" ];
      directory = [ "~/.local/state/nvim/swap//" ];
      undodir = [ "~/.local/state/nvim/undo//" ];

    };
    
    globals.mapleader = " ";
    colorschemes.gruvbox.enable = true;

  };

  home.file.".local/state/nvim/backup/.keep".text = "";
  home.file.".local/state/nvim/swap/.keep".text = "";
  home.file.".local/state/nvim/undo/.keep".text = "";

}
