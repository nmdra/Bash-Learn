#!/bin/bash

my_function() {
  local func_result="result"
  echo "$func_result"
}

func_result="$(my_function)"
echo "$func_result"
