{ pkgs, config, lib, ... }: 

{ 

  programs.git = {
    enable = true;
    userName = "p1stach3z";
    userEmail = "jsamuel.murrieta@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      core.editor = "nvim";
    };

    aliases = {
      st = "status";
      co = "checkout";
      ci = "commit";
      br = "branch";
      lg = "log --oneline --graph --decorate";
    };
  };


}
