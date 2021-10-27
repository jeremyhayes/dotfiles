#!/bin/bash

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
