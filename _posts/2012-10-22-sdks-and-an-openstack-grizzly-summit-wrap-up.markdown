---
author: evtoews
comments: true
date: 2012-10-22 17:54:42+00:00
layout: post
slug: sdks-and-an-openstack-grizzly-summit-wrap-up
title: 'SDKs and an OpenStack Grizzly Summit Wrap Up '
wordpress_id: 130
categories:
- jclouds
- openstack
- rackspace
---

[![OpenStack Grizzly Summit](/img/posts/openstack-summit-homepage-splash.png)](/img/posts/openstack-summit-homepage-splash.png)The OpenStack Grizzly Summit has wrapped up and it was another huge success. The new format of having the Summit and Conference at the same time worked well. Good venue, the wifi held up, the organizers accommodated the overflow people (i.e. 200-300 unregistered attendees) with amazing aplomb, there were always healthy food choices, and coffee/water was present at all times. All in all, great organization by the OpenStack Foundation that allowed everyone to stay focused on the task at hand, improving OpenStack in every way possible.

I wanted to highlight some of the progress made on the Software Development Kit (SDK) front during the Summit.


## Monday


I led a session titled [SDK Documentation Discussion](http://openstacksummitfall2012.sched.org/event/2215363b1716a519e786e126b493e3a3) (here are the [raw etherpad notes](https://etherpad.openstack.org/sdk-documentation)). I've been participating in Summits since Bexar in San Antonio and, as far as I know, this is the first time SDKs have been discussed in any depth so it turned out to be more of a survey of existing SDKs and brainstorming session. We started with a definition of SDKs to make sure we were all on the same page. I asked what SDKs people were using and got a variety of answers. On the topic of what criteria to use to allow an SDK to claim OpenStack support we thought that one day the Foundation might have some sort of validation test suite to determine compatibility.

Finally getting around to the topic of documentation, we brainstormed some ideas for documenting method level APIs in an SDK native doc tool while still keeping that information consistent with existing OpenStack specs. We also talked about a number of ways to keep up to date with changes to the various APIs. I think I can summarize that as simply having to tune my receptors to all the different channels where API change notifications can be broadcast. When the question of what it means for an SDK to be considered feature complete came up, I was somewhat surprised to hear the opinion that documenting your feature support can be more important the "feature-completeness". Upon a bit of reflection, this makes good pragmatic sense. As a developer many times all I want to know is if this tool is going to do what I want it to without having to get a developer environment setup and prototype something.

I've been purposefully a bit vague in my descriptions above because one of the action items to come out of the discussion was for me to start tracking this stuff on an OpenStack wiki page and I didn't want to duplicate the information here. You can now find that page at [wiki.openstack.org/SDKs](http://wiki.openstack.org/SDKs).


## Tuesday


On Tuesday I spoke to Simon Anderson, CEO of [DreamHost](http://dreamhost.com/), and explained how Rackspace was committing developers to support open source cross-cloud toolkits such as jclouds, libcloud, fog, and php-opencloud. I talked about how HP is also supporting Java jclouds and Dell is supporting Ruby fog. How if we all throw our weight behind select SDKs, the quality and support of those SDKs will be better and we can avoid fragmentation. Plus we'll inherit all of the existing OpenStack support, documentation, sample code, and user bases in those projects. Simon perceived the benefits immediately and let me know his team at DreamHost would start looking at supporting those toolkits as well.

The DreamHost team are a great group of people and I'm really looking forward to any future collaborations.


## Wednesday


Wednesday started out with the Rackspace media team releasing the video [A Look at SDKs](http://www.rackspace.com/blog/video-openstack-summit-day-two-a-look-at-sdks/).

Troy Toman from Rackspace gave a [morning keynote](http://www.rackspace.com/blog/video-troy-tomans-openstack-summit-keynote/). Personally I found it quite inspiring. He described how Rackspace runs on OpenStack trunk minus 2 weeks. We've got Grizzly already! Troy showed how we can have a build of OpenStack ready to go in 47 minutes and prepared for production. He also talked about how Rackspace engineers will turn their attention back to the community now that we've got OpenStack in production. We're committed to trusting the community. It was also very generous of Troy to highlight our SDKs and give the Developer Relations Group a shout out.

A design session titled [Standardizing client & API capabilities](http://openstacksummitfall2012.sched.org/event/3bc5e12963c0d9a98c134dcdd2e816b4) (here are the [raw etherpad notes](https://etherpad.openstack.org/grizzly-api-capabilities)) led by Gabriel Hurley I found to be very relevant to SDKs as well. He was proposing an effort to achieve consistency and common feature (e.g. pagination, filtering, bulk objects action, etc.) parity across the various APIs as well. In all of the subsequent API design sessions I attended I was sure to bring up Gabriel's effort and in the hopes that all of the API design efforts underway would take his proposals into consideration sooner rather than later. If OpenStack can deliver a more consistent API experience, it will drastically simplify writing SDKs and provider a better overall developer experience.


## Thursday


On Thursday I gave my [Control the Clouds: Developer Experience with jclouds](http://openstacksummitfall2012.sched.org/event/7f8cd9808c0375e95002cdcbcde03caf) workshop. You can find the workshop itself at [bit.ly/jclwork](bit.ly/jclwork). Considering it was in the second last time slot session of the entire Summit, there was a relatively good turn out of 20-25 people. The workshop went off without any network problems (thanks Cisco) or Murphy's Law style issues, which was a relief. I got some good questions at the end so I knew people were engaged.

By this point in the Summit the tech press were well aware of the new [Rackspace open cloud SDKs](http://docs.rackspace.com/sdks/guide/content/intro.html)thanks to the masterful efforts of Wayne Walls and Hart Hoover. They got the SDKs mentioned in the following articles.




  * [Rackspace Opens SDKs for Java and PHP](http://www.drdobbs.com/jvm/rackspace-opens-sdks-for-java-and-php/240009274)


  * [Rackspace Launches Open PHP, Java SDKs for OpenStack](http://www.zdnet.com/rackspace-launches-open-php-java-sdks-for-openstack-7000005812/)


  * [Rackspace Creates SDKs for Java, PHP](http://www.sdtimes.com/RACKSPACE_CREATES_SDKS_FOR_JAVA_PHP/By_David_Rubinstein/About_CLOUD_and_JAVA_and_PHP_and_RACKSPACE/37075)


  * [OpenStack Summit: Open Cloud Platform Gets Big Push](http://forwardthinking.pcmag.com/none/303965-openstack-summit-open-cloud-platform-gets-big-push)


  * [Rackspace Gives Java and PHP Developers Power to Leverage OpenStack Services](http://it.tmcnet.com/topics/it/articles/2012/10/16/312235-rackspace-gives-java-php-developers-power-leverage-openstack.htm)




## Coda


A lot of hard work and preparation went into getting ready for this Summit. Everything went amazingly well and it exceeded my expectations in practically every way possible. Cheers to the OpenStack Foundation for putting on such a well organized event. No doubt the Grizzly release will live up to its namesake.
