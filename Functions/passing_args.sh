#!/bin/bash

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <name> <time_of_day>"
  exit 1
fi

greeting() {
  echo "Hello $1"
  echo "Good $2"
}

greeting "$1" "$2"

echo "$0 is completed."
