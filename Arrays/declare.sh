#!/usr/bin/env bash

declare -i i=10

# typeset -i i=10

echo $(($i + 1))

i="hello"

echo "${i}"
