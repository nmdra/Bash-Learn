#!/bin/bash
MY_PROMPT='$ '

# Function to execute commands safely
execute_command() {
  # Handle the "exit" command
  if [[ "$line" == "exit" ]]; then
    echo "Goodbye!"
    exit 0
  fi

  # Execute valid commands
  if command -v "${line%% *}" >/dev/null 2>&1; then
    eval "$line"
  else
    echo "Error: Command not found"
  fi
}

# Infinite loop for the shell
while :; do
  # Display prompt and read input
  echo -n "$MY_PROMPT"
  read -r line

  # Skip empty input
  [[ -z "$line" ]] && continue

  # Execute the command
  execute_command
done
