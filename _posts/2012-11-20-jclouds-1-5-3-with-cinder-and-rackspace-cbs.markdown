---
author: evtoews
comments: true
date: 2012-11-20 21:28:47+00:00
layout: post
slug: jclouds-1-5-3-with-cinder-and-rackspace-cbs
title: jclouds 1.5.3 Released With OpenStack Cinder and Rackspace Cloud Block Storage
  Support
wordpress_id: 166
categories:
- openstack
- rackspace
---

[jclouds 1.5.3](http://blog.jclouds.org/post/35922275965/jclouds-1-5-3-out-the-door) was officially released over the weekend. Another solid release from the jclouds community. Among a number of new features was the support I added for OpenStack Cinder and Rackspace Cloud Block Storage.


## OpenStack Cinder


[](http://wiki.openstack.org/Cinder)[![Cinder Block](/img/posts/cinder-block.jpg)](/img/posts/cinder-block.jpg)Cinder is the OpenStack block storage service. On physical machines, examples of block storage devices are hard drives and USB sticks. Cinder allows you to create persistent virtual block storage devices as volumes that can be attached to servers and mounted with filesystems. This means you can store any data on the volumes and that data will persist even if your server is terminated.

From an OpenStack API perspective there's some historical context that will help you understand Cinder. Cinder was born out of the need to create an independent block storage service. However, originally, there was a block storage service in OpenStack called nova-volume that had its own API but was officially part of the Nova API. A new service for Cinder in OpenStack Folsom means a new Cinder API but this API was an exact copy of the nova-volume API in OpenStack Essex. This was done very deliberately to maintain backwards compatibility and ease the transition from nova-volume to Cinder. Both APIs now exist in Folsom but the Cinder API is the path forward where all new efforts will be focused.


## Rackspace Cloud Block Storage


[](http://www.rackspace.com/cloud/public/blockstorage/)[![Cloud Block Storage](/img/posts/cbs.png)](/img/posts/cbs.png)Cloud Block Storage (CBS) is Rackspace's deployment of Cinder. This means it's the Rackspace service that allows you to create volumes via the [Cloud Control Panel](https://mycloud.rackspace.com), the [CBS (Cinder) API](http://docs.rackspace.com/cbs/api/v1.0/cbs-devguide/content/overview.html), or [jclouds](http://www.jclouds.org/)! You can create standard volumes that work well for your everyday file system needs, and SSD volumes that deliver even higher performance for databases and other I/O-intensive applications. It also allows you to easily create a snapshot of your existing volumes that effectively act as a point-in-time backup.

To get started with jclouds and Cloud Block Storage check out the [Getting Started: The Rackspace open cloud](http://www.jclouds.org/documentation/quickstart/rackspace/) documentation, specifically the [Working with Cloud Block Storage](http://www.jclouds.org/documentation/quickstart/rackspace/#volumes) section. There are plenty of examples in the [cloudblockstorage package](https://github.com/jclouds/jclouds-examples/tree/master/rackspace/src/main/java/org/jclouds/examples/rackspace/cloudblockstorage) of the [Rackspace examples](https://github.com/jclouds/jclouds-examples/tree/master/rackspace/) on how to use this essential new service. For instance, the [CreateVolumeAndAttach.java](https://github.com/jclouds/jclouds-examples/blob/master/rackspace/src/main/java/org/jclouds/examples/rackspace/cloudblockstorage/CreateVolumeAndAttach.java) is an end to end example of creating a volume, attaching it to a server, putting a filesystem on it, and mounting it for use to store persistent data.


## Coda


Block storage is one of the fundamental building blocks (no pun intended) of computing. This has been an often requested feature for Rackspace and it's great to help other developers use it by providing support for Cloud Block Storage and Cinder in jclouds. I encourage you to [upgrade to jclouds 1.5.3](http://www.jclouds.org/documentation/userguide/installation-guide/) and checkout these new features.
