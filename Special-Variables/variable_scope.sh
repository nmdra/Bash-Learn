#!/bin/bash

var1='A'
var2='B'

my_function() {
  local var1='C' # Local Variable
  var2='D'       # Global Variable
  echo "Inside function: var1: $var1, var2: $var2"
}

echo "Before executing function: var1: $var1, var2: $var2"

my_function

echo "After executing function: var1: $var1, var2: $var2"
