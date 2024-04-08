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
    pkgs.termscp

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
    (pkgs.python3.withPackages(ps: with ps; [pip]))
    (pkgs.lua.withPackages(ps: with ps; [jsregexp]))
    pkgs.gcc
    pkgs.gnumake
    pkgs.nodejs

    # language tools
    pkgs.tree-sitter

    # language servers
    pkgs.nil # nix
    pkgs.marksman # markdown
    pkgs.lua-language-server
    pkgs.nodePackages.vscode-langservers-extracted # html, css, json, eslint
    pkgs.nodePackages.typescript-language-server
    pkgs.nodePackages.yaml-language-server
    pkgs.taplo # toml

    # formatters
    pkgs.alejandra # nix
    pkgs.nodePackages.prettier
    pkgs.stylua
    pkgs.shfmt # shell

    # linters
    pkgs.deadnix # nix
    pkgs.shellcheck
    pkgs.markdownlint-cli

    # dap (debugger tool)
    pkgs.vscode-extensions.vadimcn.vscode-lldb

    # wsl only
    pkgs.wslu # for xdg-open https://github.com/microsoft/WSL/issues/8892#issuecomment-1772972570

    # others
    pkgs.fzf
    pkgs.lazygit
    pkgs.neofetch
    pkgs.tealdeer
    pkgs.wl-clipboard
    pkgs.xdg-utils
  ];
  home.sessionVariables = {
    BROWSER = "wslview";
  };

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
