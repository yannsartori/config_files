#!/bin/bash
tmux new-session -d
tmux rename-window 'config'
tmux rename-session 'config'
tmux split-window -h -p 50
tmux select-pane -t 0
tmux -2 attach-session

