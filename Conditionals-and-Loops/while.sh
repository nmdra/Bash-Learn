#!/bin/bash

i=1

while [[ $i -le 3 ]]; do
  echo "Iteration $i"
  i=$((i + 1)) # arithmatic exapansion
done
