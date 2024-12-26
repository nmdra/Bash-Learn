#!/bin/bash

filename="/home/tux/downloads/test.txt"
echo "input: $filename"
echo "char count: ${#filename}"

basename=${filename##*/}
echo "basename: $basename"

dirname=${filename%/*}
echo "dirname: $dirname"

old="Good Moaning"
echo "$old"

new=${old/Moaning/Morning}
echo "$new"

string="Hello Bash!"
echo "input: $string"

echo ",,: ${string,,}"
echo "^^: ${string^^}"
