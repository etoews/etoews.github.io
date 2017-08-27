---
author: Everett Toews
comments: true
date: 2017-08-27 10:00:00+00:00
layout: post
slug: managing-env-vars-and-secrets-in-kubernetes
title: Managing Environment Variables and Secrets in Kubernetes
image: /img/posts/top-secret.jpg
categories:
  - kubernetes
---
<img class="img-right" src="{{ page.image }}"/>[Providing configuration to applications via environment variables](https://12factor.net/config) (env vars) is one of the principles of twelve-factor apps. If that configuration contains sensitive information like credentials, the best way to do that is using Secrets in Kubernetes. There are a lot of different ways to manage env vars and Secrets in Kubernetes. Here are a few things I do to make working with them more convenient.

<!--more-->

The versions used in this post at the time of writing are:

* [Minikube](https://kubernetes.io/docs/getting-started-guides/minikube/): 0.21.0
* [VirtualBox](https://www.virtualbox.org/): 5.1.22
* [Kubernetes](https://kubernetes.io/) and [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/): 1.7.0

## Create a minikube and get the code

<script src="https://gist.github.com/everett-toews/8d7bcafb5e26e9b96735ade35505f5c5.js?file=minikube-and-code.sh"></script>

## Setup the configuration

You need to get env vars into apps running on Kubernetes but, at least in your development environment, it can also be really convenient to have those env vars in your terminal session. For that reason, you can store your env vars as simple scripts that can be sourced.

Knowing that you'll have multiple environments, it's good to start with a template for that script. To avoid conflicts, prefix all of your env vars with some shorthand for your app.

<script src="https://gist.github.com/everett-toews/8d7bcafb5e26e9b96735ade35505f5c5.js?file=template.sh"></script>

Create a directory called envs for all of your config. Include a .gitignore to avoid committing any sensitive info and a README.md to let people (and your-later-self) know how to use the template.

```
envs/
├── .gitignore
├── README.md
├── dev.sh
├── staging.sh
├── template.sh
└── test.sh
```

Ignore everything except the few initial files in the dir.

<script src="https://gist.github.com/everett-toews/8d7bcafb5e26e9b96735ade35505f5c5.js?file=.gitignore"></script>

Naturally you'd want to expand on these instructions in the README.md.

<script src="https://gist.github.com/everett-toews/8d7bcafb5e26e9b96735ade35505f5c5.js?file=README.md"></script>


## Setup a development environment

<script src="https://gist.github.com/everett-toews/8d7bcafb5e26e9b96735ade35505f5c5.js?file=terminal.sh"></script>

## Create the Secrets and a Deployment

You can provide the config as key/value pairs using [process substitution](http://tldp.org/LDP/abs/html/process-sub.html).

<script src="https://gist.github.com/everett-toews/8d7bcafb5e26e9b96735ade35505f5c5.js?file=kubectl.sh"></script>

## PS1 Context

If you're working with many different app envs, it can be helpful to include some context in your PS1. Here's one example of including a bit more context on your command line. For a more thorough PS1, checkout my [.bash_profile](https://gist.github.com/everett-toews/e5a51e54ec7355a2d6716bfbf6c08fe2).

```bash
PS1='(kubernetes:$(kubectl config current-context 2>&1) | foo:$(echo ${FOO_ENV}))\n\W $ '
```

## Coda

Obviously this can be used in many more places than just database configuration. It's a great way to configure your apps too. These environment variables can even be used in [injected executable scripts](/2017/07/29/inject-an-executable-script-into-a-container-in-kubernetes/), which makes for a pretty powerful way to configure containers on the fly.

One improvement I'd like to make to this setup is to always have the env var file encrypted on disk. Whenever you needed the env vars in a terminal session, you would decrypt the file and source it. All in-memory so the decrypted version is never stored on disk.
