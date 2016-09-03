---
author: Everett Toews
comments: true
date: 2012-10-10 16:13:48+00:00
layout: post
slug: sdks-at-the-openstack-grizzly-summit
title: SDKs at the OpenStack Grizzly Summit
image: /img/posts/grizzly.jpeg
categories:
  - jclouds
  - openstack
---

<img class="img-right" src="/img/posts/grizzly.jpeg"/>SDKs are a vital resource for any ecosystem and SDKs for OpenStack are proliferating. The [OpenStack Grizzly Summit](http://www.openstack.org/summit/san-diego-2012/) has a few sessions dedicated to SDKs that I wanted to highlight.

<!--more-->

  1. On Monday @ 11:00 am I'll be leading the session [SDK Documentation Discussion](http://openstacksummitfall2012.sched.org/event/2215363b1716a519e786e126b493e3a3#.UHWUMvk-vjZ). Some of the topics/questions we're going to address are:
    1. What SDKs are you using and why?
    2. How do we track SDKs that support OpenStack?
    3. Where do we track SDKs that support OpenStack?
    4. What criteria do we use to allow an SDK to claim OpenStack support?
    5. When documenting the SDK API at the function level, do you duplicate info from api.openstack.org or do you just link to it? Are there other options?
    6. What's missing from the documentation of the SDKs you're using?
  2. On Tuesday @ 11:50 am Rob Hirschfeld from Dell will be leading the session [Quantum Fog! Networking for Programmatic Overlays](http://openstacksummitfall2012.sched.org/event/7eb454e75464fc05519ff24510fae512#.UGx37_k-sp8)
    1. [Fog](http://fog.io/) is the leading Ruby abstraction library for the OpenStack API and it's embedded in several ecosystem products.  With the addition of Quantum, there is a need to extend Fog's models to comprehend cloud networking.
  3. On Thursday @ 3:20 pm I'll be leading the workshop [Control the Clouds: Developer Experience with jclouds](http://openstacksummitfall2012.sched.org/event/7f8cd9808c0375e95002cdcbcde03caf#.UGx3Q_k-sp9)
    1. [jclouds](http://www.jclouds.org/) is the leading Java cross-cloud toolkit for the OpenStack API and already has a broad adoption base. In this workshop, you will learn how to write code that can control any cloud with jclouds.

## Coda

Contributing to and supporting an open source SDK should not be taken lightly. The OpenStack community needs to consider throwing its weight behind a select number of SDKs to in order to provide the best developer experience, the highest possible quality/support, and to limit fragmentation. Please join us at the sessions above and let's find out how the OpenStack community can achieve this.
