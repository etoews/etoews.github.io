---
author: Everett Toews
comments: true
date: 2013-02-14 02:41:51+00:00
layout: post
slug: netflix-aims-to-be-scalable-functional-and-portable-or-how-to-run-a-meetup
title: Netflix Aims to be Scalable, Functional, and Portable (or How to Run a Meetup)
image: /img/posts/netflixoss-e1360792045763.jpeg
categories:
- jclouds
---

<img class="img-right" src="/img/posts/netflixoss-e1360792045763.jpeg"/>Netflix has been open sourcing the software that makes up their platform at a torrential pace. On February 6th, 2013 I attended their first ever open house where they gave developers a bit more insight into their motivation for going open source. The whole event was very professionally run and could be used as a template for how to run a meetup with that much content.

<!--more-->

## The Meetup

Upon entering the Netflix offices in Los Gatos, CA it was immediately obviously where to go to register. Two people were taking care of the registration and handing out name tags with names already printed on them. After registering, two people were passing out Netflix t-shirts and another two were directing traffic. Attendees were moved through the whole process smoothly and quickly. I helped myself to a drink and some popcorn and took my seat in the auditorium.

The meetup itself was broken down into 3 sections.

  1. Overview (30 min.)
  2. Lightning talks (30 min.)
  3. Project walkthroughs/demos (30 min. + however long you wanted to stay)

The overview was conducted by Adrian Cockroft, I'll discuss that more below. Following the overview was a series of lightning talks about a select number of the open source projects which were presented by the developers themselves. As it should be, no lightning talk was longer than 5 minutes. Unsurprisingly the quality of the lightning talks varied from developer to developer. It was apparent that each developer had created their own slides. That's okay but I think this aspect of the meetup would have benefitted from someone giving the developers a few tips on avoiding some common presentation anti-patterns (small fonts, too much text, etc.).

After the lightning talks were done we had a decision to make. Stay in the auditorium and get an introduction to Asgard or walk over to another area where the developer leads would be giving demos and walkthroughs of the various projects introduced during the lightning talks. I opted to check out the demos and walkthroughs and get a bite to eat.

## The Overview

Adrian Cockroft first walked everyone through the history of open source at Netflix. He told an anecdote about how one of the developers asked what the policy was for open sourcing a project. The developer was told that the the Netflix policy is to have no policies, just go for it. The developer then asked if he should run it by legal and the reply was “If you think legal review is going to improve your code quality, go ahead!” Over a year later, Netflix has open sourced 18 projects with more on the way.

Adrian then went on talk about the strategy and motivation behind Netflix's open source offering. There are 4 primary goals.

  1. Establish [Netflix's] solutions as Best Practices / Standards
  2. Hire, Retain and Engage Top Engineers
  3. Build up Netflix Technology Brand
  4. Benefit from a shared ecosystem

<div class="img-center"><img src="/img/posts/img_2144.jpg"/></div>

At a very abstract level, Adrian talked about the single points of failure facing the Netflix platform. He felt that Netflix had achieved a Functional and Scalable platform but they had yet to be Portable. Given some of the high profile outages Netflix has suffered on AWS this is understandable. However, the fact of the matter is that competitors haven't yet reached the same level of functionality and scalability that AWS has but that day is not far off. So Netflix has chosen to get a head start on portability.

<div class="img-center"><img src="/img/posts/img_2153.jpg"/></div>

Finally, he wrapped things up with some concluding statements on the future of the Netflix platform. These were summed up as:

  1. Functionality and scale now, portability coming
  2. Moving from parts to a platform in 2013
  3. Netflix is fostering an ecosystem
  4. Rapid Evolution - Low MTBIAMSH (Mean Time Between Idea And Making Stuff Happen)

<div class="img-center"><img src="/img/posts/img_2158.jpg"/></div>

You can find more detail on his talk at the [First NetflixOSS Meetup](http://techblog.netflix.com/2013/02/first-netflixoss-meetup.html). After the overview was complete, it was time for the lightning talks. In general these were well done and served as a great introduction to some of the open source projects. They also enticed developers to take a deeper dive into the projects during the next section of the meetup where the project leads were offering demos and walk-throughs. That was were I headed next to get more detail on one specific project.

## Denominator

Denominator is a Java library for controlling DNS, being built to be as portable as possible, with few dependencies. Adrian Cockroft introduced Denominator as the latest addition to Netflix's open source stable during his overview.

<div class="img-center"><img src="/img/posts/img_2156.jpg"/></div>

I was particularly interested in this as it's being led by Adrian Cole, the founder of [jclouds](http://www.jclouds.org/). I've been working with Cole for the past 6 months on jclouds, ever since it was adopted by Rackspace as our official [Java SDK](http://docs.rackspace.com/sdks/guide/content/java.html).

After getting a tour of [Denominator](https://github.com/Netflix/denominator), I noted a number of similarities in architecture between it and jclouds...naturally. It was interesting to see how he was using [Dagger](http://square.github.com/dagger/) for dependency injection as opposed to the way Guice is used in jclouds. He was also using an interesting tool to power a [Denominator command line client](https://github.com/Netflix/denominator/tree/master/denominator-cli). <del>The name escapes me but I'll update this post once I remember.</del> I'm looking forward to the future of Denominator and its role in making the Netflix platform more portable.

## Coda

All in all it was a interesting evening discussing open source software. The content was great and the meetup was very well run. The coup de grâce was the food and drinks provided by Netflix. It might seem like a small or insignificant thing but when a meetup provides an excellent meal beyond the standard fare of pizza and soda, it's just one more point that sets it above the rest and leaves a lasting impression.

Bon Appétit.

<div class="img-center"><img src="/img/posts/img_2164.jpg"/></div>
