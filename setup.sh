#!/bin/bash
cp .vimrc ~/
cp .tmux.conf ~/
cp .gitignore ~/
cp .gitconfig ~/
mkdir ~/.vim
mkdir ~/.vim/bundle
cp -r .vim/colors ~/.vim/
apt-get install tmux zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
