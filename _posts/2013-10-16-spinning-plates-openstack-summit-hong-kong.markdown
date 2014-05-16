---
author: Everett Toews
comments: true
date: 2013-10-16 16:51:16+00:00
layout: post
slug: spinning-plates-openstack-summit-hong-kong
title: Spinning Plates at the OpenStack Summit in Hong Kong
categories:
- developer advocacy
- jclouds
- openstack
---

[![Spinning Plates](/img/posts/spinning-plates.png)](/img/posts/spinning-plates.png)The [OpenStack Summit in Hong Kong](http://www.openstack.org/summit/hk/) is less than a month away now. Leading up to the Summit I was a track chair for the [Apps On OpenStack track](http://openstacksummitnovember2013.sched.org/type/apps+on+openstack). We had many excellent proposals that we're voted up by the community. Selecting the finalists wasn't easy. I think we found a good mix of sessions about applications built on top of OpenStack, the tools that enable developers to build those applications effectively, and the design decisions that developers will need to consider when building apps on OpenStack.

Beyond that I'll be spinning plates at Summit! I've got a schedule packed full of demos, presentations, panel moderation, and design. In summary, here's where you can find me before and during the Summit.







Date/Time
Session
Location





Monday, Nov. 4
7:30 pm


[Hong Kong Java User Group: Application Development in the Cloud with jclouds](http://hkjug.org/2013-11-04-application-development-in-the-cloud-with-jclouds)


[Room M109, Floor 1, Core M, Li Ka Shing Tower
Hong Kong Polytechnic University](http://goo.gl/maps/g72Kj)






Tuesday, Nov. 5
11:15 am


[OpenStack Neck Beards and Suits Unite!](http://openstacksummitnovember2013.sched.org/event/9b7fd213c402119a0ee3e498f647488a)


SkyCity Grand Ballroom C






Tuesday, Nov. 5
2:50 pm


[Documenting Application Developer Resources](http://summit.openstack.org/cfp/details/185)


DS-1 (79) [room202]






Thursday, Nov. 7
11:50 am


[The OpenStack Community Welcomes Developers in All Languages](http://openstacksummitnovember2013.sched.org/event/41b333a6736a92f4056246719deec1fc)


SkyCity Grand Ballroom C









Thursday, Nov. 7
1:20 pm


[Lightning Talk](http://openstacksummitnovember2013.sched.org/event/5751d553a42196f1a0c1d11f780a336f): [NetflixOSS](http://netflix.github.io/) on OpenStack


Expo Breakout Room



Thursday, Nov. 7
3:30 pm


[Panel on Application Portability](http://openstacksummitnovember2013.sched.org/event/c77ad452143aad02ba15b817c1e9c9d8)


Expo Breakout Room 1




Here's everything in more detail.


## [HKJUG meeting: Application Development in the Cloud with jclouds](http://hkjug.org/2013-11-04-application-development-in-the-cloud-with-jclouds)


[![HKJUG](/img/posts/hkjug.jpeg)](/img/posts/hkjug.jpeg)The cloud has emerged as the next major platform. So where do developers turn for the toolkits that will make them productive and effective in the cloud?

For Java, the answer is jclouds.

Apache jclouds is an open source library that helps you get started in the cloud and utilizes your Java or Clojure development skills. The jclouds API gives you the freedom to use portable abstractions or cloud-specific features. It's a multi-cloud toolkit that works with both public and private clouds, enabling hybrid cloud workloads.

There is a great community behind this toolkit working together to provide a better experience for developers in the cloud. Their goal is to simplify the control of many different clouds while still giving you the freedom to use cloud-specific features. The result is a toolkit that allows developers to write better code, in a shorter period of time, that works with supported clouds.

In this meeting, you will learn how to write Java that can control multiple clouds using interoperable code with jclouds. The agenda is as follows:




  1. Overview of jclouds, its terminology and its community.


  2. Purpose and benefits of using jclouds.


  3. Install jclouds for use on the command line.


  4. Work through an example of using jclouds to start virtual machines in the cloud.


  5. Work through an example of using jclouds to store files in the cloud.


Speaker: Everett Toews


## [OpenStack Neck Beards and Suits Unite!](http://openstacksummitnovember2013.sched.org/event/9b7fd213c402119a0ee3e498f647488a)


This lighthearted talk discusses the cultural divide between the OpenStack developers, system admins and business folks and urges both sides to show each other some love. I will review real use cases/situations and share lessons I've learned to overcome the artificial barriers so we can continue to have nice things like OpenStack.

Speakers: Joshua McKenty and Everett Toews


## [Lightning Talk](http://openstacksummitnovember2013.sched.org/event/5751d553a42196f1a0c1d11f780a336f): [NetflixOSS](http://netflix.github.io/) on OpenStack


[![NetflixOSS](/img/posts/netflixoss-e1360792045763.jpeg)](/img/posts/netflixoss-e1360792045763.jpeg)Here I plan on doing a lightning talk or breakout session on porting the NetflixOSS suite to OpenStack. I want to discuss:




  1. Why are people interested in porting NetflixOSS to OpenStack?


  2. What pieces have already ported.


  3. Who is interested in porting.


  4. What are the priorities.


  5. How to bring people together to make sure we're working effectively.


If you are interested in NetflixOSS on OpenStack, please feel free to contact me beforehand at everett[dot]toews<at>rackspace[dot]com.

Speakers: Everett Toews and anyone else who wants to join


## [The OpenStack Community Welcomes Developers in All Languages](http://openstacksummitnovember2013.sched.org/event/41b333a6736a92f4056246719deec1fc)


[![OpenStack Nation](/img/posts/openstack_nation1-lrg.png)](/img/posts/openstack_nation1-lrg.png)

The OpenStack application programming interface (API) is accessible via web services. However, the application developers who are building solutions on top of OpenStack do not want to talk to that API directly. They want to talk to OpenStack in the programming language of their choice. That means using software development kits (SDK) written in a variety of programming languages. These SDKs allow the developers to be more efficient and productive when using OpenStack.

In this session you will learn the following about software development kits:




  1. Why they are necessary.


  2. What they can do for developers.


  3. Which ones are available.


  4. How to use them.


  5. Who is developing them.


  6. What comes next.


Speaker: Everett Toews


## [Panel on Application Portability](http://openstacksummitnovember2013.sched.org/event/c77ad452143aad02ba15b817c1e9c9d8)


It's a multi-cloud world and your code needs to run somewhere. However, the cloud you choose today may not be the cloud you need tomorrow. Changes in reliability, performance, cost, and privacy may drive you to research alternative public clouds, a private cloud, or a hybrid of the two. Considering application portability upfront can be crucial in avoiding lock-in. The tools you use to interact with the cloud will play a large part in how portable your application is between clouds.

This panel will discuss the different approaches to application portability, e.g. API compatibility, multi-cloud SDKs, image portability, application architecture portability, etc. Is application portability a myth or reality? What are the pros and cons?

Bring your questions to be answered by our panel of experts.

Moderator: Everett Toews

Panelists: Randy Bias, Uri Cohen, Hunter Nield, George Reese


## [Documenting Application Developer Resources](http://summit.openstack.org/cfp/details/185)


This is a design session that is still in the proposal stage. Design sessions usually aren't approved until just before the Summit so I'm not sure if/when it will be.

The purpose of this session is to outline a vision, and attempt to define the practical steps that we should take over the next year to achieve it.

**The Portal**
Can you imagine if we had developer.openstack.org?

A single place where application developers coding in any language could come to learn about openstack and find the resources they need to write scalable cloud applications for OpenStack.

The site would be a portal containing links to other areas:




  * All of the SDKs


  * CLI docs for scripting e.g. in bash


  * API documentation (acknowledging that the majority of developers will use SDKs, not the API directly)


  * Where to get help


**Existing Python Libraries**
Answer the question: are python-*client to be treated as libraries? As in: the Python SDK for OpenStack.
If so, an important parallel of this work would be to asess the current python binding resources and improve them to be an exemplar for other SDKs to follow.

**What defines an SDK?**
From the wiki (https://wiki.openstack.org/wiki/SDKs):




  * A set of language bindings that provide a language-level API for accessing OpenStack in a manner consistent with language standards.


  * A Getting Started document that shows how to use the API to access OpenStack powered clouds.


  * Detailed API reference documentation.


  * Tested sample code that you can use as a "starter kit" for your own OpenStack applications.


  * SDKs treat OpenStack as a blackbox and only interact with the REST/HTTP API.


  * License must be compatible with Apache License v2.


If an SDK does not meet these criteria, it's not considered an SDK for OpenStack.

Additional criteria could be discussed, such as:


  * Does the SDK have an active community?


  * Is it promptly updated for new API releases?


Join us to discuss these topics as we refine our vision.

Speakers: Tom Fifield and Everett Toews


## Coda


It's going to be a busy week in Hong Kong but I'm really looking forward to it (okay...not so much looking forward to the 22 hour flight but there's no getting around that). There is also going to be one particularly cool announcement timed to coincide with the Summit that I'll be a part of.

Hopefully I won't be dropping any of those plates!
