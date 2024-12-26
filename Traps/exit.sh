#!/bin/bash

false | false | true
echo "${PIPESTATUS[@]}"

true | true
echo "The exit status of first command ${PIPESTATUS[0]}, and the second command ${PIPESTATUS[1]}"

true | false
echo "The exit status of first command ${PIPESTATUS[0]}, and the second command ${PIPESTATUS[1]}"

false | false | true
echo "The exit status of first command ${PIPESTATUS[0]}, second command ${PIPESTATUS[1]}, and third command ${PIPESTATUS[2]}"
