---
author: evtoews
comments: true
date: 2012-10-03 16:51:29+00:00
layout: post
slug: contributing-openstack-support-to-jclouds
title: Contributing OpenStack Support to jclouds
wordpress_id: 101
categories:
- devstack
- java
- jclouds
- openstack
---

[![Guava](http://phymata.files.wordpress.com/2012/10/guava1.jpeg)](http://phymata.files.wordpress.com/2012/10/guava1.jpeg)

**Update**: Folsom instructions

[jclouds](http://www.jclouds.org/) is a popular cross-cloud toolkit that covers an impressive number of public and private cloud providers. OpenStack is among these providers and the OpenStack ecosystem benefits from good support in jclouds because it allows developers who are comfortable with Java or jclouds to easily adopt OpenStack and it enables hybrid cloud development. Likewise, jclouds benefits from good OpenStack support because OpenStack is a popular Infrastructure as a Service provider and already has deep roots in the open source community.

A number of times on the jclouds-dev mailing list and IRC I've seen developers who want to help contribute OpenStack support to jclouds but aren't entirely sure about how to go about it. There are a number of things you need to get started.



	
  1. A jclouds development environment

	
  2. Some background on jclouds development

	
  3. An OpenStack test environment




## jclouds dev env


To setup a jclouds development environment start at their [Developer Resources](http://www.jclouds.org/documentation/devguides/) page. From there the most relevant page is [Contributing to the jclouds Code Base](http://www.jclouds.org/documentation/devguides/contributing-to-jclouds/). If you're an Eclipse user, you'll want to check out [Using Eclipse](http://www.jclouds.org/documentation/devguides/using-eclipse/). Learning about [Testing in jclouds](http://www.jclouds.org/documentation/devguides/provider-testing/) is essential and the [Additional References and Guides for Advanced Users](http://www.jclouds.org/documentation/reference/) also contains a wealth of design and implementation documentation. You might also want to browse through the [jclouds-dev mailing list](https://groups.google.com/forum/?fromgroups#!forum/jclouds-dev).


## jclouds dev background


The foundation of jclouds is built upon Google's general purpose library [Guava](http://code.google.com/p/guava-libraries/) and their lightweight dependency injection framework [Guice](http://code.google.com/p/google-guice/). You don't necessarily have to know these to start contributing but being aware of it and having the reference documentation on hand will be helpful. To talk to OpenStack's RESTful web services jclouds uses the [Java API for RESTful Web Services](http://jax-rs-spec.java.net/) (JAX-RS).


## OpenStack


For those unfamiliar with setting up an OpenStack dev/test env this can be a daunting task. There are a number of ways to do it and often it boils down to a developer's preference on how they want to deploy it...so I'll share my personal preference. :)

My OpenStack test env consists of [VirtualBox](https://www.virtualbox.org/) running an [Ubuntu 12.04 Server (Precise Pangolin)](http://releases.ubuntu.com/12.04/) virtual machine with [devstack](http://devstack.org/). This guide assumes you're comfortable installing Ubuntu on VirtualBox and know your way around the command line and git.



	
  1. [Download](https://www.virtualbox.org/wiki/Downloads) and install VirtualBox

	
  2. The networking can be a bit tricky and I've already addressed this in the ServerFault question [What is the correct network configuration for a devStack VM (virtualbox)?](http://serverfault.com/questions/409216/what-is-the-correct-network-configuration-for-a-devstack-vm-virtualbox/409331#409331)

	
  3. [Download](http://releases.ubuntu.com/12.04/) the 64-bit PC (AMD64) server install CD of Ubuntu 12.04 and create a VirtualBox VM with it

	
  4. Once it's ready to go you should be able to login to it from your terminal

	
    1. `ssh myusername@172.16.0.1`




	
  5. Once logged in, take a break, and have a look at the instructions for [devstack](http://devstack.org/)

	
  6. If you want a release branch of OpenStack (e.g. Essex, Folsom, etc.), you need to do things a little differently

	
    1. **Essex**:

	
    2. `git clone https://github.com/openstack-dev/devstack.git -b stable/essex devstack/`

	
    3. **Folsom**:

	
    4. `git clone https://github.com/openstack-dev/devstack.git -b stable/folsom devstack/`

	
    5. In the devstack/ directory create a localrc file that only uses release branches only

	
      1. [Essex example](https://gist.github.com/3827714)

	
      2. [Folsom example](https://gist.github.com/3887022)







	
  7. If you want the latest and greatest master branch of OpenStack, in the devstack/ directory, create a [localrc file like this](https://gist.github.com/3827855)

	
  8. In both cases

	
    1. Change to your devstack directory

	
    2. Run stack.sh

	
    3. When it completes, configure Keystone to return the VM's "public" IP

	
      1. **Essex**:

	
      2. `sed -i "s#publicURL = http://10.0.2.15#publicURL = http://172.16.0.1#g" /etc/keystone/default_catalog.templates`

	
      3. **Folsom**:

	
      4. `mysql -uroot -pdevstack keystone`

	
      5. `update endpoint set extra = replace(extra, '"publicurl": "[http://10.0.2.15](http://10.0.2.15/)', '"publicurl": "[http://172.16.0.1](http://172.16.0.1/)') where instr(extra, '"publicurl": "[http://10.0.2.15](http://10.0.2.15/)') > 0;`




	
    4. Kill the existing screen session (that contains all of the OpenStack services)

	
      1. `screen -X -S stack quit`




	
    5. Restart screen (with all of the OpenStack services)

	
      1. `screen -c stack-screenrc`







	
  9. Outside of the VM, back on your local machine, you should now be able to follow the instructions in my post [jclouds and OpenStack](http://blog.phymata.com/2012/09/04/jclouds-and-openstack/) to verify that everything is working as expected

	
  10. Once you've verified it's working, then port the [jclouds and OpenStack example](http://blog.phymata.com/2012/09/04/jclouds-and-openstack/) into your jclouds dev env and go from there




## Coda


Clearly it's non-trivial to get a full development/test environment like this up and running. However, the benefits are a healthier OpenStack ecosystem that's inclusive of the many Java developers around the world.

This post was written on Mac OS X 10.7.4, Java 1.6.0, jclouds 1.5.1, and OpenStack Essex/master.
