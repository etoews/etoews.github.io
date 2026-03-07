#!/bin/bash

set -euo pipefail

# Build locally (native platform) to extract the generated Gemfile.lock
docker build -t ${IMAGE} .
docker run --rm ${IMAGE} cat /srv/jekyll/Gemfile.lock > Gemfile.lock

# Build and push multi-platform image for both arm64 (local) and amd64 (GitHub Actions)
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --tag ${IMAGE} \
  --push \
  .
