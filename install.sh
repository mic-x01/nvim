#!/usr/bin/sh

EDITOR_NVIM=~/.config/nve
export EDITOR_NVIM

rm -rf $EDITOR_NVIM

mkdir -p $EDITOR_NVIM/share
mkdir -p $EDITOR_NVIM/nvim

stow --restow --target=$EDITOR_NVIM/nvim .

alias mnv='XDG_DATA_HOME=$EDITOR_NVIM/share XDG_COFIG_HOME=$EDITOR_NVIM nvim'

export mnv
