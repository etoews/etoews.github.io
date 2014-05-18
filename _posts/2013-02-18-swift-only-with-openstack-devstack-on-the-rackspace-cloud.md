---
author: Everett Toews
comments: true
date: 2013-02-18 23:10:16+00:00
layout: post
slug: swift-only-with-openstack-devstack-on-the-rackspace-cloud
title: Swift Only with OpenStack DevStack on the Rackspace Cloud
image: /img/posts/devstack.png
categories:
- devstack
- openstack
- rackspace
---

<img class="img-right" src="/img/posts/devstack.png"/>Swift is not installed by default when using OpenStack [DevStack](http://devstack.org/). Sometimes you want to install Swift only for some testing without all of the other services getting in the way. Here's how to setup Swift (and Keystone for authentication) with DevStack on the Rackspace Cloud.

<!--more-->

## Instructions

  1. If you don't have one already, [Sign Up](https://cart.rackspace.com/cloud/) for an open cloud account
  2. Go to the [Cloud Control Panel](https://mycloud.rackspace.com)
  3. Click Create Server
    1. Name: devstack-swift
    2. Image: Ubuntu 12.04 LTS
    3. Size: 4GB RAM (you could probably get away with 2 GB)
  4. Click Create Server and note the password and IPv4 address (when it appears)
  5. When your server is Active, switch to a Terminal and run the following commands to create the stack user.
    1. `ssh root@<IPv4 Address>`
    2. `adduser --gecos "" stack`
    3. `adduser stack sudo`
    4. `grep -q "^#includedir.*/etc/sudoers.d" /etc/sudoers || echo "#includedir /etc/sudoers.d" >> /etc/sudoers`
    5. `( umask 226 && echo "stack ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/50_stack_sh )`
    6. `exit`
  6. I create the stack user like this because I've found that there are permission issues with screen if you create a "dummy" stack user and just switch to the stack user from the root user.
  7. Now login as the stack user and setup Swift:
    1. `ssh stack@<IPv4 Address>`
    2. `sudo apt-get -y update`
    3. `sudo apt-get -y install git`
    4. `git clone https://github.com/openstack-dev/devstack.git`
    5. `cd devstack`
    6. `vim localrc # copy in the contents of [this one](https://gist.github.com/everett-toews/4981513)`
    7. `./stack.sh`
    8. `screen -r stack`
  8. When running stack.sh you might see an error message that reads "ERROR: at least one rpc backend must be enabled". Don't worry about it, Swift/Keystone doesn't need an rpc (AMQP) backend. You can also ignore any ImportErrors.
  9. When DevStack is done you can point your OpenStack clients and [jclouds dev env](http://blog./img/posts.com/2012/09/04/jclouds-and-openstack/) all at <IPv4 Address>
  10. When you're done with your development/testing you can delete the server to save money and just start fresh next time

## Coda

Just a quick post to get Swift only up and running quickly!
