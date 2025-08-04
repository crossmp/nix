{ pkgs, ... }: {
  #programs.zsh.enable = true;

  users = {
    #defaultUserShell = pkgs.zsh;
    users.matt = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      packages = with pkgs; [
        tree
      ];
    };
  };

  #services.getty.autologinUser = user;
}
