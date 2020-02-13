---
author: Everett Toews
comments: true
date: 2019-04-16 10:00:00+00:00
layout: post
slug: gitops-driven-deployments-on-openshift
title: GitOps Driven Deployments on OpenShift
image: /img/posts/git.png
categories:
  - git
  - ops
  - openshift
  - platform
---
<img class="img-right" src="{{ page.image }}"/>Our industry is determined to deliver value ever more rapidly, safely, and securely across software development lifecycle environments. One way to achieve this is through GitOps. In broad terms, GitOps is about applying the Git feature workflow to operations. I took this idea and narrowed it down to exactly one use case, using Git to drive deployments on OpenShift. This is a walk-through of the concepts and components we used to enable GitOps driven deployments all the way from development to production for a real-world enterprise client deploying a payroll solution known as EdPay.

<!--more-->

## GitOps

Another way to define GitOps is by applying a developer experience (DX) to operations. Developer Experience for APIs, SDKs, CLIs, and documentation tend to take up all of the oxygen in the room, however I propose DX for operations is an idea whose time has come. What speaks more to the experience of being a developer than interacting with Git all day. It's natural to extend that interaction and apply it to operations as well.

GitOps follows this flow across four major actors to drive deployments on OpenShift:

1. Users
1. Git
1. Pipelines
1. Environments

Underlying the pipelines and environments is OpenShift. Conceivably you could also run Git on OpenShift but that was not the case at this client.

## Users

The users of this system are the people either proposing or merging a change to an environment (env). For example, a developer has completed a feature and produced version 1.2.3 of an API service in a development environment. Once that feature is ready for testing, the developer proposes version 1.2.3 of that API service to a test env via a pull request. The test env owner reviews the pull request, approves it, and merges it. The merge fires a webhook that kicks off the pipeline run that deploys version 1.2.3 of that API service to the test env.

## Git

Naturally, Git provides source control but it also provide excellent access control and audit capabilities. In Git we have two types of repositories (repos).

Environment repos contain the configuration and versions for the services in a particular env (e.g. prod). The env repos also contain all of the settings for the repo itself to enable GitOps. This is achieved by setting repository and branch permissions, pull request rules and reviewers, and webhooks.

Service repos container the source code of the services that compose the application(s) running in the env. Depending on how your platform creates conatiner images, the source code may be laid out in a certain structure (e.g. [Source-to-Image](https://docs.okd.io/latest/creating_images/s2i.html)). It can also contain deployment artifacts particular to the service such as a [DeploymentConfig](https://docs.okd.io/latest/architecture/core_concepts/deployments.html#deployments-and-deployment-configurations), [ConfigMap(s)](https://docs.okd.io/latest/dev_guide/configmaps.html), and [Jenkinsfile](https://jenkins.io/doc/pipeline/tour/hello-world/).

## Pipelines

Pipelines are a sequence of steps executed in Jenkins, running on OpenShift. As input, pipelines consume environment configuration and source code from Git. As output, pipelines produce container images and deployments of the EdPay application for an environment. For day to day development, the pipelines can be considered as your interface to the OpenShift Container Platform.

There are two types of pipelines and one type of build:

* Env Pipeline: Orchestrates the deployment of the entire EdPay stack and follows a `deploy-<env>` naming convention (e.g. `deploy-dev-03-master`).
* Service Pipeline: Builds and deploys a specific service from a container image and follows a `deploy-<service>` naming convention (e.g. `deploy-edpay-services`).
* Image Build: A build of a service produces a container image stored in the registry and follows a `build-<service>` naming convention (e.g. `build-edpay-services`).

## Environments

An environment (an OpenShift project) is a combination of running services and configuration, primarily, specific versions of the running services and the DB to which they are configured to connect. Each environment contains its own instances of all of the services that make up the EdPay application.

There are two types of environments:

* Dev Envs: Build images and deploy services.
* Higher Envs: Deploy services from existing images (prod is just another higher env with the exception that the images must be copied to the prod cluster first).

The primary differentiator is that dev envs do the builds that create the container images for all of the services in the stack. Dev master and dev stable are where all application builds take place. All envs do deployments of these container images.

It's worth noting that the environment itself is versioned. Ultimately, the environment is just another application dependency.

## OpenShift

<img class="img-right" src="/img/posts/openshift.png"/>There are two OpenShift clusters, one for production and one for non-production. The production cluster only has a staging and a prod environment. The non-production cluster has all other environments, including dev, test, demo, and pre-prod. Again, the only difference between the staging/prod pipelines from the other higher env pipelines is that the images must be copied to the prod cluster first.

## Presentation

The deck below is a walk-through of the concepts and components used to enable the GitOps driven deployments described above.

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vRz99WnL0jDLvVSZO_yTEX4vbatKjEX3KnUtVGOg2vTvm2RmVRNrAxxG7oqROCNklr_yaNj1k9vUVsJ/embed?start=false&loop=false&delayms=999999999" frameborder="0" width="750" height="445" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

Because there are a fair number of concepts and components at play, I also did a screencast to explain the system.

<iframe width="750" height="420" src="https://www.youtube.com/embed/4mk0Q4UyNjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Coda

<p class="note"><strong>Note:</strong> Always set <a href="https://docs.okd.io/latest/dev_guide/compute_resources.html#dev-compute-resources">limits on compute resources</a>. Always! We learned this one the hard way when we deployed <a href="https://www.jaegertracing.io/">Jaeger Tracing</a> on OpenShift and it began to cause node instability. My solution was to <a href="https://github.com/jaegertracing/jaeger-openshift/pull/102">add max traces and compute resource parameters</a> to the Jaeger Tracing OpenShift all-in-one template.</p>

The ideas and concepts for a system like this have been rattling around in my head for a long time. It's been great getting the opportunity to build it out. I had assistance from a few people around me at the client that worked hard to bring this to life. Without their help and support this wouldn't have been possible and my thanks go out to them.

Update: I've also written a general definition that [GitOps is Reconciling a Desired State in Git with a Runtime Environment]({% post_url 2019-11-07-gitops-is-applying-desired-state-from-git %}).
