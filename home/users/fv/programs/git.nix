{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Chame";
        email = "jsamuel.murrieta@gmail.com";
      };

      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = false;
      };

      push = {
        autoSetupRemote = true;
      };
    };
  };
}
