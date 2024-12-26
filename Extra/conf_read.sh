#!/bin/bash

readonly CONF_FILE="config"

if [[ -f ${CONF_FILE} ]]; then
  source "${CONF_FILE}"
else
  firstname="Bob"
  lastname="Martin"
fi

echo "${firstname} $lastname"

exit 0
