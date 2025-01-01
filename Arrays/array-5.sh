#!/usr/bin/env bash

# Declare an associative array
declare -A chest_drawer=(
  ["shirts"]="T-Shirts and polo shirts"
  ["sports"]="All sorts of Sports Clothing here"
  ["socks"]="Formal and everyday socks"
  ["jeans"]="Jeans, and some casual dress shorts"
)

# Access and print a specific key's value
echo "Socks drawer contains: ${chest_drawer["socks"]}"

# Iterate over all keys and values in the associative array
echo -e "\nFull contents of the chest drawer:"
for key in "${!chest_drawer[@]}"; do
  echo "${key}: ${chest_drawer[$key]}"
done
