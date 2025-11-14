# Dotfiles

> "There is nothing outside of yourself that can ever enable you to get better, stronger, richer, quicker, or smarter. Everything is within." - Miyamoto Musashi

My personal development environment configuration files.

## Contents

- **zsh/** - Zsh shell configuration
- **kitty/** - Kitty terminal emulator configuration
- **starship/** - Starship prompt configuration
- **scripts/** - Utility scripts and helpers

## Philosophy

These dotfiles follow the way of Musashi: simple, focused, and effective. Every configuration serves a purpose. Nothing wasted.

## Installation

### Prerequisites

```bash
brew install fzf starship
brew install --cask kitty
```

### Setup

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

# Run the installer
cd ~/dotfiles
./install.sh
```

## Features

### Zsh Configuration

- Fish-like autosuggestions
- Syntax highlighting
- History substring search
- fzf integration
- Starship prompt

### Kitty Terminal

- GPU-accelerated rendering
- Beautiful color scheme
- Sensible keybindings
- macOS native integration

### Development Workflow

Smart aliases for:
- pnpm workflows
- Git operations
- Quick navigation
- Deployment

## Structure

```
~/dotfiles/
├── zsh/
│   └── .zshrc
├── kitty/
│   └── kitty.conf
├── starship/
│   └── starship.toml
├── scripts/
│   └── install.sh
└── README.md
```

## Notes

- Secrets are kept in `~/.zsh_secrets` (not tracked)
- Plugins are installed in `~/.zsh/`
- Configurations use symlinks to this repo

## Inspiration

- [Yagasaki7K](https://github.com/Yagasaki7K) - For the clean zsh setup
- [Miyamoto Musashi](https://en.wikipedia.org/wiki/Miyamoto_Musashi) - For the wisdom

---

> "The way is in training." - Miyamoto Musashi
