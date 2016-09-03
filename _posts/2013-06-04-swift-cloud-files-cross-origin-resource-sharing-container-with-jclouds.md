---
author: Everett Toews
comments: true
date: 2013-06-04 18:42:41+00:00
layout: post
slug: swift-cloud-files-cross-origin-resource-sharing-container-with-jclouds
title: Swift/Cloud Files Cross Origin Resource Sharing Container with jclouds
categories:
  - jclouds
  - openstack
  - rackspace
---

Cross-origin resource sharing (CORS) is a mechanism that allows Javascript on a web page to make XMLHttpRequests to another domain, not the domain the Javascript originated from. Such "cross-domain" requests would otherwise be forbidden by web browsers, per the same origin security policy. CORS defines a way in which the browser and the server can interact to determine whether or not to allow the cross-origin request. It is more powerful than only allowing same-origin requests, but it is more secure than simply allowing all such [cross-origin requests](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing).

<!--more-->

In the context of OpenStack Swift and Rackspace Cloud Files a CORS enabled container allow users to upload files from one website--or origin--to your Swift/Cloud Files container. When you set the CORS headers on your container, you tell it which sites may post to your account, how often your container checks its allowed sites list, and whether or not metadata headers can be passed with the objects.

You can find example code to enable and configure CORS at [CrossOriginResourceSharingContainer.java](https://github.com/jclouds/jclouds-examples/blob/master/rackspace/src/main/java/org/jclouds/examples/rackspace/cloudfiles/CrossOriginResourceSharingContainer.java). To allow users temporary access to a such a container you would use example code like [GenerateTempURL.java](https://github.com/jclouds/jclouds-examples/blob/master/rackspace/src/main/java/org/jclouds/examples/rackspace/cloudfiles/GenerateTempURL.java).
