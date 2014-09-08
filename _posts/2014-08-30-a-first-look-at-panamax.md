---
author: Everett Toews
comments: true
date: 2014-08-30 14:00:00+00:00
layout: post
slug: a-first-look-at-panamax
title: A First Look at Panamax
image: /img/posts/panamax.png
categories:
- docker
---

<img class="img-right" src="/img/posts/panamax.png"/>Panamax is billed as Docker management for humans. In its current form it's basically a web application (both with a UI and API) running on a CoreOS host where you can stitch containers together using a GUI to create a working application architecture. Then you're able to save Panamax templates that represent that architecture. It seems the idea is that you should be able to use Docker and its ecosystem tooling via this GUI rather than via the Docker CLI/API. It's still early days for Panamax and it has a ways to go before delivering on its "Docker management for humans" billing.

<!--more-->

I confess I got motivated to look into Panamax by their [app template challenge](http://panamax.io/contest). The specs on those Mac Pros are decent. :) It was also a great excuse to kick the tires on some new technologies that I haven't had a chance to touch yet.

It's definitely still early days for Panamax. The focus of the contest was to create app templates and I understand why the CenturyLink team did that to help drive adoption. However, what I really appreciated about this contest was also the emphasis on feedback and suggestion. Whenever I come across something like this I tend to look at it from the developer experience (DX) perspective. Encouraging feedback is a big part of DX.

So on that note, here's some constructive criticism across several aspects.

## Learning

Panamax has great potential for helping developers learn Docker and its ecosystem tooling. At some point developers will want to automate all the things and if they know the Panamax and Docker API/CLI, it will make it that much easier. But Panamax can do better at teaching Docker to developers by displaying the Docker commands being executed. Vote for the feature at [display the Docker command being executed](http://feedback.panamax.io/forums/260899-general/suggestions/6343899-display-the-docker-command-being-executed). _Update: This feature has been accepted and work has begun on it!_

Learning Panamax itself is non-trivial and to gain widespread adoption it needs to guide users through how to use it. I'm thinking of exemplars like [Slack](https://slack.com/) and [Activator](https://typesafe.com/activator) and how they hold the hand of the developer until they're proficient with the new technology. I realize this is a tall order for any web application and it takes a lot of user experience design to get it right.

## Documentation

Much of the "documentation" for learning Panamax is done as videos. Personally I don’t learn from video tutorials very well. I find it awkward to try to navigate a step-by-step process in a video. Constantly pausing, rewinding, and resuming is painful. Not being able to see or copy exactly what's being typed is frustrating. I know some people learn well from videos but it just doesn't work for me (and I know many others who feel the same). Providing text based documentation in addition to videos is a necessity.

The text documentation is on a GitHub wiki so it's easy to change and that's good. But the [Installing Panamax](https://github.com/CenturyLinkLabs/panamax-ui/wiki/Installing-Panamax) guide isn't particularly well organized and it could better curated. The docs might be better served by the team creating a GitHub Pages site and accepting pull requests to change their docs. I'm a big fan of a combination of GitHub's [Creating Project Pages manually](https://help.github.com/articles/creating-project-pages-manually) and [Jekyll](http://jekyllrb.com/) for this use case.

Nonetheless, I did add [installation instructions for Rackspace](https://github.com/CenturyLinkLabs/panamax-ui/wiki/Installing-Panamax#rackspace). ;)

## Docker

A lot of Docker knowledge is still assumed. I realize you probably can't completely abstract away everything but the contextual help was directly referring to Docker switches. e.g. "Panamax currently supports port binding (-p) and port expose (--expose)." If you aren't familiar with Docker, that's not a lot of help and you wind up searching the Docker documentation for exactly what those things do. It would be better if things were explained as concepts first and how those concepts tie into Docker, including links to the relevant Docker docs.

Every time I went to construct an application, I found myself searching for exactly how the underlying containers were built with the Dockerfile. Making it easy to find the Dockerfile that an container is based on would be a huge help. From the search page, a link to the Dockerfile itself would make it easy. I know this isn't always possible, due to the lack of information in the registry of some Dockerfile authors. <del>Vote for the feature (already suggested by someone else) at [Show a link to a Docker hub images' Dockerfile in the Application view](http://feedback.panamax.io/forums/260899-general/suggestions/6288993-show-a-link-to-a-docker-hub-images-dockerfile-in)</del>. _Update: That feature was declined in favour of supporting docker inspect._

## Templates

Apparently the only way you can save a template is to have Panamax merge it directly to a GitHub repo. This is an odd choice and it makes it very difficult to work with templates. You should be able to save/load a template to a directory on your local machine and handle the interaction with GitHub yourself.

The process of editing an existing template is non-intuitive. Sure you can search for a template, run it, change it, but if you go to save it, you're creating a new one instead of the existing one. _Unless_ you happen to type in the same name as before, in which case a new version is committed over the old version. A better idea would be to  make it explicit on the "Save as Template" screen that to edit a template you have to give it the same name. You could even default the Template Name to the previous name or provide an optional drop down of all of the templates in that repo or some other mechanism. Vote for the feature at [Make template editing more intuitive](http://feedback.panamax.io/forums/260899-general/suggestions/6368125-make-template-editing-more-intuitive).

The [Jenkins template](https://github.com/CenturyLinkLabs/panamax-contest-templates/blob/master/jenkins_everett-toews.pmx) I created for the contest is very basic. It just installs Jenkins using the official Jenkins Docker Image pinned to version 1.574 running on port 80.

## The Good Stuff

As I said, it's definitely still early days for Panamax but they're headed in the right direction. The install for the Mac was painless and that's such a crucial piece of the puzzle. Sure it was due in part to me already having brew installed but I think you can count on that for most devs using a Mac. Also, searching for Templates and Images is snappy and you can get something running directly from the search results. Nice.

## Coda

All of this feedback and these suggestions are based on Panamax 0.1.1 and version 0.1.2 is already out! The team got [42 ideas](http://feedback.panamax.io/) from the community on their Uservoice account so I'd say they were pretty successful in that regard. Best of luck to the project team and I'm looking forward to seeing how the project matures.
