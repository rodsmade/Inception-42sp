#!/bin/bash

RED='\033[0;31m'
RESET='\033[0m'

CONTAINER_NAME="nginx-inception"

# Check if the container exists (assumes it's stopped)
if docker ps -a -q --filter "name=${CONTAINER_NAME}" | grep -q . ; then
    printf "Removing container ${RED}${CONTAINER_NAME}${RESET}...\n"
    docker rm ${CONTAINER_NAME}
else
    printf "Container ${RED}${CONTAINER_NAME}${RESET} does not exist. No action needed.\n"
fi
