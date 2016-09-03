---
author: Everett Toews
comments: true
date: 2012-08-15 15:51:10+00:00
layout: post
slug: getting-started-with-jclouds
title: Getting started with jclouds
image: /img/posts/cumulusklein.jpeg
categories:
  - jclouds
  - openstack
  - rackspace
---

**Update**: Using jclouds 1.5.1

<img class="img-right" src="/img/posts/cumulusklein.jpeg"/>I'm just starting to get familiar with the open source [jclouds](http://www.jclouds.org/) cross-cloud toolkit. Whenever I get started with something new like this I like to start out with the most simple application possible that still does something sort of useful. And when starting out, I prefer to work from the command line so I can get a feel for how something is really put together. After that, when I move to using a build tool like Maven or Ant or putting everything into Eclipse or another IDE, I have a better understanding of its dependecies and config.

<!--more-->

With that in mind I headed over to the [jclouds installation page](http://www.jclouds.org/documentation/userguide/installation-guide/) to download the JARs for it. Okay...what is lein???

Looks [lein](https://raw.github.com/technomancy/leiningen/stable/bin/lein) is part of [leiningen](https://github.com/technomancy/leiningen). One of the tools that jclouds can use to manage dependencies. Downloading the lein script is no problem but I also need the project.clj file. No problem...but what version to put in the dependencies list?

<del>After sifting through the [jclouds group](https://groups.google.com/forum/?fromgroups#!forum/jclouds) and [jclouds-dev groups](https://groups.google.com/forum/?fromgroups#!forum/jclouds-dev) I find [a post that points to beta.10 being the latest and greatest](https://groups.google.com/forum/?fromgroups#!topic/jclouds-dev/eCIrMiMDMAs).</del> I find a blog that points to 1.5.1 being the latest and greatest. I'll try putting that in the project.clj file and give it a shot.

<script src="https://gist.github.com/3360972.js"></script>

That's a lot of JARs.

Now all I want to do is list all of my servers on the [Rackspace open cloud](http://www.rackspace.com/cloud/public/). After some trial and error I came up with the following app.

<script src="https://gist.github.com/3361018.js"></script>

Follow the instructions below to compile and run the app. Thankfully Java 1.6 allows for wildcard expansion on the command line, otherwise it would be a serious pain including all of those JARs.

<script src="https://gist.github.com/3361041.js"></script>

There you have it. If anyone is more familiar with lein and/or leiningen and can show me how to limit it to downloading just the JARs I need, let me know in the comments.

This post was written on Mac OS X 10.8, Java 1.6.0, jclouds 1.5.1 <del>1.5.0-beta.10</del>. If you're on a different OS and run into problems, please feel free to comment.
