#!/usr/bin/env bash

declare -a nums=(4 2 0 6 8 1)

printf "%s\n" "Sorted array:" "$(printf "%s\n" "${nums[@]}" | sort)"
