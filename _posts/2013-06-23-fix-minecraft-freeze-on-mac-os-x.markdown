---
author: Everett Toews
comments: true
date: 2013-06-23 21:54:00+00:00
layout: post
slug: fix-minecraft-freeze-on-mac-os-x
title: Fix Minecraft Freeze on Mac OS X
categories:
- minecraft
---

<img class="img-right" src="/img/posts/minecraft-grass.png"/>I had an intermittent problem where Minecraft would freeze up on my Mac and just stop working. I would take anywhere from five to thirty seconds to unfreeze before I could start playing again. Some of the longer pauses would seem like a crash but it always eventually resumed. It was a nasty bug and extremely frustrating.

The root cause seems to be [this bug](http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=7180557) in the JVM by Oracle for Mac OS X. The workaround is relatively simple. You need to add your hostname to the /etc/hosts file. This requires using the Terminal but it's really pretty easy.

1. Open Applications > Utilities > Terminal.
2. Copy and paste the following command into the Terminal. This command appends your hostname to the /etc/hosts file and maps it to the IP address 127.0.0.1 (localhost).  It will ask you for your password because you're changing a system file.
    * `sudo bash -c "echo 127.0.0.1 $HOSTNAME >> /etc/hosts"`
3. Restart your Mac.

If that bug has been the cause of your freezes, hopefully this helps!
