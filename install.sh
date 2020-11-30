sudo apt-get install neovim python3-neovim
sudo apt-get install silversearcher-ag ripgrep bat fd-find  

# Neovim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#!/bin/bash
rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf ~/.tmux.conf.local
rm -rf ~/.gitconfig
rm -rf ~/.config/nvim

rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
ln -s ~/.dotfiles/.mygitconfig ~/.gitconfig
mkdir -p ~/.config
ln -s ~/.dotfiles/nvim ~/.config/nvim
