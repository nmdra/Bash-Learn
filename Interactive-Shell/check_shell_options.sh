#!/bin/bash

echo "shell options: $-"

# Check if the shell is interactive
if [[ $- == *i* ]]; then
  echo "Interactive shell detected."
else
  echo "Non-interactive shell (script mode)."
  # Start a new interactive shell if not in interactive mode
  echo "Starting a new interactive shell..."
  # exec bash -i
fi

# Check if debugging mode is enabled
if [[ $- == *x* ]]; then
  echo "Debugging mode is enabled."
else
  echo "Debugging mode is not enabled."
fi
