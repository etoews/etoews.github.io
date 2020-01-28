---
author: Everett Toews
comments: true
date: 2020-01-28 10:00:00+00:00
layout: post
slug: help-others-help-you
title: Help Others Help You
image: /img/posts/rubber-duck.png
categories:
  - documentation
---
<img class="img-right" src="{{ page.image }}"/>Asking for help is a common and natural thing that _everyone_ does. You need help right away so if you can help others help you, everyone wins. Getting help from others is a skill that can be learned and refined over time.

<!--more-->

* [Search for solutions](#search-for-solutions)
* [Communicate the Problem in Public](#communicate-the-problem-in-public)
* [Provide Context](#provide-context)
* [Isolate the Problem](#isolate-the-problem)
* [Solve the Problem Loudly](#solve-the-problem-loudly)
* [Related Work](#related-work)
* [Coda](#coda)

## Search for solutions

Maybe it goes without saying but starting out by searching for a solution yourself is a must.

Try to find a unique string in any error messages you're getting and use that as your search terms.

Some targets for your search:

* source code if it's available
* product documentation
* chat history (Slack/Teams/IRC)
* good ol' [stackoverflow.com](https://stackoverflow.com/)
* good ol' [google.com](https://www.google.com/)

## Communicate the Problem in Public

I'm passionate about sharing knowledge and problem solving in public is an essential piece of that.

If someone asks me for help in a direct message (DM) in chat, I often reply like this.

> Please ask these kinds of questions in a public channel (like #X or #Y) and I'll answer you there. That way the knowledge is shared widely, more people get on the same page, and it gives others the chance to chip in with answers.

Always encouraging people to ask questions in public normalises the behaviour and works to remove any stigma associated with seeking help publicly. If you need help with something, there's an excellent chance someone else needs that exact same help. In my opinion, confining the help to DMs hinders the growth of the person and the organisation as a whole.

That's my general rule of thumb. However, if there are people who will only ask for help in private or not at all then of course go ahead and help them in private. Continue to encourage them to open up for their own benefit and the benefit of everyone else.

And if the same problem requires help time and time again, it's probably time to document it or solve the problem permanently!

## Provide Context

Providing context is crucial to getting help effectively.

Said another way, there are no dumb questions but there are incomplete questions. 😉 

### Link

Whenever possible, share a link to the exact thing you need help with. Whether it's source code, logs, or something else. Giving someone a link they can click on to take them to the location of the problem saves so much time and effort. That said, share the link but save them a click and include the text in question in chat too.

<img src="/img/posts/help-others-help-you-1.png"/>

### Output

When sharing the output of a command, always include the full command (including host info). Knowing the input that generated the output is another huge time saver.

```
[etoews@jenkins.example.com ~ ]$ ping example.com
PING example.com (93.184.216.34) 56(84) bytes of data.
^C
--- example.com ping statistics ---
4 packets transmitted, 0 received, 100% packet loss, time 2999ms
```

### Screenshots

If you're sharing screenshots, annotate the screenshot to be explicit about what you need help with.

<img src="/img/posts/help-others-help-you-2.png"/>

### Logs

Logs are usually fundamental to problem solving. Remember that you can often increase logging verbosity in many system and tools to get more output. It can be a double edged sword because it can make it harder to find signal in the noise but usually more info is better. And if you've increased the logging verbosity in a running system, remember to decrease it after the debugging is done!

## Isolate the Problem

Isolating the problem can severely reduce the time it takes to help you.

Let others know what you've tried already. That gives them more information and can stop them from chasing a red herring.

If you can reproduce the problem reliably and provide the steps to do so, you're already most of the way to solving it. Those steps will help others get up to speed quickly and get you the help you need.

Even isolating the problem at a coarse level can be beneficial. Providing information about whether it's the database, network, API, or some other layer or component can save time.

## Solve the Problem Loudly

Others may not be help right away but if you keep writing out the debugging steps you're doing in chat, it can be a big benefit to yourself (you're basically [rubber duck debugging](https://en.wikipedia.org/wiki/Rubber_duck_debugging)) and others when they have time to help. You might even be able to solve the problem and be the one who helps whoever comes along next!

Whatever happens, make sure the resolution gets recorded. Don't leave the debugging thread dangling. There's a good chance your future self will thank you.

Don't be afraid to post to [stackoverflow.com](https://stackoverflow.com/) if you can't find the answer within your four walls.

## Related Work

* Julia Evans: [How to ask good questions](https://jvns.ca/blog/good-questions/)
* Jon Skeet: [Writing the perfect question](https://codeblog.jonskeet.uk/2010/08/29/writing-the-perfect-question/)
* Myself: [Write That Request For Help, But Don't Send It...Yet]({% post_url 2012-12-10-write-that-request-for-help-but-dont-send-it-yet %})
* StackOverflow: [How do I ask a good question?](https://stackoverflow.com/help/how-to-ask)
* [rubber duck debugging](https://en.wikipedia.org/wiki/Rubber_duck_debugging))

## Coda

It's not always easy asking for help. It's not always easy giving help. But if you meet in the middle, it can be a huge benefit for everyone. Not only to those directly involved but also to those following the chat and searching for answers at a later date.
