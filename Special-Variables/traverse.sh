#!/usr/bin/env bash

# Get the directory of the script
readonly WORK_DIR=$(dirname "$(readlink -f "$0")")

# Get the name of the script
readonly SCRIPT_NAME="${0##*/}"

# Change to the parent directory of the script's directory
cd "${WORK_DIR}/.."

# Print useful information for debugging
echo "Script Name: ${SCRIPT_NAME}"
echo "Working Directory: ${WORK_DIR}"
