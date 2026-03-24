{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };
  };

  qt = {
    enable = true;

    platformTheme = "gtk";  # 👈 hace que Qt respete GTK

    style = {
      name = "Adwaita";
    };
  };
  
  }
