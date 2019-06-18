brew install --HEAD nvim
brew install the_silver_searcher ripgrep fd bat
brew upgrade git
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

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
