---
author: Everett Toews
comments: true
date: 2012-11-08 16:47:41+00:00
layout: post
slug: openstack-devstack-on-the-rackspace-open-cloud
title: OpenStack devstack on the Rackspace open cloud
categories:
- devstack
- jclouds
- openstack
- rackspace
---

[![devstack](/img/posts/devstack.png)](/img/posts/devstack.png)I've written about deploying devstack before in [Contributing OpenStack Support to jclouds](http://blog./img/posts.com/2012/10/03/contributing-openstack-support-to-jclouds/). That post covered running devstack locally in VirtualBox. I've been using that method for a while now but with a devstack env in VirtualBox, a jclouds dev env, browser, chat client, mail client, etc. etc. etc. all running on the same laptop it gets bogged down. I'm pretty sure I heard gears grinding and smoke was pouring out of the laptop at one point. I just don't have the cores, RAM, and RPMs to run everything smoothly and you need smoothly or development starts to suck.

The biggest draw on resources is VirtualBox so it's long past time to move that devstack VM to the cloud! Naturally I'm going to deploy on the Rackspace open cloud. It turns out this is significantly simpler/easier to do than deploying on VirtualBox.


## Instructions






  1. If you don't have one already, [Sign Up](https://cart.rackspace.com/cloud/) for an open cloud account


  2. Go to the [Cloud Control Panel](https://mycloud.rackspace.com)


  3. Click Create Server


    1. Name: devstack-folsom


    2. Image: Ubuntu 12.04 LTS


    3. Size: 4GB RAM (you could probably get away with 2 GB)





  4. Click Create Server and note the password and IPv4 address (when it appears)


  5. When your server is Active, switch to a Terminal and run the following commands:


    1. ssh root@<IPv4 Address>


    2. apt-get update; apt-get install -y git


    3. git clone https://github.com/openstack-dev/devstack.git -b stable/folsom devstack/


    4. cd devstack/


    5. vim localrc # copy in the contents of [this one](https://gist.github.com/4004430)


    6. ./stack.sh





  6. When devstack is done you can point your browser, OpenStack clients, and [jclouds dev env](http://blog./img/posts.com/2012/09/04/jclouds-and-openstack/) all at <IPv4 Address>


  7. When you're done with your development/testing you can delete the server to save money and just start fresh next time




## Next


The next obvious thing to do is to automate the whole process above. I haven't decided whether to do my own custom script or dive into something like [CloudEnvy](https://github.com/cloudenvy/cloudenvy). Either way it needs to be automated but it's always good to have the manual process documented to fall back on and understand everything end to end.


## Coda


As you can see there are far fewer steps to creating a devstack env like this than on VirtualBox. There's much less fiddling around with networking too. The big benefit for me though was the immediate increase in speed for the rest of my development tools on laptop.
