---
author: Everett Toews
comments: true
date: 2013-07-31 14:44:14+00:00
layout: post
slug: keep-the-cloud-honest
title: Keep the Cloud Honest
categories:
- cloud
---

[![Cloud Providers](/img/posts/cloud-providers1.png)](/img/posts/cloud-providers1.png) Last week at OSCON 2013 I gave a presentation entitled Cloud Portability With Multi-Cloud Toolkits. Not exactly a flashy title but you had a good idea of what you were going to get. I did a full write-up of it [over here](http://www.rackspace.com/blog/cloud-portability-value-of-the-multi-cloud-toolkit/) so I won't regurgitate that post. However, I will summarize why cloud portability is important and why you always want to be in a position to be able to switch cloud providers.




  * If your performance requirements are not being met.


  * If the privacy and compliance policies are not up to snuff.


  * If the monthly bills have become eye popping.


  * If you're not getting the service and support you need.


  * If a strictly public cloud environment doesn't meet your requirements (you might need private cloud or dedicated hardware).


The point was that you want to avoid lock-in with your cloud provider. But upon reflection that wasn't really the point of the presentation. Developers have been trying to avoid vendor lock-in practically since the early days of computing science (although Ada Lovelace had few alternatives to Babbage's Analytical Engine).

The real point was slightly more abstract. It was simply, **keep your cloud provider honest**. If you can write code that works with different cloud providers, you can keep your switching costs down. If your switching costs are low and moving to another cloud is viable then all cloud providers are going to have to stay honest across all of the categories mentioned above.


## The Slides


I cover cloud portability in the first section of my slide deck. The remainder gets into the nuts and bolts (because I'm a nuts and bolts kind of guy) of effective cloud portability with multi-cloud toolkits.

[slideshare id=24524720&doc=cloudportabilitywithmulti-cloudtoolkits-130723005136-phpapp02]


## The Presentation


Likewise I cover cloud portability up until 9:26 of the video below. I understand if you don't watch the whole thing. ;)

http://www.youtube.com/watch?v=x9ONOwXGqRU


## Coda


Code is really only one aspect of cloud portability. The other major aspects are data and image portability and there are plenty of tools available to achieve portability for that stuff. If you're interested in cloud portability for your code and keeping your cloud providers honest, I recommend checking out the following projects:




  * [jclouds](http://jclouds.incubator.apache.org/) for Java


  * [pkgcloud](https://github.com/nodejitsu/pkgcloud) for node.js


  * [libcloud](http://libcloud.apache.org/) for Python


  * [fog](http://fog.io/) for Ruby


