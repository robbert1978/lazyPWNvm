#!/bin/sh

#Install zsh
sudo apt update
sudo apt install -y zsh

#Install fonts
mkdir -p ~/.fonts && \
cd ~/.fonts && \
wget https://github.com/owl4ce/dotfiles/releases/download/ng/Iosevka.Nerd.Font.Complete.Mono.ttf && \
wget https://github.com/owl4ce/dotfiles/releases/download/ng/M+.1mn.Nerd.Font.Complete.Mono.ttf && \
wget https://github.com/owl4ce/dotfiles/releases/download/ng/M+.1mn.Nerd.Font.Complete.ttf
cd ..
fc-cache -fv

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Custom zsh
cd ~/
rm -rf ~/.zshrc && \
wget https://gist.github.com/robbert1978/912225ea9033e5cdc27a936f615220ff/raw/169dc4c5242cef58f943d9a974ab1c8c46f9d93a/.zshrc

rm -rf ~/.oh-my-zsh/customs/theme/robbert.zsh-theme && \
wget https://gist.github.com/robbert1978/912225ea9033e5cdc27a936f615220ff/raw/169dc4c5242cef58f943d9a974ab1c8c46f9d93a/robbert.zsh-theme

#Install zsh plugins
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions


