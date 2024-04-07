{ config, pkgs, ... }:

{
  home.packages = [
    # new coreutils
    pkgs.ripgrep
    pkgs.fd
    pkgs.bat
    pkgs.bottom
    pkgs.du-dust
    pkgs.sd
    pkgs.procs

    # web tools
    pkgs.wget
    pkgs.httpie

    # file processors
    pkgs.jq
    pkgs.jqp
    pkgs.yq
    pkgs.zip
    pkgs.unzip

    # text editors
    pkgs.vim
    pkgs.delta

    # languages
    pkgs.rustup
    pkgs.python3
    pkgs.lua
    pkgs.gcc
    pkgs.nodejs
    
    # language tools
    pkgs.tree-sitter

    # language servers
    pkgs.nil
    pkgs.marksman

    # formatters and linters
    pkgs.nix
    pkgs.shellcheck

    # others
    pkgs.fzf
    pkgs.lazygit
    pkgs.neofetch
    pkgs.tealdeer
    pkgs.wl-clipboard
  ];

  # zellij static config file (because limitation in nix to kdl converter)
  xdg.configFile."zellij/config.kdl".source = ./config/zellij.kdl;

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
    };
    eza = {
      enable = true;
      enableAliases = true;
      icons = true;
    };
    zoxide = {
      enable = true;
    };
    starship = {
      enable = true;
    };
    zellij = {
      enable = true;
      enableFishIntegration = true;
    };
    git = {
      enable = true;
      userName = "Tang-Tang Zhou";
      userEmail = "tangtang2995@gmail.com";
      aliases = {
        pfl = "push --force-with-lease";
        log1l = "log --oneline";
      };
      extraConfig = {
        push = {
          default = "current";
          autoSetupRemote = true;
        };
        pull = {
          rebase = true;
        };
        init = {
          defaultBranch = "main";
        };
        credential.helper = "store";
      };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}
