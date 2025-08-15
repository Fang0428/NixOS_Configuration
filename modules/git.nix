{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config = {
      init.defaultBranch = "main";

      color.ui = "auto";

      core = {
        editor = "nvim";
        autocrlf = "input";
        untrackedCache = true;
      };

      pull.rebase = true;

      rebase = {
        autoStash = true;
        updateRefs = true;
      };

      push.autoSetupRemote = true;

      fetch = {
        prune = true;
        pruneTags = true;
        parallel = 8;
        fsckobjects = true;
      };

      submodule.fetchJobs = 4;
      pack.threads = 0;
      transfer.fsckobjects = true;

      user = {
        name = "Fang0428";
        email = "zhengjun.fang0428@gmail.com";
      };

      credential.helper = "libsecret";

      url."https://github.com/".insteadOf = [
        "gh:"
        "github:"
      ];
    };
  };
}

