---
author: Everett Toews
comments: true
date: 2013-11-12 23:31:03+00:00
layout: post
slug: plates-spun-at-the-openstack-summit
title: Plates Spun at the OpenStack Summit
image: /img/posts/p1100830b.jpg
categories:
  - jclouds
  - openstack
  - rackspace
---

I spent the past week in Hong Kong at the OpenStack Summit. It was by far the furthest I've ever travelled for a Summit and by far the busiest I've ever been at a Summit. Here are some of the highlights.

<!--more-->

  1. The People at Rackspace HK
  2. jclouds Became an Apache Top Level Project
  3. Hong Kong Java User Group
  4. OpenStack Hoodies and Blazers Unite!
  5. Documenting Application Developer Resources
  6. The OpenStack Community Welcomes Developers in All Languages
  7. NetflixOSS on OpenStack
  8. Panel on Application Portability
  9. OpenStack Operations Guide Will Be Published by O'Reilly

## The People at Rackspace HK

<img class="img-right" src="/img/posts/p1100830b.jpg"/>I decided to stop by the Rackspace HK office to meet the team there. Their success at getting the [Rackspace Cloud up and running in HK](http://www.rackspace.com.hk/) in time for the Summit was an impressive feat. But I know how they did it. It was the great people they have combined with some help from Rackers across the globe. I even got to celebrate with them as they kindly invited me out to a BBQ at Shek O beach to commemorate the the occasion.

## jclouds Became an Apache Top Level Project

By fortunate coincidence jclouds became an Apache Software Foundation TLP at the start of the week. I wrote a post about it [here](http://blog.phymata.com/2013/11/02/jclouds-is-an-apache-tlp/).

## Hong Kong Java User Group

Traveling to Hong Kong takes a long time so I figured I'd put my time here to good use and propose a talk at the HKJUG organized by Sunny Chan. That turned into my presentation on Application Development in the Cloud with jclouds. Before the presentation started the user group was having a general discussion around describing web service APIs. I pointed them to the Web Application Description Language ([WADL](http://en.wikipedia.org/wiki/Web_Application_Description_Language)), the [examples in OpenStack](https://github.com/openstack/api-site/tree/master/api-ref/src/wadls), and how you might use them in Java with [wadl2java](https://wadl.java.net/).

The presentation itself went very well. Live demoed with zero problems! And when I ran out of time for my second demo, everyone was eager to stick around a bit longer for more jclouds. Here are the slides.

<div class="img-center"><iframe src="http://www.slideshare.net/slideshow/embed_code/27887880?rel=0" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px 1px 0; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/phymata/jclouds-at-hkjug" title="jclouds at HKJUG" target="_blank">jclouds at HKJUG</a> </strong> from <strong><a href="http://www.slideshare.net/phymata" target="_blank">Everett Toews</a></strong> </div></div>

## OpenStack Hoodies and Blazers Unite!

Joshua McKenty and I stepped in for Soo Choi, who couldn't attend this Summit, and gave a talk about the changing nature of how things get done in the OpenStack ecosystem. The community has expanded in so many diverse ways that we can no longer rely solely on social cohesion to get work done. We need to focus more on task cohesion and all parties responsible for it to continuing growing OpenStack.

## Documenting Application Developer Resources

I co-lead this session about documenting application developer resources with Tom Fifield, an OpenStack community manager. OpenStack has always been a platform for application developers but with many of the new features released in Havana the app developers are coming to the forefront. In order to on board these developers onto OpenStack quickly we need to give them reliable tools they can work with to build their applications. This session is the start of that effort. Many decisions were made (here's the [etherpad](https://etherpad.openstack.org/p/icehouse-doc-app-devs)) and a path forward was chosen.

Many a decision was made:

  * developer.openstack.org should be a 'thing'
  * developer.openstack.org code lives in separate repo
  * api.openstack.org stays where it is for the next cycle, but needs an intro for clarification
  * python client "SDK" documents need work, which needs to come from "OpenStack Developers"
  * fixing the python-*client guides (need to find a resource - Lorin was willing) -- create a blueprint for this (action: Tom)
  * for non-python SDK docs, we don't write them, but may patch upstream code/doc if there's a problem
  * python SDK guide (https://review.openstack.org/#/c/52857/) lives in openstack-manuals -- this should really have a blueprint too
  * use ask.openstack.org for support of Python "SDK"
  * make a (HTML) mock-up to see what this is going to look like before putting it all in the tool

Among the session attendees were Colin McNamara and Sean Roberts. They contributed a lot to the discussion and had a lot of great suggestions for where to take things after a foundation had been laid.

## The OpenStack Community Welcomes Developers in All Languages

This was a session where I trumpeted the virtues of using software development kits (SDKs) written in various programming languages to access the OpenStack APIs. These SDKs provide many benefits to application developers and will immediately make them more productive, more efficient, and less frustrated when build solutions on OpenStack. The call to action was simple. Use or contribute to an [OpenStack SDK](https://wiki.openstack.org/wiki/SDKs).

<div class="img-center"><iframe src="http://www.slideshare.net/slideshow/embed_code/28030044?rel=0" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px 1px 0; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/phymata/the-openstack-community-welcomes-developers-in-all-languages" title="The OpenStack Community Welcomes Developers in All Languages" target="_blank">The OpenStack Community Welcomes Developers in All Languages</a> </strong> from <strong><a href="http://www.slideshare.net/phymata" target="_blank">Everett Toews</a></strong> </div></div>

There was a few minutes for questions at the end of the session. However, I ran long answering them all. Luckily it was the session right before lunch. Even so, many developers came up to me after the session for more details, questions, and advice. It was great to see such engagement from the OpenStack community here. Clearly there is a demand for these kinds of tools in the ecosystem.

<iframe width="750" height="422" src="http://www.youtube.com/embed/TF-bRLMwbXo?rel=0" frameborder="0" allowfullscreen></iframe>

## NetflixOSS on OpenStack

Developers often need a diverse set of tools to build their applications. One such set is the [NetflixOSS](http://netflix.github.io/) stack. However, this stack of software really only works with Amazon Web Services. But there are those in the ecosystem who are interested in making them work with OpenStack. I encourage everyone to join the [Netflix on OpenStack Google Group](http://groups.google.com/d/forum/netflixoss-on-openstack) so that we could coordinate and discover any existing efforts.

<div class="img-center"><iframe src="http://www.slideshare.net/slideshow/embed_code/27990801?rel=0" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px 1px 0; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/phymata/netflixoss-on-openstack" title="NetflixOSS on OpenStack" target="_blank">NetflixOSS on OpenStack</a> </strong> from <strong><a href="http://www.slideshare.net/phymata" target="_blank">Everett Toews</a></strong> </div></div>

There has been some success already. Yuriy Brodskiy from Paypal has signed up and has been helping make Asgard work on OpenStack as [Aurora](https://github.com/paypal/aurora). Justin Santa Barbara also joined and is known to be responsible for creating a barrel of Chaos Monkeys.

## Panel on Application Portability

To finish off the day, I moderated the Panel on Application Portability. This panel was aimed at discussing the kinds of aspects that developers need to consider when making their applications portable across different clouds. It was a lively debate between our panelists Randy Bias, Hunter Nield, Yaron Parasol, and George Reese, in reaction to many questions from the audience.

<iframe width="750" height="422" src="http://www.youtube.com/embed/ZeciW11lU18?rel=0" frameborder="0" allowfullscreen></iframe>

## OpenStack Operations Guide Will Be Published by O'Reilly

<img class="img-right" src="/img/posts/oreilly-openstack-ops-guide-early-release.png"/>My favourite surprise from the Summit was the announcement that the OpenStack Operations Guide that I co-authored with Anne Gentle, Jonathan Proulx, Joe Topjian, Tom Fifield, Diane Fleming, and Lorin Hochstein will be published by O'Reilly! It will be added to their stable of quality technical books. At this point it remains uneditted but the way has been cleared for it to be published. I'm looking forward to updating it for the OpenStack Havana release. Anne wrote a blog post on it [here](http://www.openstack.org/blog/2013/11/openstack-operations-guide-now-an-oreilly-early-edition/).

## Coda

At the end of each day of plate spinning it's alway great to kick back with the folk that comprise OpenStack. As always the technology is driven by the people, the community that makes up OpenStack. I met many new people at this Summit and rekindled many old friendships. And while social cohesion may not solely be able to drive OpenStack forward, it still is and will always be one of the aspects of the Summits that I enjoy the most.

For more OpenStack Summit fun read Anne Gentle's recap [Reflecting on the OpenStack Summit in Hong Kong](http://justwriteclick.com/2013/11/13/reflecting-on-the-openstack-summit-in-hong-kong/).
