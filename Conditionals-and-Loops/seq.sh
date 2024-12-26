#!/bin/bash

seq 1 5 | while read -r i; do
  echo "Iteration $i"
done
