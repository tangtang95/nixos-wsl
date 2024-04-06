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
    
    # language tools
    pkgs.tree-sitter

    # language servers
    pkgs.nil

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
      settings = {
        pane_frames = false;
        theme = "catppuccin-mocha";
        themes = {
          catppuccin-mocha = {
            bg = "#585b70";
            fg = "#cdd6f4";
            red = "#f38ba8";
            green = "#a6e3a1";
            blue = "#89b4fa";
            yellow = "#f9e2af";
            magenta = "#f5c2e7";
            orange = "#fab387";
            cyan = "#89dceb";
            black = "#181825";
            white = "#cdd6f4";
          };
        };
      };
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
