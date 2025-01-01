#!/usr/bin/env bash

# Function to display usage instructions
usage() {
  echo "Usage: $0 [arguments...]"
  echo "Pass one or more arguments to see them processed."
  exit 1
}

# Check if no arguments are passed
if [[ $# -eq 0 ]]; then
  echo "Error: No arguments provided."
  usage
fi

# Display the number of arguments
echo "Number of arguments: $#"

# Display all arguments as a single string
echo "All arguments: $*"

# Display all arguments individually (safely handling spaces)
for arg in "$@"; do
  echo "Argument: $arg"
done

# Additional functionality: Reverse the arguments
echo "Arguments in reverse order:"
for ((i = $#; i > 0; i--)); do
  eval "echo \"Argument: \${$i}\""
done

exit 0
