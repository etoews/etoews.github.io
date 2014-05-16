---
author: Everett Toews
comments: true
date: 2012-08-18 20:01:19+00:00
layout: post
slug: logging-in-jclouds
title: Logging in jclouds
categories:
- java
- jclouds
- openstack
---

**[![](/img/posts/log.jpeg)](/img/posts/log.jpeg)**

**Update**: The info in this post has been superseded by the [jclouds logging reference page](http://jclouds.apache.org/reference/logging/).

**TL;DR** For basic header and wire logging in jclouds:




  1. [Download logback](http://logback.qos.ch/download.html)


  2. Put the JARs on your classpath


  3. Put this [logback.xml](https://gist.github.com/raw/3389176/2d40b811bb11020e36a49ecf563ab30d3495dd85/logback.xml) on your classpath


  4. Use the SLF4JLoggingModule()


  5. Run


I'm still learning jclouds and one thing that helps me out a lot is if I can get some insight into what's going on under the hood. Specifically, since what we're really doing is talking to an HTTP API, I like to be able to see what's going over the wire. Fortunately jclouds allows for some pretty fine grained logging out-of-the-box and it's relatively easy to configure too...once you know where everything goes. ;)

jclouds itself uses SLF4J Logging in its [examples](https://github.com/jclouds/jclouds-examples) so let's try that. I'm building off of my previous post [Getting started with jclouds](http://blog./img/posts.com/2012/08/15/getting-started-with-jclouds/) so the directory structure is the same as that. Here's the Java app I'm using to try this out. You can see the use of SLF4J Logging from line 43 where I add the SLF4JLoggingModule to a list of modules to be injected into the ComputeServiceContext.

https://gist.github.com/3388897

Now we compile and run it.

https://gist.github.com/3388921

Clearly I'm missing something. Googling the error quickly reveals that "Placing one (and only one) of slf4j-nop.jar, slf4j-simple.jar, slf4j-log4j12.jar, slf4j-jdk14.jar or logback-classic.jar on the class path should solve the problem."

I've noticed that the jclouds source code contains logback.xml a bunch of times (for example [this one](https://github.com/jclouds/jclouds/blob/master/apis/openstack-keystone/src/test/resources/logback.xml)) so I'll use logback too. From the [logback download page](http://logback.qos.ch/download.html) I grab the latest tar.gz. Once unzipped I copy the logback-core-x.x.x.jar and the logback-classic-x.x.x.jar into my lib directory. I also realize that I'll need to configure the logback for myself as well. Working from the example I trim it down to the absolute minimum of what I need.

https://gist.github.com/3389176

Then I place the logback.xml file in my top level directory and give it another go.

https://gist.github.com/3389253

Success! Let's see what we've got.

Lines starting with ">>" are requests.

Lines starting with "<<" are responses.

The JSON at the beginning of a request or the end of a response is the body of the request/response.

Here's basically what jclouds does when listing servers (aka "Nodes" in jclouds terminology).




  1. Authenticate to get a token


  2. List all servers in detail in the "ORD" zone


  3. List all servers in detail in the "DFW" zone


  4. List all images in detail in the "ORD" zone


  5. List all images in detail in the "DFW" zone


  6. List all flavors in detail in the "ORD" zone


  7. List all flavors in detail in the "DFW" zone


  8. Mash all of the relevant details together into ComputeMetadata objects and return the results


That's a lot of requests just to list servers. I think I understand the tradeoff from jclouds perspective though. Either you can return a really useful list of servers with all the possible info you might need or you can force the user to fetch that detail as they need it. From a usability perspective it's better just to grab it all at once.

One thing I see missing from the request headers is the User-Agent header. Unfortunately it doesn't get logged as this header is added to the request in [JavaUrlHttpCommandExecutorService.java](https://github.com/jclouds/jclouds/blob/master/core/src/main/java/org/jclouds/http/internal/JavaUrlHttpCommandExecutorService.java) after the headers have been logged. Oh well, we can see everything else we need to.

This post was written on Mac OS X 10.8, Java 1.6.0, jclouds 1.5.0-beta.10. If you’re on a different OS and run into problems, please feel free to comment.
