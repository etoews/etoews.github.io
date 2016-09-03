---
author: Everett Toews
comments: true
date: 2015-05-14 14:00:00+00:00
layout: post
slug: state-of-the-api-wg-liberty-edition
title: State of the OpenStack API Working Group&#58; Liberty Edition
image: /img/posts/openstack.png
categories:
  - openstack
  - api
---

<img class="img-right" src="{{ page.image }}"/>The API is the foundation of all user interaction with OpenStack. It's fundamental to the usability of OpenStack as a platform. A well designed and consistent API across all OpenStack projects is necessary, otherwise all of the layers above the API (SDKs, CLIs, Web Apps, Mobile Apps) suffer. As such, the [OpenStack API Working Group](http://specs.openstack.org/openstack/api-wg/) (WG) has a clear mission.

To improve the developer experience of API users by converging the OpenStack API to a consistent and pragmatic RESTful design. The working group creates guidelines that all OpenStack projects should follow for new development, and promotes convergence of new APIs and future versions of existing APIs.

<!--more-->

But things weren't always so clear! As the API WG approached OpenStack projects we often faced the question, which can be paraphrased as, "Who are you and what are you trying to do to my API?!?!!" This left the WG members asking the same question of ourselves. Thus the mission statement was hammered out in a [patch set](https://review.openstack.org/#/c/155911/) and on the openstack-dev mailing list. It was a necessary detour from the regular business of creating guidelines to ensure that everyone within the group had the same vision of our mission and that we could clearly communicate that mission out to the OpenStack projects.

## The Kilo Release Cycle

The API Working Group was founded by myself, Jay Pipes, and Chris Yeoh shortly before the Kilo Summit so it has only been in existence for a little over 6 months. In that time we've established our purpose, communication channels, deliverables, how to contribute, and scope in the [API Working Group wiki page](https://wiki.openstack.org/wiki/API_Working_Group). In terms of our deliverables, we analyzed current API design, created guidelines, and reviewed API impacting code.

By the numbers:

* 9 current design analysis wiki pages
* ~10 guidelines
* ~170 API impacting change requests
  * ~50 API impacting change requests reviewed

The number of guidelines could have been higher but a significant amount of time was spent establishing our identity as a group and how we will work together. It's also heartening to see that there are already [more than 10 guidelines up for review](https://review.openstack.org/#/q/status:open+project:openstack/api-wg,n,z). We'll be guaranteed to at least double our guideline output for the next cycle.

I also want to call out that we added a new core member to the project during Kilo. Please welcome Michael McCune to the API WG core team!

We also gained a lot of traction in the OpenStack projects during this time. Here are some select quotes.

* "I like this, many thanks." - [John Garbutt, Nova PTL](https://review.openstack.org/#/c/155620/)

* "I also seek feedback from the API-wg" - [Salvatore Orlando, Neutron Core](http://lists.openstack.org/pipermail/openstack-dev/2015-May/063366.html)

* "I would like to get the advise of the Openstack Community and the API working group on how PATCH semantics should work." - [Amit Gandhi](http://lists.openstack.org/pipermail/openstack-dev/2014-December/052878.html)

* "dovetails with developer focused API errors" - [Rochelle Grober, Logging WG](http://lists.openstack.org/pipermail/openstack-dev/2015-April/061258.html)

* "Everett, Thanks! Just joined!" - [Alex Xu](http://lists.openstack.org/pipermail/openstack-dev/2015-May/063136.html), [Nova](https://wiki.openstack.org/wiki/Nova/APIWGLiaisons)

This last quote has particular relevance as we move into the Liberty Release Cycle.

## The Liberty Release Cycle

There is a lot of work to do and a lot we can improve upon in the coming release cycle. One of the most promising improvements to date has been how the OpenStack Nova project has defined the [responsibilities of their liaisons](https://wiki.openstack.org/wiki/Nova/APIWGLiaisons). These Nova project members, Matthew Gilliard and Alex Xu, now have a clearly defined process for interacting with the API WG. I think this is a process that could be generalized for all projects willing to commit someone to this role.

There are also many other areas ripe for improvement.

* Meeting times
* Finding more traction
* Writing more guidelines
* Publishing the guidelines
* Formalizing the merge process
* Getting projects to implement the guidelines
* Using the guideline template
* The educational aspect of the API WG

We'll be discussing these areas at the Liberty Summit in Vancouver over the course of 3 design sessions.

* [API Working Group: State of the Group](https://libertydesignsummit.sched.org/event/e14d84514003140fe30e984027299a44)
* [API Working Group: Working Session 1](https://libertydesignsummit.sched.org/event/3fe7ba65fed52540e6116f7bee2392a6)
* [API Working Group: Working Session 2](https://libertydesignsummit.sched.org/event/c02c575cd390b71d5e17a3f27f6b5806)

There are also 2 summit sessions related to the API WG.

* [APIs Matter](https://libertydesignsummit.sched.org/event/bf6f86afe58148a96ab9d1dd0d30a554)
* [The Good and the Bad of the OpenStack REST APIs](https://libertydesignsummit.sched.org/event/602a2acdca6f546cef89dc0c4356e3d8)

If you're attending the summit, we hope to see you there!

## Coda

If you're a user of an OpenStack cloud, you care about the API, whether you know it or not. Poorly designed and inconsistent APIs manifest themselves as incomprehensible errors, incompatibilities, and bugs in other interfaces. If well designed and consistent APIs matter to you, here's [how to join](https://wiki.openstack.org/wiki/API_Working_Group#How_to_Join) the OpenStack API Working Group.
