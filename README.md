### It's a blog!

Preview

```
docker run --rm -it \
  --name jekyll \
  --volume=$(pwd):/src \
  --publish 4000:4000 \
  grahamc/jekyll \
  serve --watch --incremental --drafts --host 0.0.0.0

open http://docker.local:4000
```
