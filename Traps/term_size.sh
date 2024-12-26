#!/bin/bash
# term_size - Dynamically display terminal window size
redraw() {
  clear
  echo "Width = $(tput cols) Height = $(tput lines)"
}
trap redraw WINCH
redraw

# This infinite loop continuously executes without any pause,
# consuming CPU cycles unnecessarily.
while true; do
  :
done
