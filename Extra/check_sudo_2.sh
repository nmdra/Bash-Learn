#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Get the current user
user="$(id -un 2>/dev/null || true)"

# Default command execution method
sh_c='sh -c'

# Check if the current user is root
if [ "$user" != 'root' ]; then
  if command_exists sudo; then
    # Use sudo if available
    sh_c='sudo -E sh -c'
  elif command_exists su; then
    # Fallback to su if sudo is not available
    sh_c='su -c'
  else
    # Neither sudo nor su is available
    cat >&2 <<EOF
Error: This script requires the ability to run commands as root.
Neither "sudo" nor "su" is available on this system.
Please install one of these tools or run as root.
EOF
    exit 1
  fi
fi

# Additional commands can go here
echo "Script executed successfully!"
