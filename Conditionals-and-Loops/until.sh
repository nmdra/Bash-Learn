#!/bin/bash

i=3

until [[ $i -eq 0 ]]; do
  echo "Iteration $i"
  i=$((i - 1))
done
