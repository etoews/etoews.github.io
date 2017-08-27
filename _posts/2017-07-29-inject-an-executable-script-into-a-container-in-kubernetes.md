---
author: Everett Toews
comments: true
date: 2017-07-29 10:00:00+00:00
layout: post
slug: inject-an-executable-script-into-a-container-in-kubernetes
title: Inject an Executable Script into a Container in Kubernetes
image: /img/posts/map.jpg
categories:
  - kubernetes
---
<img class="img-right" src="{{ page.image }}"/>Often times you need to inject a configuration file into a container in Kubernetes. This is really easy to do using the [ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/) resource. But once in a while you might need to inject an executable script into a container.

<!--more-->

There are any number of reasons why you might need to do so. In my case, I needed to alter the default behaviour of a Docker image. Normally you might create a new git repo with a Dockerfile and the script, and then build a whole new Docker image just to include the script. Instead you can inject an executable script into the container at runtime using a ConfigMap and the `defaultMode` of a volume.

The versions used in this post at the time of writing are:

* [Minikube](https://kubernetes.io/docs/getting-started-guides/minikube/): 0.21.0
* [VirtualBox](https://www.virtualbox.org/): 5.1.22
* [Kubernetes](https://kubernetes.io/) and [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/): 1.7.0

## Run it

Create a Kubernetes cluster with Minikube, clone the gist with example code, and run it. Note how the source of the ConfigMap is the wrapper.sh file.

<script src="https://gist.github.com/everett-toews/82c039843663de7e7f1e18bf4debe5fa.js?file=terminal.sh"></script>

## The Executable Script

In this case, the script is just a wrapper around the regular entrypoint for the ghost image that allows you to do some special initialization beforehand.

<script src="https://gist.github.com/everett-toews/82c039843663de7e7f1e18bf4debe5fa.js?file=wrapper.sh"></script>

## The Deployment

A volume is created from the ConfigMap with `defaultMode: 0744`, that's what makes it executable. It's then mounted to a /scripts dir but it could be mounted anywhere. The `command: ["/scripts/wrapper.sh"]` overrides the Docker image's entrypoint and runs wrapper.sh instead.

<script src="https://gist.github.com/everett-toews/82c039843663de7e7f1e18bf4debe5fa.js?file=deployment.yaml"></script>

## First Crack

Before I found out about `defaultMode`, my first crack at solving this problem was to use an [Init Container](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) like this.

<script src="https://gist.github.com/everett-toews/82c039843663de7e7f1e18bf4debe5fa.js?file=deployment-first-crack.yaml"></script>

It gets the job done but `defaultMode` is a much more elegant and succinct way to do it.

## Coda

You can inject any kind of text based file into a container in Kubernetes. Making it an executable script is just one special case of that. I like this approach a lot because you don't have to create and maintain yet another Docker image just to inject one particular file.

P.S. I discovered that this is also _extremely_ useful for [extending the official Postgres image](https://store.docker.com/images/postgres#how-to-extend-this-image) and creating scripts in the /docker-entrypoint-initdb.d/ dir of the Postgres container.
