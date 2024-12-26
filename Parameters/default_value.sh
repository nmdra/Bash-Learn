#!/bin/bash

_mkdir() {
  local dir="$1"
  local permission=${2:-0755}
  [ $# -eq 0 ] && {
    echo "$0: dirname"
    return
  }
  [ ! -d "$dir" ] && mkdir --mode "$permission" -p "$dir"
}

_mkdir "test" 0644
_mkdir "test-2" 8929 # invalid value
_mkdir "test-3"      # default value
