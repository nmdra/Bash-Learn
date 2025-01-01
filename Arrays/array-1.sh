#!/usr/bin/env bash

declare -a servers=("server1" "server2" "server3")

echo "${servers[@]}"

unset servers[1]

echo "${servers[@]:-empty array}"

unset servers

echo "${servers[@]:-empty array}"
