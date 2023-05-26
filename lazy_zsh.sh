#!/bin/sh

#Install zsh
sudo apt update
sudo apt install -y zsh

#Install fonts
mkdir -p ~/.fonts && \
wget https://github.com/owl4ce/dotfiles/releases/download/ng/Iosevka.Nerd.Font.Complete.Mono.ttf && \
wget https://github.com/owl4ce/dotfiles/releases/download/ng/M+.1mn.Nerd.Font.Complete.Mono.ttf && \
wget https://github.com/owl4ce/dotfiles/releases/download/ng/M+.1mn.Nerd.Font.Complete.ttf
cd ..
fc-cache -fv

#Custom zsh
cd ~/
rm -rf ~/.zshrc && \
wget https://raw.githubusercontent.com/owl4ce/dotfiles/c5c33b46ef90131fff88c2b9b954cab27e0b0972/EXTRA_JOYFUL/.zshrc

#Install zsh plugins
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
