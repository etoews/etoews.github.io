#!/bin/bash

set -euo pipefail

unset ${!DOCKER_*}

docker run --rm --detach \
  --name jekyll \
  --volume=${PWD}:/srv/jekyll \
  --publish 4000:4000 \
  ${IMAGE}

echo -n "Waiting for jekyll to start"

until curl -s -q http://localhost:4000 > /dev/null; do
    sleep 1
    echo -n "."
done

echo ""

open http://localhost:4000

read -p "Press Enter to quit preview and kill container. " 2>/dev/null || {
  echo "Run 'docker rm -f jekyll' to stop the preview."
  exit 0
}

docker rm -f jekyll
