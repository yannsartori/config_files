#!/bin/bash
tmux new-session -d
tmux rename-session 'config'
tmux rename-window 'nvim'
tmux send-keys 'cd nvim ; nvim init.lua' C-m
tmux new-window
tmux rename-window 'tmux'
tmux send-keys 'cd tmux ; nvim tmux.conf' C-m
tmux new-window
tmux rename-window 'alacritty'
tmux send-keys 'cd alacritty ; nvim alacritty.yml' C-m
tmux a -t config:nvim
