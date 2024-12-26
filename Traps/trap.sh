#!/bin/bash

exit_massage() {
  echo "exit status: $?"
  echo "Good Bye.."
}

trap exit_massage EXIT

exit_func() {
  exit 1
  # exit 0
}

exit_func
