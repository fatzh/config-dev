#!/bin/sh

# linking the vimrc file
echo "Linking .vimrc file..."
if [ -f ~/.vimrc ] ; then
  rm ~/.vimrc
fi
ln -s "$PWD"/dot_vimrc ~/.vimrc
echo "Linking .vim directory..."
if [ -d ~/.vim ] ; then
  rm ~/.vim
fi
ln -s "$PWD"/dot_vim/ ~/.vim

# linking the tmux configuration
echo "Linking .tmux.conf file..."
if [ -f ~/.tmux.conf ] ; then
  rm ~/.tmux.conf 
fi
ln -s "$PWD"/dot_tmux.conf ~/.tmux.conf

# and tmuxinator
echo "Linking .tmuxinator directory..."
if [ -d ~/.tmuxinator ] ; then
  rm ~/.tmuxinator
fi
ln -s "$PWD"/dot_tmuxinator ~/.tmuxinator

# and zsh stuff
echo "Linking .zshrc and .zpreztorc"
if [ -f ~/.zshrc ] ; then
  rm ~/.zshrc
fi
ln -s "$PWD"/dot_zshrc ~/.zshrc
if [ -f ~/.zpreztorc ] ; then
  rm ~/.zpreztorc
fi
ln -s "$PWD"/dot_zpreztorc ~/.zpreztorc
if [ -d ~/.zsh.prompts ] ; then
  rm ~/.zsh.prompts
fi
ln -s "$PWD"/dot_zsh.prompts ~/.zsh.prompts
# and vifm
echo "Linking .vifm directory..."
if [ -d ~/.vifm ] ; then
  rm ~/.vifm
fi
ln -s "$PWD"/dot_vifm ~/.vifm
