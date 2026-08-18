# dotfiles

Minimal and functional Linux configuration.

## Components

- Window Manager: i3
- Status Bar: polybar, i3blocks, i3status-rust
- Terminal: kitty, alacritty, wezterm
- Shell: zsh (Oh My Zsh, Powerlevel10k, zoxide)
- Editor: Neovim (Lazy.nvim, Lua-based)
- File Manager: yazi
- Music: mpd, rmpc (RON config)
- Clipboard: clipcat
- Notifications: dunst
- Compositor: picom

## Installation

Configurations are organized for use with GNU Stow.

```bash
git clone https://github.com/On3Human/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Example: Stow a specific configuration
stow nvim
stow i3
```

## Structure

- aliases.zsh: Shortcuts for pacman, nvim, taskwarrior, and system tools.
- scripts/: Custom utilities for monitoring and automation.
- nvim/: Modular configuration with support for C, LSP, and multiple themes.
- i3status-rust/: Themed bar configs including Gruvbox and Nord.

## Scripts

- systmed_failure_detector.sh: Monitors systemd service health.
- ytdlp_search.sh: CLI-based YouTube search and download.
- battery.sh, cpu.sh, memory.sh, disk.sh: System resource monitoring.
- man_page_search.sh: Man page reference utility.
- wallpaper.sh: Wallpaper management.
