#!/bin/bash
# term_size2 - Dynamically display terminal window size

redraw() {
  clear
  echo "Width = $(tput cols) Height = $(tput lines)"
}

trap redraw WINCH

# Display the initial size
redraw

while true; do
  sleep 0.1 # Wait for 0.1 seconds
done
