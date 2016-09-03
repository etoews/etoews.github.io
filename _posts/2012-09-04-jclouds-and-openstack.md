---
author: Everett Toews
comments: true
date: 2012-09-04 02:13:41+00:00
layout: post
slug: jclouds-and-openstack
title: jclouds and OpenStack
image: /img/posts/openstack.png
categories:
  - jclouds
  - openstack
---



**Update**: This post is out of date. Use the [Apache jclouds OpenStack Quick Start Guide](http://jclouds.apache.org/guides/openstack/) instead.

<img class="img-right" src="/img/posts/openstack.png"/>Getting jclouds and your own OpenStack deployment working together can be just a bit tricky as there are a couple of special configurations you need to make.

<!--more-->

I've described how to [get started with jclouds](/2012/08/15/getting-started-with-jclouds/) before but the other piece of this puzzle is your own OpenStack deployment. For easy and reliable testing I just run my own [devstack](http://devstack.org/) install of OpenStack. Setting up devstack has been written about many times elsewhere so the only thing that I'll say about it here is that I use an Ubuntu 12.04 Server VM running in VirtualBox. The trickiest part of that setup is the networking so I posted my VirtualBox settings on [this question on ServerFault](http://serverfault.com/questions/409216/what-is-the-correct-network-configuration-for-a-devstack-vm-virtualbox). After that it's just a matter of following the devstack instructions.

Here's the code for connecting to OpenStack. It's very similar to the getting started example with a few key differences. In the init() method notice that

  * `String provider = "openstack-nova";`
    * This ones pretty self explanatory, we're using the OpenStack Nova provider in jclouds
  * `String identity = "demo:demo"; // tenantName:userName`
    * Here we use the tenant name and user name with a colon between them instead of just a user name
  * `String password = "devstack";`
    * Instead of using the API key I'm using the password I set when devstack did its installation
  * `.endpoint("http://172.16.0.1:5000/v2.0/")`
    * This is the Keystone endpoint that jclouds needs to connect with to get more info (services and endpoints) from OpenStack
    * When the devstack installation completes successfully, one of the last few lines will read something like "`Keystone is serving at http://172.16.0.1:5000/v2.0/`"
    * Set the endpoint to this URL

<script src="https://gist.github.com/3615655.js"></script>

To get everything compiling and running do the following.

<script src="https://gist.github.com/3615740.js"></script>

This post was written on Mac OS X 10.7.4, Java 1.6.0, jclouds 1.5.1 <del>1.5.0-beta.10</del>, and OpenStack Essex. If you’re on a different OS and run into problems, please feel free to comment.
