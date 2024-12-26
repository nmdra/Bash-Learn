#!/bin/bash

my_function() {
  echo "some result"
  return 55
}

my_function
echo $? # we're using $? to read return value
