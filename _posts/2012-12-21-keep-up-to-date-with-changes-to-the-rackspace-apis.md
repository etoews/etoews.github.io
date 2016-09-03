---
author: Everett Toews
comments: true
date: 2012-12-21 22:41:16+00:00
layout: post
slug: keep-up-to-date-with-changes-to-the-rackspace-apis
title: Keep Up-To-Date With Changes To The Rackspace APIs
image: /img/posts/rss.png
categories:
  - rackspace
---

<img class="img-right" src="/img/posts/rss.png"/>One of the trickiest parts of developing on top of an external service exposed via an HTTP API, like the [Rackspace Open Cloud API](docs.rackspace.com/api/), is keeping up to up-to-date with changes to the API. Since it's delivered as a web service it can change without you necessarily being aware of it. If a new feature is released, how would you know? If a change to an existing service is made and you could benefit from it by making an update to your code, how would you discover that?

<!--more-->

## How To Subscribe To The Changes

Any way you keep up-to-date with an API needs to be automatic. It's just not realistic to expect people to "check back often" in order to find out when something has changed.

My personal preference for such subscriptions is via [RSS](http://en.wikipedia.org/wiki/RSS)/[Atom](http://en.wikipedia.org/wiki/Atom_(standard)) feeds. To subscribe to this kind of syndication you'll need a feed reader. My feed reader of choice is [Google Reader](http://www.google.com/reader). There are many clients on many devices out there for it and the web app is pretty solid too.

Sometimes I feel like I'm the only person still subscribing to feeds. Seems like most people get their info from Twitter, Facebook, Google+, or whatever. For stuff I really want to know about I much prefer the direct subscription model of RSS/Atom to the endless torrent of Tweets and Updates, there's just a higher signal to noise ratio. But I digress.

## The Feeds

Here are the links to the feeds for each Rackspace Open Cloud API as culled from the [API docs](http://docs.rackspace.com/api/).

  * Servers: [Feed](http://docs.rackspace.com/servers/api/v2/cs-releasenotes/atom.xml) ([Release Notes](http://docs.rackspace.com/servers/api/v2/cs-releasenotes/content/ch_preface.html))
  * Files: [Feed](http://docs.rackspace.com/files/api/v1/cf-releasenotes/atom.xml) ([Release Notes](http://docs.rackspace.com/files/api/v1/cf-releasenotes/content/Dec05.html))
  * Block Storage - No Feed and Release Notes yet
  * Load Balancers: [Feed](http://docs.rackspace.com/loadbalancers/api/v1.0/clb-releasenotes/atom.xml) ([Release Notes](http://docs.rackspace.com/loadbalancers/api/v1.0/clb-releasenotes/content/doc_change_history.html))
  * Databases: [Feed](http://docs.rackspace.com/cdb/api/v1.0/cdb-releasenotes/atom.xml) ([Release Notes](http://docs.rackspace.com/cdb/api/v1.0/cdb-releasenotes/content/doc_change_history.html))
  * Networks: [Feed](http://docs.rackspace.com/servers/api/v2/cn-releasenotes/atom.xml) ([Release Notes](http://docs.rackspace.com/servers/api/v2/cn-releasenotes/content/ch_preface.html))
  * DNS: [Feed](http://docs.rackspace.com/cdns/api/v1.0/cdns-releasenotes/atom.xml) ([Release Notes](http://docs.rackspace.com/cdns/api/v1.0/cdns-releasenotes/content/doc_change_history.html))
  * Monitoring: [Feed](http://docs.rackspace.com/cm/api/v1.0/cm-releasenotes/atom.xml) ([Release Notes](http://docs.rackspace.com/cm/api/v1.0/cm-releasenotes/content/cmv1.0.a.html))
  * Identity: [Feed](http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/atom.xml) ([Release Notes](http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/content/Release_Notes-d1e140.html))
  * Service Registry: No Feed yet ([Release Notes](http://docs.rackspace.com/rsr/api/v1.0/sr-devguide/content/release-notes.html))

If you've signed up for a feed reader like Google Reader, when you click on a Feed link you should get a page asking you to subscribe with the reader of your choice. What this looks like will vary depending on what web browser and feed reader you're using.

Now you'll be up-to-date on each and every new change to the APIs as they're released!

## The SDKs

That's great for the APIs but what about the [Rackspace Open Cloud SDKs](http://docs.rackspace.com/sdks/guide/content/intro.html)? I hear you ask. Well you can find the release notes for the SDKs as follows.

  * Java: [Release Notes](http://www.jclouds.org/documentation/releasenotes/)
  * PHP: [Release Notes](https://github.com/rackspace/php-opencloud/blob/master/RELEASENOTES.md)
  * Python: [Release Notes](https://github.com/rackspace/pyrax/blob/master/RELEASENOTES.md)

Release notes are all well and good but where are the feeds? I hear you demand. Well the feeds aren't there quite yet. More below.

## Coda

As you can see we've got release notes and feeds for most stuff but not everything. That's not good enough. We need to have a consistent experience delivering updates on all of the APIs and SDKs you care about. There should also be additional subscription options so people can consume the updates however they want.

One of my goals for 2013 is to deliver this experience. To get you the updates you want, when you want them, and how you want them.
