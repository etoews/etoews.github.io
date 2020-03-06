---
author: Everett Toews
comments: true
date: 2020-02-18 10:00:00+00:00
layout: post
slug: semver-comparison-in-a-jenkins-pipeline
title: Semantic Version Comparison in a Jenkins pipeline
image: /img/posts/jenkins.png
categories:
  - devops
  - jenkins
  - pipeline
---
<img class="img-right" src="{{ page.image }}"/>Versioning is fundamental to reasoning about software development and deployment. It's not just the software that you release that needs to be versioned. All of the supporting components need to be versioned too, such as database schemas, message formats, protocols, APIs, dependencies, etc. If you don't version all of these components, you're at a severe disadvantage when it comes to understanding what's in a release or debugging a problem.

<!--more-->

<!-- TOC -->

* [Versions](#versions)
* [Install Jenkins](#install-jenkins)
* [Setup Jenkins](#setup-jenkins)
* [Configure Global Pipeline Libraries](#configure-global-pipeline-libraries)
* [Create Pipeline](#create-pipeline)
* [Configure Pipeline](#configure-pipeline)
* [Run Pipeline](#run-pipeline)
* [Pipeline Results](#pipeline-results)
* [Coda](#coda)

<!-- /TOC -->

<img class="img-right" src="/img/posts/version-all-the-things.jpg"/>One popular type of versioning is known as [semantic versioning](https://semver.org/) (semver). Semantic versioning is "a simple set of rules and requirements that dictate how version numbers are assigned and incremented." It allows people to communicate meaning using a particular format for the version they assign to the release of a component. Whether or not you're a fan of semver, it's very useful to have a well-known and commonly understood specification for your versions. It also makes it possible to compare one version with another of the same component.

Often times, the purpose of Jenkins pipelines is to deploy software. That is to say, to change the current version of a software component to the desired version. You may want to roll forward by increasing the version of the component, you may want to roll backward by decreasing the version of the component, or you may want to do nothing at all if the version hasn't changed. Depending on the component being deployed, you may need to take different actions based on whether the desired version is greater than, equal to, or less than the current version.

I've written the small library method [semver_compare](https://github.com/etoews/jenkins-semver-compare/blob/master/vars/semver_compare.groovy) that allows you to compare semantic versions in a Jenkins pipeline easily. What better way to learn how to use it than by trying it out right away!

## Versions

At the time of writing, the versions of all of the software used in this post are:

* Docker Desktop: 2.2.0.3
* Docker: 19.03.5
* Jenkins: 2.220

## Install Jenkins

To make it convenient to install Jenkins, I'm using [Docker Desktop](https://www.docker.com/products/docker-desktop) to get it up and running.

This command will run a Docker container in interactive mode (you'll be able to see the log output in your terminal) and the container will be removed when you kill the command with a Ctrl+C. However, any changes you make to Jenkins while it's running will be saved in the `jenkins_home` volume so you can always run it again and pick up where you left off.

```
docker run --interactive --tty --rm \
  --volume jenkins_home:/var/jenkins_home \
  --publish 8080:8080 --publish 50000:50000 \
  jenkins/jenkins:2.220-alpine
```

Open Jenkins at [http://localhost:8080/](http://localhost:8080/).

Note: If you want to start over from scratch, kill the command with Ctrl+C, delete the volume with `docker volume rm jenkins_home`, and run the command above again.

## Setup Jenkins

You'll need to go through a wizard to setup Jenkins.

1. On the Unlock Jenkins screen:
    * Find the password in the Jenkins log output under "Please use the following password to proceed to installation"
    * Enter the password into the Administrator password field
1. Click Install suggested plugins
1. On the Create First Admin User screen:
    * Username:	[pick-a-username]
    * Password: [pick-a-password]
    * Full name: [pick-a-full-name]
    * E-mail address: [pick-an-email-address]
1. On the Instance Configuration screen:
    * Jenkins URL: http://localhost:8080/

## Configure Global Pipeline Libraries

To make use of the method, you'll need to configure a [global pipeline library](https://jenkins.io/doc/book/pipeline/shared-libraries/).

1. Click [Manage Jenkins](http://localhost:8080/manage)
1. Click [Configure System](http://localhost:8080/configure)
1. Scroll down to the Global Pipeline Libraries section and click Add
    1. Name: semver-compare-lib
    1. Default version: master
    1. Load implicitly: Unchecked
    1. Allow default version to be overridden: Checked
    1. Include @Library changes in job recent changes: Unchecked
    1. Retrieval method: Modern SCM
    1. Source Code Management: Git
    1. Git: https://github.com/etoews/jenkins-semver-compare.git
1. Save

## Create Pipeline

Create a pipeline to run the example pipeline.

1. Click [New Item](http://localhost:8080/view/all/newJob)
    1. Enter an item name: semver-compare
    1. Click Pipeline
1. OK

## Configure Pipeline

Configure the example pipeline.

1. Scroll down to the Pipeline section
    1. Definition: Pipeline script from SCM
    1. SCM: Git
    1. Repository URL: https://github.com/etoews/jenkins-semver-compare.git
1. Save

## Run Pipeline

On the Pipeline screen:

1. Click Build Now
1. Wait a moment for the pipeline to complete
1. Under Build History click #1
1. Click Console Output

## Pipeline Results

The pipeline result is the output of running this [Jenkinsfile](https://github.com/etoews/jenkins-semver-compare/blob/master/Jenkinsfile).

First of all, notice how the Jenkinsfile itself is using a particular version of the global pipeline library with the line `@Library('semver-compare-lib@1.0.0')` at the very top. Version all the things!

Then the pipeline runs through successive version comparisons. Some output is printed based on whether the desired version is greater than, equal to, or less than the current version. If you were to use this in your own pipeline, you could take different actions depending on each case.

Finally, the last pair of versions don't conform to the semver specification. Some error handling is invoked and a helpful error message is printed.

## Coda

Versioning your software components is absolutely fundamental to running a stable and resilient system that can be reasoned about. Using semantic versioning has many advantages including the ability to compare one version with another of the same component. This post showed you how you can easily make those comparisons in a Jenkins pipeline. Go ahead and give it a try in your own pipelines.

Note: The library method uses [SemanticVersion.groovy](https://github.com/etoews/jenkins-semver-compare/blob/master/src/io/github/etoews/SemanticVersion.groovy) to do the comparison. The source code for that class was copied from [How to implement a single class Java parser for semantic versioning with correct precedence ordering](https://raccoon.onyxbits.de/blog/single-class-java-semantic-versioning-parser-implementation/) with my own alterations to make it work in a Jenkins pipeline. The source code was copied and modified as permitted by the [MIT License](https://en.wikipedia.org/wiki/MIT_License). My thanks go out to the original author Patrick Ahlbrecht.
