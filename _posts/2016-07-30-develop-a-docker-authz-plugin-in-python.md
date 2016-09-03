---
author: Everett Toews
comments: true
date: 2016-07-30 14:00:00+00:00
layout: post
slug: develop-a-docker-authz-plugin-in-python
title: Develop a Docker Authorization Plugin in Python
image: /img/posts/outlet.png
categories:
  - docker
  - python
---

<img class="img-right" src="{{ page.image }}"/>Docker Engine has a great [plugin framework](https://docs.docker.com/engine/extend/plugin_api/) that allows you to write code that integrates cleanly with the Docker daemon. There are 3 different kinds of plugins you can create: authorization (authz), network, or volume. This post shows you how to develop a Docker [authorization plugin](https://docs.docker.com/engine/extend/plugins_authorization/) in Python. An authorization plugin can control access to access to the Docker daemon based on both the current authentication context and the command context in order to approve or deny requests.

<!--more-->

_Update_: I presented this post at the [Docker Austin meetup](http://www.meetup.com/Docker-Austin/) on August 4, 2016.

<div class="img-center">
<iframe width="640" height="360" src="https://www.youtube.com/embed/NQ401_LPQd4?rel=0" frameborder="0" allowfullscreen></iframe>
</div>

The example in this post shows you how to deny a request based on a ridiculous rule that the first thing you have to do is say "hello" to the Docker daemon. To do this you'll use a combination of Python for the programming language, Flask for the web framework, and uWSGI for the WSGI server. You'll develop the plugin directly on the host so the Docker daemon can communicate with it via a Unix socket.

The versions used in this post are:

* Docker: 1.12.0
* Python: 2.7
* Flask: 0.11.1
* uWSGI: 2.0.13.1

You're going to need [Docker Toolbox](https://www.docker.com/products/docker-toolbox) to create a host that you can install Python on. Once the host is ready, you will ssh into it.

```bash
$ docker-machine create --driver virtualbox authz
$ docker-machine ssh authz
```

The boot2docker image that Docker Toolbox uses is based on Tiny Core Linux so we need to install some Python tooling.

```bash
$ tce-load -wi python-dev compiletc
$ curl -s https://bootstrap.pypa.io/get-pip.py  | sudo python -
```

Now you can install the plugin from my GitHub repo.

```bash
$ sudo -i
$ git clone https://github.com/everett-toews/docker-authz-python-plugin.git
$ cd docker-authz-python-plugin
$ scripts/install-authz.sh
```

Have a look at the installation script to see where things are installed.

<script src="http://gist-it.appspot.com/github/everett-toews/docker-authz-plugin/blob/master/scripts/install-authz.sh"></script>

Another important piece of the puzzle for how things are configured is the _uwsgi.ini_ file. This file configures uWSGI on startup and how the Docker daemon communicates with the plugin.

<script src="http://gist-it.appspot.com/github/everett-toews/docker-authz-plugin/blob/master/uwsgi.ini"></script>

To check that everything is installed correctly you can `tail` the logs.

```bash
$ tail /var/log/authz.log
...
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 5179)
spawned uWSGI worker 1 (pid: 5251, cores: 1)

$ tail /var/lib/boot2docker/docker.log
...
time="2016-07-30T04:49:54.021709600Z" level=info msg="API listen on [::]:2376"
time="2016-07-30T04:49:54.021773981Z" level=info msg="API listen on /var/run/docker.sock"
```

To test that the plugin is running correctly you can poke at it with `curl`.

```bash
$ curl --unix-socket /run/docker/plugins/authz.sock http://
Docker Authz Plugin

$ curl -X POST --unix-socket /run/docker/plugins/authz.sock http:/Plugin.Activate
{
  "Implements": [
    "authz"
  ]
}
```

Try to run a container before you say "hello" to see how the plugin denies a request. Once you say "hello", that request is approved and then all subsequent requests are immediately approved. All of the source code is in [authz.py](https://github.com/everett-toews/docker-authz-plugin/blob/master/authz.py).

```bash
$ docker run alpine /bin/sh -c 'echo "Running an alpine image"'
docker: Error response from daemon: authorization denied by plugin authz: The request authorization failed. You must say hello first.
See 'docker run --help'.

$ docker run hello-world
...
Hello from Docker!
...

$ docker run alpine /bin/sh -c 'echo "Running an alpine image"'
...
Running an alpine image
```

At this point you'll probably want to start doing some development of your own and making some changes. You can open _authz.py_ and modify the code. The Docker authorization protocol is described at [Access authorization plugin](https://docs.docker.com/engine/extend/plugins_authorization/). After you made your changes and saved them, you'll need to run `uwsgi --reload /var/run/uwsgi.pid` to have them take effect. If you run into problems, you can look into the logs referenced above to troubleshoot.

## Coda

Docker authorization plugins can be developed to do pretty much anything you need to do in terms of access control. Having the current authentication context and the command context means you can approve or deny requests for any reason. You can imagine how you might hook your plugin into an LDAP server, deny privileged containers, or deny requests that attempt to make use of sensitive locations on disk. Have fun writing your own authz plugin!
