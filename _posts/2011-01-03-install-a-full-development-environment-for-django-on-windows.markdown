---
author: Everett Toews
comments: true
date: 2011-01-03 00:27:00+00:00
layout: post
slug: install-a-full-development-environment-for-django-on-windows
title: Install a full development environment for Django on Windows
categories:
- django
- intellij idea
- pip
- postgres
- python
- windows
---

I recently installed a full development environment for Django on Windows 7 and found that it took longer than expected.  The path to getting everything working together wasn't immediately apparent.  I made a few missteps along the way and hopefully this post will make it a bit easier for the next developer.

The tools that I installed are:

  1. Python 2.7
  2. pip 0.8.2
  3. Postgres 9.0
  4. Django 1.3 Beta 1
  5. Intellij IDEA 10

## Python

Just go to the [Python download](http://www.python.org/download/) page and pick the version for you.  I installed Python to C:\dev\tools\python27.  Then I added C:\dev\tools\python27\Scripts and C:\dev\tools\python27 to my system PATH environment variable.

## pip

To me it appears as though packaging in Python is in a painful disarray/flux.  As far as I can tell [pip](http://pypi.python.org/pypi/pip) is the way to go for Python 2.x.  After reading [What's the proper way to install pip, virtualenv, and distribute for Python?](http://stackoverflow.com/questions/4324558/whats-the-proper-way-to-install-pip-virtualenv-and-distribute-for-python) I did the following to get pip installed.

  1. Download [http://python-distribute.org/distribute_setup.py](http://python-distribute.org/distribute_setup.py) to C:\dev\temp
  2. Ran command: cd C:\dev\temp
  3. Ran command: python distribute_setup.py
  4. Ran command: easy_install pip

Now that pip is installed we can:

  1. Install packages: pip install SomePackage
  2. Uninstall packages: pip uninstall SomePackage
  3. Upgrade packages: pip install --upgrade SomePackage
Plus a whole lot [more](http://pypi.python.org/pypi/pip).  For me, the above is already enough to choose pip over easy_install.

## Postgres

Go to the [Postgres download](http://www.postgresql.org/download/windows) page and install it.

Now you'll need a python-postgres database interface library.  For this we'll use psycopg.  Go to the [win-psycopg download](http://www.stickpeople.com/projects/python/win-psycopg/#Version2) page and pick the version that most closely matches your Windows/Python/Postgres versions.

Note that when you start a Django project you'll want to use django.db.backends.postgresql_psycopg2 for your database ENGINE value in your settings.py.

## Django

I wanted to take the latest beta release of Django for a spin so I didn't install it via pip.  However, when Django 1.3 is released on January 31, 2011 I'll definitely be installing it with pip.  Instead I more or less followed the [Quick install guide](http://docs.djangoproject.com/en/dev/intro/install/) for [Installing an official release](http://docs.djangoproject.com/en/dev/topics/install/#installing-official-release):

  1. Went to the [Django download](http://www.djangoproject.com/download/) page and grabbed the latest tar.gz
  2. Extracted it to C:\dev\temp with [7-Zip](http://www.7-zip.org/download.html)
  3. Ran command: cd C:\dev\temp\Django-NNN
  4. Ran command: python setup.py install

After that's done you'll want to [verify](http://docs.djangoproject.com/en/dev/intro/install/#verifying) your install and try the [tutorial](http://docs.djangoproject.com/en/dev/intro/tutorial01/).

While going through the tutorial I found that [django-admin.py startproject mysite [was] not working well on windows 7](http://stackoverflow.com/questions/2870262/django-admin-py-startproject-mysite-not-working-well-on-windows-7).  That's already been reported to the django project, see [http://bugs.python.org/issue7936](http://bugs.python.org/issue7936).  Here's a solution:

  1. Open regedit
  2. Find python.exe (for instance, under HKEY_CLASSES_ROOT\Applications\python.exe\shell\open\command)
  3. Change "C:\dev\tools\python27\python.exe" "%1" to  "C:\dev\tools\python27\python.exe" "%1" %*

I also stumbled onto a bug in Django on Windows, [Cannot load admin interface static files when doing tutorial](http://code.djangoproject.com/ticket/14961).  Painful but something that should be fixed in the next beta release.

## Intellij IDEA

Intellij IDEA has great support for Python and Django development.  If you're strictly doing Python development you could just download [PyCharm](http://www.jetbrains.com/pycharm/).  However, I already had [IDEA 10 ](http://www.jetbrains.com/idea/)already installed so I just added the [Python plugin](http://confluence.jetbrains.net/display/PYH/Python+Plugin+for+IntelliJ+IDEA) (essentially PyCharm) from File > Settings > Plugins.

To get IDEA working with an existing Django project (for instance, the Django tutorial) you have to jump through a few hoops.  I followed the instructions from [Using Intellij for Django Development](http://weichhold.com/2008/07/11/using-intellij-for-django-development/).

## Conclusion

It's a lot to do and a lot to configure but in the end it's worth it.  Python/Django development is fast, effective and the end result can be some easily maintainable code.

![](https://blogger.googleusercontent.com/tracker/8724979895766578389-7123272223327949300?l=phymata.blogspot.com)
