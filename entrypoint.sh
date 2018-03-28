#!/bin/bash
set -e

echo "==> Launching the Docker daemon..."
CMD=$*
if [ "$CMD" == '' ];then
  dind dockerd $DOCKER_EXTRA_OPTS
  check_docker
else
  dind dockerd $DOCKER_EXTRA_OPTS &
  while(! docker info > /dev/null 2>&1); do
      echo "==> Waiting for the Docker daemon to come online..."
      sleep 1
  done
  echo "==> Docker Daemon is up and running!"
  echo "==> Running CMD $CMD!"
  exec "$CMD"
fi
