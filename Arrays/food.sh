#!/usr/bin/env bash

declare -a lunch_options
work_dir=$(dirname "$(readlink -f "${0}")")
food_places="${work_dir}/food_places.txt"

terminate() {
  local -r msg="${1}"
  local -r code="${2:-150}"
  echo "${msg}" >&2
  exit "${code}"
}

if [[ ! -f "${food_places}" ]]; then
  terminate "Error: food_places.txt file doesn's exits" 150
fi

function fillout_array() {
  mapfile -d ":" -t lunch_options <"$food_places"

  if [[ "${#lunch_options[@]}" -eq 0 ]]; then
    terminate "Error: No food options left. Please add food options to food_places.txt" 180
  fi
}

fillout_array

echo "${lunch_options[@]}"
