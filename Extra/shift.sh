#!/bin/bash

# The shift command in bash is used to manipulate
# positional parameters ($1, $2, $3, etc.) in a shell script.
# It removes the first positional parameter and shifts the remaining
# ones to the left, decreasing their positional index by 1.
# This is useful for iterating through command-line arguments or
# processing them one at a time.

while [ "$#" -gt 0 ]; do
  case "$1" in
  -h | --help)
    echo "Usage: ./script.sh [options]"
    exit 0
    ;;
  -v | --verbose)
    echo "Verbose mode enabled"
    ;;
  *)
    echo "Unknown option: $1"
    ;;
  esac
  shift
done
