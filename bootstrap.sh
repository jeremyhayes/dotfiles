#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

link_file() {
    local src="$(pwd)/$1"
    local dst="$HOME/$1"

    if [ -f "$dst" ]; then
        mv "$dst" "$dst.bak"
    fi

    echo "Linking $src to $dst"
    ln -s "$src" "$dst"
}

link_file ".gitconfig"
link_file ".vimrc"
link_file "omp.json"

# homebrew not needed on codespace
[[ -z $CODESPACES ]] && bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# TODO reload session and install zsh via homebrew

# oh-my-zsh is already installed on codespace
[[ -z $CODESPACES ]] && bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
link_file ".zshrc"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
link_file ".p10k.zsh"
