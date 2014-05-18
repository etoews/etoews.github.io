---
author: Everett Toews
comments: true
date: 2014-02-12 15:50:58+00:00
layout: post
slug: fixing-my-openstack-gerrit-problem
title: Fixing my OpenStack Gerrit Permission denied (publickey) problem
categories:
- git
- openstack
---

I was setting up a laptop to contribute some code to OpenStack according to the [Gerrit Workflow Account Setup](https://wiki.openstack.org/wiki/GerritWorkflow#Account_Setup). When I got to the point of doing the `git review -s` I hit the error

<!--more-->

    $ git review -s
    Problem running 'git remote update gerrit'
    Fetching gerrit
    Permission denied (publickey).
    fatal: Could not read from remote repository.

    Please make sure you have the correct access rights
    and the repository exists.
    error: Could not fetch gerrit
    Problems encountered installing commit-msg hook
    The following command failed with exit code 1
    "scp -P 29418 everett-toews@review.openstack.org:hooks/commit-msg .git/hooks/commit-msg"
    -----------------------
    Permission denied (publickey).
    -----------------------

Searching around I found [Permission denied (publickey)](https://review.openstack.org/Documentation/error-permission-denied.html) which was helpful in troubleshooting but didn't suggest an answer.

The solution was to let OpenSSH know where my private key was. I added the following to my ~/.ssh/config file.

    Host review.openstack.org
        IdentityFile /Box/Keys/id_rsa.openstack

Note: That should be a tab before the IdentityFile!
