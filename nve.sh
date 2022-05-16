#!/usr/bin/sh

EDITOR_NVIM=~/.config/nve
export EDITOR_NVIM

alias nve='XDG_DATA_HOME=$EDITOR_NVIM/share XDG_CONFIG_HOME=$EDITOR_NVIM nvim'
export nve

nve
