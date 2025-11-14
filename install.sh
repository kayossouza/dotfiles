#!/usr/bin/env bash

# ============================================================================
# DOTFILES INSTALLER
# ============================================================================
# "The way of the warrior is resolute acceptance of death. Decide
#  to kill. Decide to die." - Miyamoto Musashi
# ============================================================================

set -e

echo "============================================================================"
echo "Installing dotfiles..."
echo "\"From one thing, know ten thousand things.\" - Miyamoto Musashi"
echo "============================================================================"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Directories
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Check if we're in the right directory
if [ ! -f "$DOTFILES_DIR/install.sh" ]; then
    echo -e "${RED}Error: Please run this script from the dotfiles directory${NC}"
    exit 1
fi

# Create necessary directories
echo -e "${GREEN}Creating directories...${NC}"
mkdir -p "$CONFIG_DIR"
mkdir -p "$HOME/.zsh"

# Install zsh plugins
echo -e "${GREEN}Installing zsh plugins...${NC}"

if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
fi

if [ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.zsh/zsh-syntax-highlighting"
fi

if [ ! -d "$HOME/.zsh/zsh-history-substring-search" ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search "$HOME/.zsh/zsh-history-substring-search"
fi

# Backup existing configs
echo -e "${YELLOW}Backing up existing configs...${NC}"

if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d%H%M%S)"
fi

if [ -f "$CONFIG_DIR/kitty/kitty.conf" ]; then
    mv "$CONFIG_DIR/kitty/kitty.conf" "$CONFIG_DIR/kitty/kitty.conf.backup.$(date +%Y%m%d%H%M%S)"
fi

if [ -f "$CONFIG_DIR/starship.toml" ]; then
    mv "$CONFIG_DIR/starship.toml" "$CONFIG_DIR/starship.toml.backup.$(date +%Y%m%d%H%M%S)"
fi

# Create symlinks
echo -e "${GREEN}Creating symlinks...${NC}"

ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
mkdir -p "$CONFIG_DIR/kitty"
ln -sf "$DOTFILES_DIR/kitty/kitty.conf" "$CONFIG_DIR/kitty/kitty.conf"
ln -sf "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"

# Check for required tools
echo -e "${GREEN}Checking for required tools...${NC}"

if ! command -v fzf &> /dev/null; then
    echo -e "${YELLOW}fzf not found. Install with: brew install fzf${NC}"
fi

if ! command -v starship &> /dev/null; then
    echo -e "${YELLOW}starship not found. Install with: brew install starship${NC}"
fi

if ! command -v kitty &> /dev/null; then
    echo -e "${YELLOW}kitty not found. Install with: brew install --cask kitty${NC}"
fi

# Create secrets file if it doesn't exist
if [ ! -f "$HOME/.zsh_secrets" ]; then
    echo -e "${GREEN}Creating .zsh_secrets file...${NC}"
    cat > "$HOME/.zsh_secrets" << 'EOF'
# ============================================================================
# ZSH SECRETS
# ============================================================================
# "The warrior who trusts his path doesn't need to prove the other is wrong." - Miyamoto Musashi
#
# Store your API keys, tokens, and sensitive environment variables here.
# This file is gitignored and will never be committed.
# ============================================================================

# Example:
# export OPENAI_API_KEY="your-key-here"
# export GITHUB_TOKEN="your-token-here"
EOF
fi

echo ""
echo "============================================================================"
echo -e "${GREEN}Installation complete!${NC}"
echo "\"The way is in training.\" - Miyamoto Musashi"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Open Kitty terminal"
echo "  3. Add your secrets to ~/.zsh_secrets"
echo "============================================================================"
