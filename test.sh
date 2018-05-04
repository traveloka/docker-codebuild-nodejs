#!/bin/sh
set -euo pipefail

IMAGE_NAME="${1}"
DOCKER=$(which docker)
DOCKER_RUN="${DOCKER} run --rm -t ${IMAGE_NAME}"

echo -n "Check nodejs: "
${DOCKER_RUN} node --version && echo -e "OK\n"

echo -n "Check yarn: "
${DOCKER_RUN} yarn --version && echo -e "OK\n"

echo -n "Check chrome browser: "
${DOCKER_RUN} chrome --version && echo -e "OK\n"

echo -n "Check aws cli: "
${DOCKER_RUN} aws --version && echo -e "OK\n"

echo -n "Check Docker client: "
${DOCKER_RUN} docker --version && echo -e "OK\n"

echo -n "Check Docker server: "
${DOCKER_RUN} docker-containerd --version && echo -e "OK\n"


