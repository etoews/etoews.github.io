#!/bin/bash

set -euo pipefail

unset ${!DOCKER_*}

docker pull grahamc/jekyll

docker run --rm --detach \
  --name jekyll \
  --volume=$(pwd):/src \
  --publish 4000:4000 \
  grahamc/jekyll \
  serve --watch --future --drafts --force_polling --host 0.0.0.0

echo -n "Waiting for jekyll to start"

until curl -s -q http://localhost:4000 > /dev/null; do
    sleep 1
    echo -n "."
done

echo ""

open http://localhost:4000

read -p "Press Enter to quit preview and kill container. "

docker rm -f jekyll
