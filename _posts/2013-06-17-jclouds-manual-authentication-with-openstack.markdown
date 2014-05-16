---
author: Everett Toews
comments: true
date: 2013-06-17 17:40:20+00:00
layout: post
slug: jclouds-manual-authentication-with-openstack
title: jclouds Manual Authentication with OpenStack
categories:
- jclouds
- openstack
- rackspace
---

[![Lock](/img/posts/old-lock.jpg)](/img/posts/old-lock.jpg)I got [a comment](http://blog./img/posts.com/2012/09/04/jclouds-and-openstack/comment-page-1/#comment-1657) on my [jclouds and OpenStack](http://blog./img/posts.com/2012/09/04/jclouds-and-openstack) post about how to get the Tenant ID via jclouds. The first solution that popped to my mind was to get the Tenant ID out of the access data structure that gets returned upon authentication. This turned out to be a bit trickier than expected as jclouds automatically authenticates on your first actual interaction with a cloud (i.e. the very first time you call a method that needs to talk to the cloud). To get the access data structure I needed to manually authenticate. Here's how to do it.


## Get jclouds


First off, get the jclouds JAR files.




  1. Ensure you are using the [Java Development Kit (JDK) version 6 or later](http://www.oracle.com/technetwork/java/javase/downloads/index.html).


    * `javac -version`





  2. Ensure you are using [Maven version 3 or later](http://maven.apache.org/guides/getting-started/maven-in-five-minutes.html).


    * `mvn -version`





  3. Create a directory to try out jclouds.


    * `mkdir jclouds`


    * `cd jclouds`





  4. Make a local copy of this [pom.xml](https://gist.github.com/everett-toews/5798488) file in the jclouds directory.


    * `mvn dependency:copy-dependencies "-DoutputDirectory=./lib"`





  5. You should now have a directory with the following structure:


    * `jclouds/`


      * `pom.xml`


      * `lib/`


        * `*.jar`













## Manual Authentication


Put this code in your jclouds directory to do manual authentication. An explanation follows.

https://gist.github.com/everett-toews/5798514




  1. Compile.


    1. `javac -cp ".:lib/*" JCloudsManualAuthentication.java`





  2. Run on OpenStack.


    1. `java -cp ".:lib/*" JCloudsManualAuthentication openstack-nova demo:demo devstack http://123.123.123.123:5000/v2.0/`





  3. Run on Rackspace as this code works equally well with any OpenStack powered provider.


    1. `java -cp ".:lib/*" JCloudsManualAuthentication rackspace-cloudservers-us myRackspaceUsername myRackspaceAPIKey`





The key to the example is lines 93 & 94. Because jclouds normally handles the authentication manually we have to use a bit of Guice-fu on line 93 to get a hold of the Function that can manually authenticate by taking our Credentials and returning the Access data structure. On line 94 we execute that Function and the authentication happens. After that we can run through the Access object and get the information we need.


## Coda


It's rare that you would need to authenticate manually in jclouds. Most of the time letting jclouds automatically handle the auth for you suffices. However, if you do need to authenticate manually, this method will give you a lot of information about your OpenStack environment.
