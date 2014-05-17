---
author: Everett Toews
comments: true
date: 2013-10-10 16:31:54+00:00
layout: post
slug: jclouds-1-6-2-released-with-support-for-openstack-trove
title: jclouds 1.6.2 released with support for OpenStack Trove
categories:
- jclouds
- openstack
- rackspace
---

<img class="img-right" src="http://i.imgur.com/2IdQ7zZ.jpg"/>jclouds 1.6.2 has been released (see [release notes](http://jclouds.incubator.apache.org/documentation/releasenotes/1.6.2/)) with support for OpenStack Trove!

Trove is Database as a Service (DBaaS) for OpenStack. It's designed to run entirely on OpenStack, with the goal of allowing users to quickly and easily utilize the features of a relational database without the burden of handling complex administrative tasks. Cloud users and database administrators can provision and manage multiple database instances as needed. Initially, the service will focus on providing resource isolation at high performance while automating complex administrative tasks including deployment, configuration, patching, backups, restores, and monitoring.

## Try It Out

As it stands right now, Trove isn't part of DevStack. The only place I know of where you can try it out is the [Rackspace Cloud Databases](http://www.rackspace.com/cloud/databases/) service. If you don't have a Rackspace account, no problem. You can use the [developer trial](http://developer.rackspace.com/devtrial/) to kick the tires.

  1. Once you've got your Rackspace username and API key, [install jclouds](http://jclouds.incubator.apache.org/documentation/quickstart/rackspace/#install).
  2. Run through an example of [creating an instance](http://jclouds.incubator.apache.org/documentation/quickstart/rackspace/#databases).
  3. Check out the all of the [examples](https://github.com/jclouds/jclouds-examples/tree/master/rackspace) and specifically the [Cloud Databases examples](https://github.com/jclouds/jclouds-examples/tree/master/rackspace/src/main/java/org/jclouds/examples/rackspace/clouddatabases).
  4. Compare the action you take using jclouds with what you see in the [Cloud Control Panel](https://mycloud.rackspace.com).

## Coda

Take Trove for a spin and let me know what you think. Either about the service itself, the support in jclouds, or the view in the Cloud Control Panel.
