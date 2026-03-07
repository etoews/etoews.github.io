#!/bin/bash

set -euo pipefail

docker build -t ${IMAGE} .

# Extract the generated Gemfile.lock from the image so the volume mount matches
docker run --rm ${IMAGE} cat /srv/jekyll/Gemfile.lock > Gemfile.lock

docker push ${IMAGE}
