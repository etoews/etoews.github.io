---
author: Everett Toews
comments: true
date: 2013-06-26 02:35:57+00:00
layout: post
slug: jclouds-1-6-1-released-with-new-maven-groupid
title: jclouds 1.6.1 Released With New Maven groupId
image: /img/posts/jclouds.jpg
categories:
  - jclouds
---

<img class="img-right" src="/img/posts/jclouds.jpg"/>jclouds 1.6.1 has been released! Here's the [official announcement](http://www.mail-archive.com/user@jclouds.incubator.apache.org/msg00112.html). This marks our first release as an incubated Apache project. We've fixed a number of issues and we've updated a lot of license headers :P but the biggest change is to our Maven groupId. It's gone from org.jclouds to org.apache.jclouds. The version also includes a "`-incubating`" to indicate our current incubation status in Apache. This is a big update as we've effectively changed the address where you download jclouds.

<!--more-->

Now a Maven pom.xml dependency would look like:

    <code><dependency>
      <groupId>org.apache.jclouds</groupId>
      <artifactId>jclouds-all</artifactId>
      <version>1.6.1-incubating</version>
    </dependency></code>

Note that the package names in the source code have **not** changed. That's something that will need to happen but we won't make a change of that magnitude until the next _major_ release.

## Meetup

We'll be celebrating our first Apache release of jclouds 1.6.1-incubating and all that wonderfulness with free food and drinks at a [meetup in San Francisco on July 8](http://www.meetup.com/jclouds/events/126378842/).

We can discuss:

  * The transition to Apache
  * What's new in 1.6.1-incubating
  * What's coming in future releases
  * How to use jclouds
  * How to contribute to jclouds

Hope to see you there.

## Coda

You can read the full [Release Notes](http://jclouds.incubator.apache.org/documentation/releasenotes/1.6.1/) for jclouds Version 1.6.1 and take it for spin using the [Installation Guide](http://jclouds.incubator.apache.org/documentation/userguide/installation-guide/)!
