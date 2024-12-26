#!/bin/bash

unset var1
unset var2

# var1="name"

echo "$var1"

var2=${var1:=john}
# var2=${var1:-john}

echo "$var1" "$var2"
