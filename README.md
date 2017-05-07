### It's a blog!

Preview

```
unset ${!DOCKER_*}

docker pull grahamc/jekyll

docker run --rm -it \
  --name jekyll \
  --volume=$(pwd):/src \
  --publish 4000:4000 \
  grahamc/jekyll \
  serve --watch --future --drafts --force_polling --host 0.0.0.0

open http://localhost:4000
```
