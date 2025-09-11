#!/bin/bash
# kae3g's zsh config installer
# Created by Trish 💖

set -e

echo "✨ Installing kae3g's minimal zsh configuration..."

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "🎨 Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install plugins
echo "🔌 Installing zsh plugins..."

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Backup existing configs
echo "💾 Backing up existing configurations..."
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
[ -f ~/.p10k.zsh ] && mv ~/.p10k.zsh ~/.p10k.zsh.backup.$(date +%Y%m%d_%H%M%S)

# Copy new configs
echo "📋 Installing new configuration..."
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

echo "🎉 Installation complete!"
echo "💡 Run 'source ~/.zshrc' to reload your shell"
echo "✨ Enjoy your beautiful new terminal, darling!"
