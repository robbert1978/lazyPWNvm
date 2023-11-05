#!/bin/sh

BASEDIR=$(dirname $0)

#Install zsh
sudo apt update
sudo apt install -y zsh

if grep -q -i Microsoft /proc/version; then
echo "WSL detected"
else
#Install fonts
mkdir -p ~/.fonts && \
cd ~/.fonts && \
wget https://github.com/owl4ce/dotfiles/releases/download/ng/Iosevka.Nerd.Font.Complete.Mono.ttf && \
wget https://github.com/owl4ce/dotfiles/releases/download/ng/M+.1mn.Nerd.Font.Complete.Mono.ttf && \
wget https://github.com/owl4ce/dotfiles/releases/download/ng/M+.1mn.Nerd.Font.Complete.ttf
cd ..
fc-cache -fv
fi

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Custom zsh
cp $BASEDIR/zshrc ~/.zshrc
cp $BASEDIR/robbert.zsh-theme ~/.oh-my-zsh/custom/themes/robbert.zsh-theme

#Install zsh plugins
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions


