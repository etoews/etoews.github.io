---
author: Everett Toews
comments: true
date: 2022-01-12 10:00:00+00:00
layout: post
slug: diagramming-is-a-solved-problem
title: Diagramming is a Solved Problem
image: /img/posts/drawio-logo.png
categories:
  - documentation
---
<img class="img-right" src="{{ page.image }}"/>There are numerous diagramming tools in the market and they all do a very good job of diagramming. However, almost all of them suffer from a _fundamental_ problem that makes the diagrams they produce much less valuable. They make it impossible to share a rendered version of the diagram (e.g. png or jpg) that is conveniently editable. [diagrams.net](https://www.diagrams.net/) has solved that problem brilliantly.

<!--more-->

<!-- TOC -->

* [Edit a Diagram](#edit-a-diagram)
* [Save an Editable Diagram](#save-an-editable-diagram)
* [Share an Editable Diagram](#share-an-editable-diagram)
* [Deploy app.diagrams.net](#deploy-appdiagramsnet)
* [Integrations](#integrations)
* [Coda](#coda)

<!-- /TOC -->

In software development and architecture, diagrams are enormously valuable as they can communicate an amazing amount of information at a glance. Nothing gets everyone on the same page like a good diagram. Like any documentation, diagrams can rapidly go out of date so it is absolutely essential that diagrams are conveniently editable.

Most of the time, diagrams are embedded in other documentation, whether it's a wiki, website, markdown, or something else. The version that is embedded is a rendered version of the diagram (e.g. png or jpg) so it can be displayed in any browser. Rarely is the editable version is included alongside the rendered version. The editable version has to be hunted down as it is typically stored elsewhere. You're lucky if you can find it, find a version of the diagramming tool to edit it, and acquire a license to even open the diagramming tool at all. With so many barriers, it's often impossible to update a diagram and most of its value is lost.

[diagrams.net](https://www.diagrams.net/) has solved that problem by embedding the editable version of a diagram _within_ the rendered version and making it convenient and free to edit it in [app.diagrams.net](https://app.diagrams.net/) (you can find the docs at [diagrams.net/doc/](https://www.diagrams.net/doc/)).

## Edit a Diagram

Imagine you've come across the diagram below in some documentation. Note that it's a png file being displayed in your browser. You can edit it right now using the instructions below.

<figure>
  <img class="img-centre" title="Save this diagram and open it in app.diagrams.net to edit" alt="Scaling Communication" src="/img/posts/scaling-communication.drawio.png"/>
  <figcaption style="text-align: center;">Scaling Communication<br/><sub>Save this diagram and open it in app.diagrams.net to edit</sub></figcaption>
</figure>

Instructions

1. Right-click on the diagram and choose "Save Image As..." (or equivalent in your browser)
1. Open [app.diagrams.net](https://app.diagrams.net/)
1. You'll be greeted with a dialog to "Save diagrams to:", choose Device
1. Choose Open Existing Diagram
1. Choose the diagram you just saved

You can now edit the diagram to your heart's content.

## Save an Editable Diagram

If your browser is capable and you've allowed it, app.diagrams.net will actually automatically save that diagram directly to your hard drive as you update it.

If you've created a diagram from scratch, you should know how to explicitly export a rendered version with the editable version embedded.

Instructions

1. Open [app.diagrams.net](https://app.diagrams.net/)
1. You'll be greeted with a dialog to "Save diagrams to:", choose Decide later
1. Edit the diagram to your heart's content
1. You can save an editable version two ways:
    1. File > Save as ...
        1. In the dropdown to the right of the filename, choose "Editable Bitmap Image (.png)"
        1. Click Download
    1. File > Export as > PNG ...
        1. Fill in the properties however you like
        1. Check "Include a copy of my diagram"
        1. Click Export

You now have a diagram that can be displayed anywhere and easily edited.

## Share an Editable Diagram

Because your diagram is already a rendered image, it is trivial to share. Just embed or send the image wherever you need to.

However, your diagram is already a rendered image, it is not obvious that it's also editable!

When sharing the diagram, be sure to include some indication that the diagram is editable (e.g. a caption).

For example, in a website like the diagram above you can use an img title attribute and/or a caption.

```html
<figure>
  <img class="img-centre"
       title="Save this diagram and open it in app.diagrams.net to edit"
       alt="Scaling Communication"
       src="/img/posts/scaling-communication.drawio.png"/>
  <figcaption style="text-align: center;">
    Scaling Communication
    <br/>
    <sub>
      Save this diagram and open it in app.diagrams.net to edit
    </sub>
  </figcaption>
</figure>
```

## Deploy app.diagrams.net

"But what if app.diagrams.net goes down for any reason? Maybe permanently! I won't be able to edit my diagrams!" I hear you say. It's true that could be a problem but it's definitely solvable.

The simplest solution for most people is to just [download the Desktop version](https://github.com/jgraph/drawio-desktop/releases), save it somewhere, install it, and use that.

Another option is to deploy the app.diagrams.net web application yourself. It's relatively easy if you already have a [GitHub](https://github.com/) account.

Instructions

1. Go to [github.com/jgraph/drawio](https://github.com/jgraph/drawio)
1. Click Fork (in the upper right corner)
1. In your forked repo, click Settings
1. Click Pages
1. In the Source section, choose Branch: dev
1. Click Save

A message will appear saying something like "Your site is published at [https://etoews.github.io/drawio/](https://etoews.github.io/drawio/)".

However, if you click the link, you'll only see the README.md from the repo. You need to append `src/main/webapp/` to the URL in your browser.

The full URL will be something like [https://etoews.github.io/drawio/src/main/webapp/](https://etoews.github.io/drawio/src/main/webapp/). An easily hosted version of app.diagrams.net!

## Integrations

[JGraph](https://www.diagrams.net/about), the company behind app.diagrams.net, provides an amazing base feature set for free. They also offers many paid [integrations](https://www.diagrams.net/integrations) to make using it easier for businesses. I wholeheartedly support this. If you belong to an organisation, I recommend looking these integrations to see if one fits your use case.

## Coda

In my opinion, [app.diagrams.net](https://app.diagrams.net/) solves a long-standing and fundamental problem with diagramming. You're able to embed an editable version of a diagram _within_ the rendered version and it's convenient and free to edit. Now there won't be any excuses from keeping all diagram up to date!
