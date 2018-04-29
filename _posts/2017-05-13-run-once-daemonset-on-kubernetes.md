---
author: Everett Toews
comments: true
date: 2017-05-13 10:00:00+00:00
layout: post
slug: run-once-daemonset-on-kubernetes
title: Run Once DaemonSet on Kubernetes
image: /img/posts/trigon.png
categories:
  - kubernetes
---
<img class="img-right" src="{{ page.image }}"/>There can be any number of reasons to run a once off task on every node in a Kubernetes cluster such as reading some info off of the node or running a quick test. But doing so is not straight-forward. None of the current resources are quite capable of it. A [Job](https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/) is designed to run to completion but there's no way to ensure one runs on every node. A [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) is designed to run on every node but there's no way to ensure that it runs to completion only once. Because if the tasks exits after running once the DaemonSet `RestartPolicy` of `Always` will cause it to run again.

<!--more-->

There is the open issue [CronJob daemonset](https://github.com/kubernetes/kubernetes/issues/36601) for this feature but until it lands, I needed a solution. There are a number of ways you can go about this. I wanted to keep the solution in Kubernetes-land so I chose to start with the DaemonSet resource and do some scriptery around it such that it only runs once.

The versions used in this post at the time of writing are:

* [Minikube](https://kubernetes.io/docs/getting-started-guides/minikube/): 0.19.0
* [VirtualBox](https://www.virtualbox.org/): 5.1.22
* [Kubernetes](https://kubernetes.io/): 1.6.0

## The Plan

1. Create the DaemonSet
1. Wait for the DaemonSet Pods to run
1. Wait for the script running in the DaemonSet Pods to complete
1. Delete the DaemonSet

## Run it

Create a Kubernetes cluster with Minikube, clone the gist with example code, and run it.

```bash
$ minikube start
Starting local Kubernetes v1.6.0 cluster...
Starting VM...
SSH-ing files into VM...
Setting up certs...
Starting cluster components...
Connecting to cluster...
Setting up kubeconfig...
Kubectl is now configured to use the cluster.

$ git clone https://gist.github.com/56d1b2a01daebd9691c62cdcadb1574b.git run-once-daemonset

$ cd run-once-daemonset

$ chmod u+x run-once-daemonset.sh cat-etc-hosts.sh

$ ./run-once-daemonset.sh
daemonset "cat-etc-hosts" created
waiting for cat-etc-hosts pods to run...
waiting for cat-etc-hosts daemonset to complete
daemonset "cat-etc-hosts" deleted
```

## The Run Once DaemonSet

This is a vanilla DaemonSet that mounts the node's /etc/hosts file for the script to read from.

<script src="https://gist.github.com/etoews/56d1b2a01daebd9691c62cdcadb1574b.js?file=daemonset.yaml"></script>

## The Task

This is a simple task implemented as a script that exits when it receives the `TERM` signal (which comes from `kubectl delete`).

<script src="https://gist.github.com/etoews/56d1b2a01daebd9691c62cdcadb1574b.js?file=cat-etc-hosts.sh"></script>

<script src="https://gist.github.com/etoews/56d1b2a01daebd9691c62cdcadb1574b.js?file=Dockerfile"></script>

You could also build your own Docker image and substitute its `image` name in the daemonset.yaml file.

```bash
$ docker login --username my-docker-id

$ docker build -t my-docker-id/cat-etc-hosts .

$ docker push my-docker-id/cat-etc-hosts
```

## The Script

The script ties it all together and waits for the task to complete before deleting the DaemonSet.

<script src="https://gist.github.com/etoews/56d1b2a01daebd9691c62cdcadb1574b.js?file=run-once-daemonset.sh"></script>

## Coda

There are a bunch of ways to shave this yak.

* Wait for [CronJob daemonset](https://github.com/kubernetes/kubernetes/issues/36601) to become a reality.
* Use config management like Ansible to run through your node inventory.
* Use [Fabfiles and Kubernetes: Automating SSH with Kubernetes Nodes](https://coreos.com/blog/integrating-fabric-with-kubernetes).
* Iterate over your nodes and template Job manifests to target every node.

To me a DaemonSet felt like the most natural fit. Keeping the solution in Kubernetes-land also keeps everything a part of the Kubernetes audit trail.
