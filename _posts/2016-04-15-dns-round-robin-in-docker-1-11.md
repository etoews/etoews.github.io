---
author: Everett Toews
comments: true
date: 2016-04-15
layout: post
slug: dns-round-robin-in-docker-1-11
title: DNS Round Robin in Docker 1.11
image: /img/posts/robin.jpg
categories:
  - docker
---

<img class="img-right" src="{{ page.image }}"/>One of the features I'm most excited about in [Docker 1.11](https://blog.docker.com/2016/04/docker-engine-1-11-runc/) is DNS round robin load balancing. This gets you effective service discovery for free right out of the box with Docker. Here's how to use it.

<!--more-->

The important part is using a network alias on the command line or in a compose file, and using that alias in the load balancer configuration. I'm using NGINX in this example so that means using the network alias in the nginx.conf file in the `proxy_pass` or `upstream` directives.

## Clone the repo

This is a repo with a pretty basic example of DNS round robin in action.

    $ git clone https://github.com/everett-toews/docker-dns-round-robin.git
    $ cd docker-dns-round-robin

I've tested the example with both [Docker Toolbox](https://www.docker.com/products/docker-toolbox) and [Docker for Mac](https://blog.docker.com/2016/03/docker-for-mac-windows-beta/).

## Using the Docker CLI

Use `docker` to build an NGINX image that will load balance instance of a demo app.

    $ docker build -t lb lb
    Sending build context to Docker daemon 3.072 kB
    Step 1 : FROM nginx:1.9
     ---> eb4a127a1188
    ...
    Successfully built b9976ea1d078

    $ docker network create backend
    $ docker run -d --name lb --net backend -p 80:80 lb
    $ docker run -d --net backend --net-alias apps ehazlett/docker-demo
    $ docker run -d --net backend --net-alias apps ehazlett/docker-demo

    $ curl -s http://$(docker-machine ip default) | grep strong
    <h2 class="lsf info">served from <strong>2a445e8df911</strong></h2>

    $ curl -s http://$(docker-machine ip default) | grep strong
    <h2 class="lsf info">served from <strong>7043b0a71d39</strong></h2>

    $ docker run -d --net backend --net-alias apps ehazlett/docker-demo
    $ docker run -d --net backend --net-alias apps ehazlett/docker-demo

    $ curl -s http://$(docker-machine ip default) | grep
    <h2 class="lsf info">served from <strong>ca99a8442dfb</strong></h2>

    $ curl -s http://$(docker-machine ip default) | grep
    <h2 class="lsf info">served from <strong>28b6a528bde7</strong></h2>

## Using Docker Compose

Use `docker-compose` to build an NGINX image that will load balance instance of a demo app when you do a `docker-compose scale`.

    $ docker-compose up -d
    Creating network "dockerdnsroundrobin_backend" with the default driver
    Building lb
    Step 1 : FROM nginx:1.9
     ---> eb4a127a1188
    ...
    Successfully built 16b9c4a4ba32
    Creating lb
    Creating dockerdnsroundrobin_app_1

    $ curl -s http://$(docker-machine ip default) | grep strong
    <h2 class="lsf info">served from <strong>a24fd74b9383</strong></h2>

    $ docker-compose scale app=3
    Creating and starting dockerdnsroundrobin_app_2 ... done
    Creating and starting dockerdnsroundrobin_app_3 ... done

    $ curl -s http://$(docker-machine ip default) | grep strong
    <h2 class="lsf info">served from <strong>0d0e21b95b1c</strong></h2>

    $ curl -s http://$(docker-machine ip default) | grep strong
    <h2 class="lsf info">served from <strong>be393718dd7d</strong></h2>

## How does that work?

The value between the `<strong>` tag is the hostname of the host serving the request.

Notice how different hosts are serving the requests. You might have to use `curl` several times to see a new host appear. To understand how this works with NGINX, read through the simple [nginx.conf](https://github.com/everett-toews/docker-dns-round-robin/blob/master/lb/nginx.conf) file. The key is using the `apps` network alias as the `proxy_pass`.

## Coda

There it is, simple yet effective service discovery and load balancing. But it's not going to solve every service discovery scenario. For more complex use cases you're going to need something like [Interlock](https://github.com/ehazlett/interlock/) or a full Consul+ConsulTemplate+Registrator/etcd+confd+Registrator stack.

For an out of the box service discovery experience with Docker, I'm pretty happy with this. And I'm really looking forward to seeing this in action in [Carina](https://getcarina.com/) when Docker 1.11 is supported in Docker Swarm clusters.
