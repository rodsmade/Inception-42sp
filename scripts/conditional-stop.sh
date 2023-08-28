#!/bin/bash

PURPLE='\033[0;35m'
RESET='\033[0m'

CONTAINER_NAME="nginx-inception"

# Check if the container is running
if docker ps -q --filter "name=${CONTAINER_NAME}" | grep -q . ; then
    printf "Stopping container ${PURPLE}${CONTAINER_NAME}${RESET}...\n"
    docker stop ${CONTAINER_NAME}
else
    printf "Container ${PURPLE}${CONTAINER_NAME}${RESET} is not running. No action needed.\n"
fi
