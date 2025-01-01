#!/usr/bin/env bash

declare -a array=("One" "Two" "Three")

echo "${array[@]}"

array+=("Four" "Five" "Six")

echo "${array[@]}"
