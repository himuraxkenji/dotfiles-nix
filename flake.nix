{
  description = "himura dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";  # Home Manager repository
      inputs.nixpkgs.follows = "nixpkgs";  # Follow nixpkgs input
    };
    flake-utils.url = "github:numtide/flake-utils";  # Flake utilities
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      unstablePkgs = import nixpkgs-unstable {
        system = "aarch64-darwin";  # Make sure this matches your system
        config.allowUnfree = true;
      };
      system = "aarch64-darwin";  # Make sure this matches your system
      pkgs = import nixpkgs { inherit system; };  # Import nixpkgs for the specified system
    in {
      homeConfigurations = {
        "himura" =
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./nushell.nix  # Nushell configuration
              ./ghostty.nix  # Ghostty configuration
              ./zed.nix  # Zed configuration
              ./wezterm.nix  # WezTerm configuration
              # ./zellij.nix  # Zellij configuration (commented out)
              ./fish.nix  # Fish shell configuration
              ./starship.nix  # Starship prompt configuration
              ./nvim.nix  # Neovim configuration
              ./zsh.nix  # Zsh configuration
              {
                # Personal data
                home.username = "himuraxkenji";  # Replace with your username
                home.homeDirectory = "/Users/himuraxkenji/";  # Replace with your home directory
                home.stateVersion = "24.11";  # State version

                home.packages = with pkgs; [
                  # ─── Terminals and utilities ───
                  # zellij
                  fish
                  zsh
                  nushell

                  # ─── Development tools ───
                  volta
                  carapace
                  zoxide
                  atuin
                  jq
                  bash
                  starship
                  fzf
                  unstablePkgs.neovim
                  nodejs
                  bun
                  cargo

                  # ─── Compilers and system utilities ───
                  go
                  nil
                  unstablePkgs.goose-cli
                  zulu21
                  gcc
                  fd
                  ripgrep
                  coreutils
                  bat
                  lazygit
                  yazi

                  # ─── Nerd Fonts ───
                  nerd-fonts.iosevka-term
                ];
              }
            ];
          };
      };
    };
}
