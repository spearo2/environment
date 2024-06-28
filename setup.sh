#!/bin/bash
set -e

# install oh-my-zsh
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [[ ! -d $HOME/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>.zshrc
fi

ln -s -f $(pwd)/.bash_profile ~/.bash_profile
ln -s -f $(pwd)/.bashrc ~/.bashrc
ln -s -f $(pwd)/.zshrc ~/.zshrc
ln -s -f $(pwd)/.vim ~/.vim
rm -rf ~/.vim; cp -rf .vim ~/.vim
ln -s -f $(pwd)/.vimrc ~/.vimrc
ln -s -f $(pwd)/.screenrc ~/.screenrc
ln -s -f $(pwd)/.tmux.conf ~/.tmux.conf
ln -s -f $(pwd)/.tmux.conf.local ~/.tmux.conf.local
ln -s -f $(pwd)/nvim ~/.config/nvim
ln -s -f $(pwd)/.pylintrc ~/.pylintrc

chmod +x reserve.sh
echo "alias resp='$(pwd)/reserve.sh'" >> ~/.zshrc
chmod +x mail.py
echo "alias pmail='$(pwd)/mail.py'" >> ~/.zshrc
# python support for neovim
pip3 install pynvim
