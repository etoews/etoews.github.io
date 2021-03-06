---
author: Everett Toews
comments: true
date: 2019-01-18 10:00:00+00:00
layout: post
slug: 2019-01-18-microsoft-teams-norms
title: Microsoft Teams Norms
image: /img/posts/teams.png
---

<img class="img-right" src="{{ page.image }}"/>Face to face communication is essential. It's a necessary and irreplaceable form of communication. Chat also has numerous benefits. However, it's best to establish some norms around the use of chat to realise those benefits and avoid some of the pitfalls.

<!--more-->

<!-- TOC -->

* [Overview](#overview)
* [Norms](#norms)
* [Teams and Channels](#teams-and-channels)
* [Tips 'n Tricks](#tips-n-tricks)
    * [General](#general)
    * [Threads](#threads)
    * [Message Formatting](#message-formatting)
    * [Notifications](#notifications)
* [Getting Help](#getting-help)
* [Coda](#coda)

<!-- /TOC -->

## Overview

Here is a high level overview of those norms.

* Be mindful of people’s time and attention.
* Keep chats as public as possible.
* Use common courtesy. "Please" and "Thank you" still go a long way.
* Assume good intentions (tone doesn't travel well over chat) and asynchronous comms.
* Management must take care when to intervene (like any medium).

## Norms

These norms are shamelessly borrowed from the [GitLab Communication Handbook on Chat](https://about.gitlab.com/handbook/communication/#chat). I recommend reading through that doc, picking and choosing the ones that make the most sense for your org, and fitting them to your purpose.

* If you use chat, please use a public channel and mention the person or group you want to reach. This ensures it is easy for other people to chime in, involve other people if needed, and learn from whatever is discussed. Only use direct messages if the discussion is truly private and of no interest to anyone else.
* If the subject is of value to the wider community, consider commenting on an existing user story or opening a new user story and linking to that story in a relevant channel.
* Despite the instantaneous nature of chat, it should be considered asynchronous communication. Don't expect an instantaneous response; you have no idea what the other person is doing.
* If you must send a private message, don't start a conversation with "Hi" or "Hey" as that interrupts their work without communicating anything. If you have a quick question, just ask the question directly and the person will respond asynchronously. If you truly need to have a synchronous communication, then start by asking for that explicitly, while mentioning the subject. e.g. "I'm having trouble understanding issue #x, can we talk about it quickly?".
* Do not feel obligated to respond to chat messages when you are not working.
* Feel free to send a colleague a link to these guidelines if the communication in Teams should be done asynchronously.
* Please avoid using @General or @channel unless this is about something urgent and important. In chat try to keep the use of keywords that mention the whole channel to a minimum. They should only be used for pings that are both urgent and important, not just important. By overusing channel mentions you make it harder to respond to personal mentions in a timely manner since people get pinged too frequently.
* If something is important but not urgent - like complimenting or encouraging the entire team - use email or post in the channel without @-mentioning the team.
* If you are aware that your teammate is on vacation, avoid mentioning them in a high volume channel. It will be difficult to find the information or question when they return. If you need to ensure they refer back to the thread, ensure to send them a link to the relevant Teams message through a direct message.
* It's not rude to leave a channel. When you're no longer interested in the conversations happening in a channel, feel free to leave it so it won't distract you anymore.

## Teams and Channels

* Create a "random" channel. Naturally people feel chatty and that should be encouraged! The random channel is for discussing anything whatsoever: games, pets, kids, TV, haircuts, home repair, etc. It also helps keep the non-work chat in one place so it doesn't clutter up work chat and make it harder to find signal in the noise.
* User lowercase only for Channels and Teams with words separated by hyphens as Teams sorts by case then alphanumeric.
* When deciding whether to create a Channel or a Team, always lean towards creating a Channel:
    * If it is the same/similar context as an existing Team and doesn’t need privacy then create a Channel within the existing Team.
    * If it needs a smaller more private group then consider creating a Team.

## Tips 'n Tricks

Like any tool, it's necessary to learn at least some of the tip 'n tricks to be effective with it (and have a little more fun too).

### General

* [Brief introduction to Microsoft Teams](https://www.youtube.com/watch?v=FFQszYALS_A).
* General help can be found in [Chat in Microsoft Teams](https://support.office.com/en-us/article/chat-in-microsoft-teams-f3a917cb-1a83-42b2-a097-0678298703bb).
* There's a web app available at [teams.microsoft.com](https://teams.microsoft.com/).
* All keyboard shortcuts can be found under Profile > Keyboard shortcuts.
* Use Ctrl/Command + / to open the list of commands.

### Threads

* Every chat in Teams starts in a thread. Be conscious of where you're typing (especially if you're in the mobile app) to make sure you're responding to the right thread.
* If it's going to be a long running thread, you'll want to add a subject to it to make it easier to find when scrolling back through the chat history.
    <img src="/img/posts/teams-thread-subject.png"/>
* If you hover your mouse over any message, a few icons appear in the top right corner. Use the thumbs up icon to agree with someone without sending another message/notification to the channel.
* When your cursor is in the reply textbox, you can press the Up Arrow to edit your last message.

### Message Formatting

* When writing a message, you can [Use Markdown formatting in Teams](https://support.office.com/en-us/article/use-markdown-formatting-in-teams-4d10bd65-55e2-4b2d-a1f3-2bebdcd2c772).
* To share code, use ``` to start a multi-line code block or ` to start an inline code snippet.
* Sharing code as a screen shot is grounds for mockery.
* Use Shift+Enter to start a new line in a message rather than sending every line as a message (and a notification).
* You can insert an emoji by typing a `:` and then typing the name of the emoji.
* Links expand to show a preview of the page. You can remove these previews by clicking the X in the top right corner of the preview.

### Notifications

* If you're only referring to someone, but don't actually need their attention, and want to spare them from getting notified, spell out their name normally without @ mentioning them.
* You can manage your availability status under Profile.
* Manage your notifications (Profile > Settings > Notifications) carefully to avoid notification fatigue. Here's one example of notification settings that can help you get started.
    <img src="/img/posts/teams-notifications.png"/>

## Getting Help

* Don't just share the output of a command/process, include the command/process that generated the output. Context is crucial to debugging!
* Share direct links to things when possible rather than vaguely describing how to access something.
  * e.g. "read [my answer](https://stackoverflow.com/questions/26405380/how-do-i-correctly-setup-and-teardown-my-pytest-class-with-tests/39401087#39401087) on pytest" rather than "just go to that question on pytest and look around for my answer"
    <blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Just link people to stuff please. It&#39;s the HT in HTTP and HTML.</p>&mdash; Everett Toews (@etoews) <a href="https://twitter.com/etoews/status/723173231016833025?ref_src=twsrc%5Etfw">April 21, 2016</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
* Asking for help is a common and natural thing that _everyone_ does. You need help right away so if you can help others help you, everyone wins. Getting help from others is a bit different in chat so I wrote the guide [Help Others Help You]({% post_url 2020-01-28-help-others-help-you %}).

## Coda

It's easy to get started with chat. However, it's also just as easy to use it the wrong way. If you establish and reinforce some norms, it can be enormously beneficial to the whole organisation.
