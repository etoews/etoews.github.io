---
author: Everett Toews
comments: true
date: 2016-08-05 10:00:00+00:00
layout: post
slug: joining-100-nodes-to-a-docker-swarm
title: Joining 100 nodes to a Docker Swarm
image: /img/posts/bees.jpg
categories:
  - docker
---

<img class="img-right" src="{{ page.image }}"/>Before the final release of Docker 1.12, [Chanwit Kaewkasi](https://twitter.com/chanwit) proposed forming a 2000 node Docker Swarm mode cluster. He wanted to test Swarm at scale, find its limitations, and live upgrade each cluster manager. To do so he reached out to the Docker community to contribute 2000 nodes to the effort he called [#DockerSwarm2000](https://twitter.com/search?q=%23dockerswarm2000). Here's how I was able to help out by joining 100 nodes to the Swarm from my Rackspace account.

<!--more-->

Chanwit did a great job of describing [What are we doing?](https://github.com/swarm2k/swarm2k/blob/master/PROPOSAL.md#what-are-we-doing) in his proposal before the event. He also did a great job on the [Analysis Of A Very-Large-Scale Container System](https://blog.online.net/2016/07/29/docker-swarm-an-analysis-of-a-very-large-scale-container-system/) after the event. This blog post is about how I automated joining 100 nodes of a release candidate version of Docker to the Swarm.

The versions used in this post are:

* Docker: 1.12.0-rc4
* rack: 1.2
* Ubuntu: 16.04

## The Script

This is the bash script I used to loop over 2 regions and create 50 VMs with Docker installed in each region. I chose not to use Docker Machine because I didn't want to wait for Machine to do all of that ssh'ing necessary to configure the instances. Even if I had used background jobs to create the VMs, that's still a lot of outbound ssh connections to go through while I hope my network connection doesn't fail and spoil the work.

Instead I opted to pass this [_dockerize.sh_](https://gist.github.com/everett-toews/599314d5665904a3a3f5a637fa1a9c7b#file-dockerize-sh) script to the VMs via [cloud-init](https://cloudinit.readthedocs.io/en/latest/). That way all I have to do is make the call to create the VM, which only takes a second or three, and let the VM do the work of installing Docker and configuring itself.  All of this happens in the `create()` method.

The _dockerize.sh_ script basically follows the standard [Docker installation on Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntulinux/) but I disable password login, install fail2ban, and install the release candidate of Docker. Naturally there would be much more configuration to do to make this a production worthy Docker host but since this isn't a long lived host, I'm not too worried about all of the bells and whistles.

<script src="https://gist.github.com/everett-toews/599314d5665904a3a3f5a637fa1a9c7b.js?file=dockerswarm100.sh"></script>

The requirements for the script are explicitly stated at the top. You need the Rackspace username and API key that you get with your account, the [rack CLI](https://developer.rackspace.com/docs/rack-cli/configuration/#installation-and-configuration), and a keypair named "swarm" in each region you want to deploy.

I wanted a `command subcommand` style interface so I use the first parameter passed into the script (a "subcommand" like `create`) to be used as the function name. The remainder of the parameters passed into the script after the function name become the parameters to the function. It worked out pretty well and I was able to save my self a lot of duplicated code by always looping over a function.

I created the VMs the night before the test with `dockerswarm100.sh create`. The next morning I checked on the VMs with `dockerswarm100.sh version` to ensure they were all at least running Docker correctly. To "warm up" the nodes I ran `dockerswarm100.sh hello`, which used the alpine image that I knew was going to used for the tasks.

The time of the test rolled around and all I had to do was run `dockerswarm100.sh join {swarm-secret} {swarm-manager-ip}` with the Swarm secret and manager IP that Chanwit provided to us. I know some contributors had some issues joining the Swarm but I was fortunate and all of my hosts joined without any issues. I followed up with `dockerswarm100.sh info` to check on the relevant Swarm info. Finally, after the test was over I deleted all of the VMs with `dockerswarm100.sh delete`

The whole test went remarkably smoothly. I was pleasantly surprised to see how many contributors were able to coordinate and run a fairly large scale test with release candidate software. I snagged a screen shot, from the Grafana dashboard that Chanwit put together, near the peak number of nodes that had joined the Swarm.

![DockerSwarm2k](/img/posts/dockerswarm2k.png)

## Coda

Overall I'd say DockerSwarm2000 was a success. There were certainly some interesting results but the community coming together and collaborating on this was a feat in itself. I genuinely hope this becomes a Docker release candidate tradition. I'll always be at the ready to launch 100 nodes to for it!
