#!/usr/bin/env bash

set -e

CL_ARGS_ERROR=155
cals_per_step=0.04

terminate() {
  msg="${1}"
  code="${2:-160}"
  echo "Error: ${msg}" >&2
  exit "${code}"
}

if [[ $# -ne 1 ]]; then
  terminate "Please pass one argument" "${CL_ARGS_ERROR}"
fi

steps=${1}
cals_burned=$(echo "${steps} * ${cals_per_step}" | bc)
echo "Calories burned for ${steps} steps: ${cals_burned}"
exit 0
