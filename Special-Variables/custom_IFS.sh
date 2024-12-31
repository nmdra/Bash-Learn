#!/usr/bin/env bash

IFS=":"

elements="element1:elements2:element3"

for element in ${elements}; do
  echo "${element} is now separated from the
elements list"
done
