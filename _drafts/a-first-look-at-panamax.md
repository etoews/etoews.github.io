---
author: Everett Toews
comments: true
date: 2014-08-25 14:00:00+00:00
layout: post
slug: a-first-look-at-panamax
title: A First Look at Panamax
image: /img/posts/pedestrian-sign.jpg
categories:
- docker
---

<img class="img-right" src="/img/posts/pedestrian-sign.jpg"/>Panamax is billed as Docker management for humans. In its current form it's basically a web application (both with a UI and API) running on a CoreOS host where you can stitch containers together using a GUI to create a working application architecture. Then you're able to save Panamax templates that represent that architecture. It seems the idea is that you should be able to use Docker and its ecosystem tooling via this GUI rather than via the Docker CLI/API. It's still early days for Panamax and it has a ways to go before delivering on its "Docker management for humans" billing.

<!--more-->

I confess I got motivated to look into Panamax by their [app template challenge](http://panamax.io/contest). The specs on those Mac Pros are decent. :) It was also a great excuse to kick the tires on some new technologies that I haven't had a chance to touch yet.

It's definitely still early days for Panamax. The focus of the contest was to create app templates and I understand why the CenturyLink team did that to help drive adoption. However, what I really appreciated about this contest was also the emphasis on feedback and suggestion. Whenever I come across something like this I tend to look at it from the developer experience perspective. Encouraging feedback is a big part of DX.

So on that note, here's some constructive criticism across several aspects.

## Docker

lots of docker knowledge still assumed
you can’t completely abstract away everything
making it easy to find the Dockerfile that an application is based on would be a huge help

## Templates

only option to create templates to GitHub is awkward
can’t edit templates
my template

## Learning

i don’t learn from video tutorials

## Panamax

feedback like slack or https://typesafe.com/activator
insecure!

## The Good Stuff

jenkins dir problem
volumes from (--volumes-from)

