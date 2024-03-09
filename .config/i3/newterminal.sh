#!/bin/bash

# Finden Sie die aktive Terminal-ID
terminal_id=$(xdotool getactivewindow)

# Lesen Sie das Verzeichnis aus dem aktuellen Terminal
current_dir=$(xdotool getwindowname "$terminal_id" | cut -d ":" -f 2)
current_dir="${current_dir/\~/$HOME}"

# Starten Sie ein neues Terminalfenster und ändern Sie das Verzeichnis auf das aktuelle Verzeichnis
lxterminal --working-directory="$current_dir"

