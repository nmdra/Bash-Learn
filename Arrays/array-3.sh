#!/usr/bin/env bash

# Initialize the array
arr=(5 3 8 1 7 4)

# Print the original array
echo "Original array: ${arr[@]}"

# Perform the sorting
for ((i = 0; i < ${#arr[@]}; i++)); do
  for ((j = i; j < ${#arr[@]}; j++)); do
    # Compare and swap if necessary
    if [[ ${arr[i]} -gt ${arr[j]} ]]; then
      temp=${arr[i]}
      arr[i]=${arr[j]}
      arr[j]=$temp
    fi
  done
  # Print the array after each outer loop iteration
  echo "After iteration $((i + 1)): ${arr[@]}"
done

# Print the sorted array
echo "Sorted array: ${arr[@]}"
