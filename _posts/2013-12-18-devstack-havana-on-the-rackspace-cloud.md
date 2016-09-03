---
author: Everett Toews
comments: true
date: 2013-12-18 15:57:14+00:00
layout: post
slug: devstack-havana-on-the-rackspace-cloud
title: DevStack Havana on the Rackspace Cloud
image: /img/posts/cloud-inception.png
categories:
  - devstack
  - openstack
  - rackspace
---

<img style="float:right" src="/img/posts/cloud-inception.png"/>Here's how to deploy DevStack for OpenStack Havana including Neutron (Network) and Swift (Object Storage) on the Rackspace Cloud. You can use DevStack for testing/development of OpenStack or just learning a bit more about OpenStack and how all of the pieces fit together.

<!--more-->

If you don't have a Rackspace Cloud account, I recommend using the [Developer Discount](http://developer.rackspace.com/devtrial/) to try this out.

  1. Go to the [Cloud Control Panel](https://mycloud.rackspace.com/)
  2. Click Create Server
    1. Name: devstack-havana
    2. Image: Ubuntu 12.04 LTS
    3. Flavor: Performance 1 > 4GB Performance (you could probably get away with 2 GB)
  3. Click Create Server and note the password and IPv4 address (when it appears)
  4. When your server is Active, switch to a Terminal and run the following commands:
    1. `ssh root@my.ip.v4.address`
    2. `apt-get -y update`
    3. `apt-get -y install git vim`
    4. `git clone https://github.com/openstack-dev/devstack.git -b stable/havana devstack/`
    5. `devstack/tools/create-stack-user.sh`
    6. `su stack`
    7. `cd`
    8. `git clone https://github.com/openstack-dev/devstack.git -b stable/havana devstack/`
    9. `cd devstack/`
    10. `vim localrc` # copy in the contents of the one below
    11. `./stack.sh`
  5. To access your DevStack screen session:
    1. `sudo chmod o+rwx /dev/pts/0`
    2. `screen -r stack`
  6. To work with OpenStack via the API:
    1. `curl -s -X POST http://my.ip.v4.address:5000/v2.0/tokens -d '{"auth": {"passwordCredentials": {"username":"demo", "password":"devstack"}, "tenantName":"demo"}}' -H "Content-type: application/json" | python -m json.tool`
  7. To work with OpenStack Nova (Compute) via the command line:
    1. `source /opt/stack/python-novaclient/tools/nova.bash_completion`
    2. `source openrc demo demo`
    3. `nova image-list`
  8. To work with OpenStack via the web browser:
    1. Go to http://my.ip.v4.address
    2. User Name: demo
    3. Password: devstack

<script src="https://gist.github.com/everett-toews/8013110.js"></script>

## Coda

Happy DevStacking!
