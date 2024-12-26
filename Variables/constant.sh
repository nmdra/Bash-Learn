#!/bin/bash

readonly SERVERS='server1 server2 server3'

echo "Without Qoutes:"

for server in ${SERVERS}; do
  echo "${server}.example.com"
done

echo "With Qoutes:"

for server in "${SERVERS}"; do
  echo "${server}.example.com"
done
