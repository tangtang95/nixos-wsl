{ pkgs, ... }:

{
  home.packages = [
    pkgs.vim
  ];
  programs = {
    fish.enable = true;
    git = {
      enable = true;
      userName = "Tang-Tang Zhou";
      userEmail = "tangtang2995@gmail.com";
    };
  };
}
