#!/usr/bin/env bash

# declare -a servers=("server1" "server2" "server3")

servers="server1 server2 server3"

for server in ${servers}; do
  if [[ "${server}" == "server2" ]]; then
    server="${server}.local"
  fi
  echo "${server}"
done

# Define Array
animals=("Cat" "Dog" "Tux")

echo "${#animals[@]}"
echo "${animals[@]}"

echo "${animals[0]}"
echo "${animals[1]}"
echo "${animals[2]}"

echo "${animals[@]:1:2}"

# Modify the array
animals=("${animals[@]:0:1}" "Bear" "${animals[@]:1}")

# Print all elements of the modified array
echo "${animals[@]}"
