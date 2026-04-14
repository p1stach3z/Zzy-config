{ config, lib, pkgs, ... }:

let
  vaultRelPath = "Files/Obsidian/SecondBrain";
  vaultPath = "${config.home.homeDirectory}/${vaultRelPath}";

  obsidianAppJson = builtins.toJSON {
    attachmentFolderPath = "Assets";
    alwaysUpdateLinks = true;
    promptDelete = false;
    showLineNumber = true;
    tabSize = 2;
    newFileLocation = "folder";
    newFileFolderPath = "Inbox";
    useMarkdownLinks = true;
    readableLineLength = true;
    showUnsupportedFiles = false;
    userIgnoreFilters = [
      ".DS_Store"
      "node_modules/"
    ];
  };

  obsidianAppearanceJson = builtins.toJSON {
    theme = "obsidian";
    cssTheme = "";
    accentColor = "";
    interfaceFontFamily = "";
    textFontFamily = "";
    monospaceFontFamily = "";
    baseFontSize = 16;
    enabledCssSnippets = [ ];
    nativeMenus = false;
  };

  obsidianCorePluginsJson = builtins.toJSON [
    "file-explorer"
    "global-search"
    "switcher"
    "graph"
    "backlink"
    "outgoing-link"
    "tag-pane"
    "page-preview"
    "templates"
    "daily-notes"
    "command-palette"
    "editor-status"
    "outline"
  ];

  obsidianCommunityPluginsJson = builtins.toJSON [ ];

  dailyNotesJson = builtins.toJSON {
    folder = "Daily";
    template = "Templates/Daily Note.md";
    format = "YYYY-MM-DD";
    autorun = false;
  };

  templatesJson = builtins.toJSON {
    folder = "Templates";
  };
in
{
  home.packages = with pkgs; [
    obsidian
  ];

  home.activation.createObsidianVaultDirs =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "${vaultPath}"
      mkdir -p "${vaultPath}/.obsidian"
      mkdir -p "${vaultPath}/.obsidian/plugins"
      mkdir -p "${vaultPath}/Inbox"
      mkdir -p "${vaultPath}/Projects"
      mkdir -p "${vaultPath}/Areas"
      mkdir -p "${vaultPath}/Resources"
      mkdir -p "${vaultPath}/Archive"
      mkdir -p "${vaultPath}/Templates"
      mkdir -p "${vaultPath}/Assets"
      mkdir -p "${vaultPath}/Daily"
    '';

  home.file."${vaultRelPath}/.obsidian/app.json".text = obsidianAppJson;
  home.file."${vaultRelPath}/.obsidian/appearance.json".text = obsidianAppearanceJson;
  home.file."${vaultRelPath}/.obsidian/core-plugins.json".text = obsidianCorePluginsJson;
  home.file."${vaultRelPath}/.obsidian/community-plugins.json".text = obsidianCommunityPluginsJson;
  home.file."${vaultRelPath}/.obsidian/daily-notes.json".text = dailyNotesJson;
  home.file."${vaultRelPath}/.obsidian/templates.json".text = templatesJson;

  home.file."${vaultRelPath}/Templates/Default Note.md".text = ''
    ---
    created: {{date:YYYY-MM-DD}}
    tags:
    ---
    
    # {{title}}
    
  '';

  home.file."${vaultRelPath}/Templates/Daily Note.md".text = ''
    ---
    date: {{date:YYYY-MM-DD}}
    tags: [daily]
    ---
    
    # {{date:dddd, D MMMM YYYY}}
    
    ## Focus
    
    - 
    
    ## Notes
    
    - 
    
    ## Next
    
    - 
  '';

  xdg.desktopEntries.obsidian-second-brain = {
    name = "Obsidian Second Brain";
    exec = "obsidian ${vaultPath}";
    terminal = false;
    categories = [ "Office" "Utility" ];
  };

}


