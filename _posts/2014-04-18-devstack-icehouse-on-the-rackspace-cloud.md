---
author: Everett Toews
comments: true
date: 2014-04-18 14:01:05+00:00
layout: post
slug: devstack-icehouse-on-the-rackspace-cloud
title: DevStack Icehouse on the Rackspace Cloud
image: /img/posts/cloud-inception.png
categories:
  - devstack
  - openstack
  - rackspace
---

<img class="img-right" src="/img/posts/cloud-inception.png"/>Here's how to deploy DevStack for OpenStack Icehouse on the Rackspace Cloud. You can use DevStack for testing/development of OpenStack or just learning a bit more about OpenStack and how all of the pieces fit together.

<!--more-->

The services deployed from following the instructions here are:

  1. Identity (Keystone)
  2. Compute (Nova)
  3. Network (Neutron)
  4. Object Storage (Swift)
  5. Image (Glance)
  6. Block Storage (Cinder)
  7. Orchestration (Heat)
  8. Databases (Trove)
  9. Dashboard (Horizon)

If you don't have a Rackspace Cloud account, I recommend using the [Developer Discount](http://developer.rackspace.com/devtrial/) to try this out.

  1. Go to the [Cloud Control Panel](https://mycloud.rackspace.com/)
  2. Click Create Server
    1. Name: devstack
    2. Image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM)
    3. Flavor: Performance 1 > 4GB Performance (you might get away with 2 GB)
  3. Click Create Server and note the password and IPv4 address (when it appears)
  4. When your server is Active, switch to a Terminal and run the following commands:
    1. `ssh root@my.ip.v4.address`
    2. `apt-get -y update`
    3. `apt-get -y install git vim`
    4. `git clone https://github.com/openstack-dev/devstack.git -b stable/icehouse devstack/`
    5. `devstack/tools/create-stack-user.sh`
    6. `su stack`
    7. `cd`
    8. `git clone https://github.com/openstack-dev/devstack.git -b stable/icehouse devstack/`
    9. `cd devstack/`
    10. `vim local.conf` # copy in the contents of the one below
    11. `./stack.sh`
  5. To work with OpenStack via the web browser:
    1. Go to http://my.ip.v4.address
      1. User Name: demo
      2. Password: devstack
    2. See the [Getting Started Guide](http://docs.openstack.org/user-guide/content/ch_dashboard.html).
  6. To work with OpenStack via the command line:
    1. `source /opt/stack/python-novaclient/tools/nova.bash_completion`
    2. `source openrc demo demo`
    3. `nova image-list`
    4. See the [Getting Started Guide](http://docs.openstack.org/user-guide/content/ch_cli.html).
  7. To work with OpenStack via the API:
    1. `curl -s -X POST http://my.ip.v4.address:5000/v2.0/tokens -d '{"auth": {"passwordCredentials": {"username":"demo", "password":"devstack"}, "tenantName":"demo"}}' -H "Content-type: application/json" | python -m json.tool`
    2. See the [Getting Started Guide](http://docs.openstack.org/api/quick-start/content/) and the [Complete Reference](http://api.openstack.org/api-ref.html).
  8. To work with OpenStack via a programming language:
    1. Java: See the [Getting Started Guide](http://jclouds.apache.org/guides/openstack/) for Apache jclouds
    2. Node.js: See the [Getting Started Guide](https://github.com/pkgcloud/pkgcloud/blob/master/docs/providers/openstack/getting-started-compute.md) for pkgcloud
    3. Ruby: See the [Getting Started Guide](https://github.com/fog/fog/blob/master/lib/fog/openstack/docs/getting_started.md) for Fog
  9. To access your DevStack screen session:
    1. `sudo chmod o+rwx /dev/pts/0`
    2. `screen -r stack`
    3. See the [Quick Reference](http://aperiodic.net/screen/quick_reference).

<script src="https://gist.github.com/everett-toews/11063431.js"></script>

## Coda

If you run into problems, please let me know. Happy DevStacking!
