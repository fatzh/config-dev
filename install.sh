#!/bin/sh

# linking the vimrc file
echo "Linking .vimrc file..."
ln -s "$PWD"/dot_vimrc ~/.vimrc
echo "Linking .vim directory..."
ln -s "$PWD"/dot_vim/ ~/.vim

# linking the tmux configuration
echo "Linking .tmux.conf file..."
ln -s "$PWD"/dot_tmux.conf ~/.tmux.conf
